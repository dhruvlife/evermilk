import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:milkride/core/constant/app_strings.dart';
import 'package:milkride/core/routes/routes_name.dart';
import 'package:milkride/core/secrets/api_strings.dart';
import 'package:milkride/core/storage/storage_key.dart';
import 'package:milkride/core/storage/storage_object.dart';
import 'package:milkride/core/utils/app_functional_components.dart';
import 'package:milkride/feature/cart/domain/entities/common_response.dart';
import 'package:milkride/feature/wallet/domain/entities/payment_response.dart';
import 'package:milkride/feature/wallet/domain/repository/wallet_repository.dart';
import 'package:milkride/feature/wallet/domain/usecase/pay_online_usecase.dart';
import 'package:milkride/feature/wallet/domain/usecase/payment_request_usecase.dart';
import 'package:milkride/feature/wallet/domain/usecase/verify_payment_usecase.dart';
import 'package:milkride/feature/wallet/presentation/cubit/wallet/wallet_cubit.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  final VerifyPaymentUsecase verifyPaymentUsecase;
  final PaymentUsecase paymentUsecase;
  final PaymentRequestUsecase paymentRequestUsecase;
  final dateController = TextEditingController(
    text: DateFormat('yyyy-MM-dd').format(DateTime.now())
  );
  int selectedAmount = 1;
  final amountController = TextEditingController(text: '1');
  late Razorpay _razorpay;

  PaymentCubit({
    required this.verifyPaymentUsecase,
    required this.paymentUsecase,
    required this.paymentRequestUsecase
  }) : super(PaymentInitial()) {
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  Future<void> pickDate() async {
    DateTime? picked = await showDatePicker(
      context: Get.context!,
      initialDate: DateTime.now(),
      firstDate: DateTime(2022),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      final formatted = DateFormat('yyyy-MM-dd').format(DateTime.now());
      dateController.text = formatted;
      emit(PaymentDateSelected(date: formatted));
    }
  }

  void selectAmount(int amount) {
    selectedAmount = amount;
    amountController.text = amount.toString();
    emit(PaymentAmountSelected(amount));
  }

  void updateAmountFromText(String text) {
    selectedAmount = int.tryParse(text) ?? 0;
    emit(PaymentAmountSelected(selectedAmount));
  }

  Future<void> fetchPaymentResponse() async {
    final amountText = amountController.text.trim();
    if (amountText.isEmpty || int.tryParse(amountText) == null) {
      emit(PaymentError(messege: AppStrings.validAmount));
      return;
    }
    final amount = int.tryParse(amountText)!;
    if (amount < 1) {
      emit(PaymentError(messege: AppStrings.minAmount));
      AppFunctionalComponents.showSnackBar(message: AppStrings.minAmountAdd);
      return;
    } else if (amount > 6000) {
      emit(PaymentError(messege: AppStrings.maxAmount));
      AppFunctionalComponents.showSnackBar(message: AppStrings.maxAmountAdd);
      return;
    }
    Get.context?.loaderOverlay.show();
    final customerId = StorageObject.readData(StorageKeys.customerId)?.toString();
    if (customerId == null) {
      emit(PaymentError(messege: AppStrings.customerNotFound));
      return;
    }
    final result = await paymentUsecase.call(PayOnlineParam(
      amount: amountText,
      customerId: customerId,
    ));
    result.fold(
      (failure) => emit(PaymentError(messege: failure.messege)),
      (response) {
        if (response.status == AppStrings.success) {
          emit(PaymentLoaded(paymentResponse: response));
          _openRazorpayCheckout(response);
        } else {
          emit(PaymentError(messege: AppStrings.paymentInitFailed));
        }
      },
    );
    Get.context?.loaderOverlay.hide();
  }

  void _openRazorpayCheckout(PaymentResponse response) {
    Get.context?.loaderOverlay.show();
    final amountInPaise = int.parse(amountController.text) * 100;
    if (response.data?.orderId == "") {
      emit(PaymentError(messege: AppStrings.orderIdNotFound));
      return;
    }
    final options = {
      'key': ServerConfig.razorPayKey,
      'amount': amountInPaise,
      'name': response.data?.customerName ?? "",
      'description': 'Payment for service',
      'order_id': response.data?.orderId ?? "",
      'prefill': {
        'contact': StorageObject.readData(StorageKeys.mobileNumber),
      },
      'external': {
        'wallets': ['paytm']
      }
    };
    try {
      _razorpay.open(options);
    } catch (e) {
      emit(PaymentError(messege:AppStrings.errorRazorPay+e.toString()));
    }
    Get.context?.loaderOverlay.hide();
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) async {
    final orderId = response.orderId;
    final paymentId = response.paymentId;
    if ((orderId == null || orderId.isEmpty) || (paymentId == null || paymentId.isEmpty)) {
      emit(PaymentError(messege: AppStrings.invalidPayment));
      return;
    }
    Get.context?.loaderOverlay.show();
    try {
      await fetchVerifyPayment(orderId: orderId, transactionId: paymentId);
    } catch (e) {
      emit(PaymentError(messege: AppStrings.errorVerifyPayment+e.toString()));
    }
    Get.back();
    Get.context?.loaderOverlay.hide();
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    emit(PaymentError(messege: "${AppStrings.paymentFailed} ${response.message ?? AppStrings.unExpectedError}"));
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    print("${AppStrings.extWalletSelect}: ${response.walletName}");
  }

  Future<void> fetchVerifyPayment({
    required String orderId,
    required String transactionId,
  }) async {
    final customerId = StorageObject.readData(StorageKeys.customerId)?.toString();
    if (customerId == null) {
      emit(PaymentError(messege: AppStrings.customerNotFound));
      return;
    }
    Get.context?.loaderOverlay.show();
    final result = await verifyPaymentUsecase.call(
      VerifyPaymentParam(
        customerId: customerId,
        orderId: orderId,
        transactionId: transactionId,
      ),
    );
    result.fold(
      (failure) => emit(PaymentError(messege: failure.messege)),
      (response) async{
        final walletCubit = Get.context?.read<WalletCubit>();
        if (response.status == AppStrings.success) {
          emit(PaymentVerifyLoaded(commonResponse: response));
          await walletCubit?.getWalletResponse();
          Get.toNamed(RoutesName.wallet);
          AppFunctionalComponents.showSnackBar(message: response.message.toString());
        } else {
          emit(PaymentError(messege: AppStrings.payVerifyFailed));
        }
      },
    );
    Get.context?.loaderOverlay.hide();
  }

  Future<void> requestCash() async {
    final customerId = StorageObject.readData(StorageKeys.customerId)?.toString();
    if (customerId == null) {
      emit(PaymentError(messege: AppStrings.customerNotFound));
      return;
    }
    Get.context?.loaderOverlay.show();
    final result = await paymentRequestUsecase.call(
      PaymentRequestParam(amount: amountController.text, customerId: customerId, date: dateController.text)
    );
    result.fold(
      (failure) => emit(PaymentError(messege: failure.messege)),
      (response) async{
        final walletCubit = Get.context?.read<WalletCubit>();
        if (response.status == AppStrings.success) {
          emit(PaymentVerifyLoaded(commonResponse: response));
          await walletCubit?.getWalletResponse();
          Get.back();
          Get.toNamed(RoutesName.wallet);
          AppFunctionalComponents.showSnackBar(message: response.message.toString());
        } else {
          emit(PaymentError(messege: AppStrings.payReqFailed));
        }
      },
    );
    Get.context?.loaderOverlay.hide();
  }

  @override
  Future<void> close() {
    _razorpay.clear();
    amountController.dispose();
    dateController.dispose();
    return super.close();
  }
}
