import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:milkride/core/constant/app_strings.dart';
import 'package:milkride/core/routes/routes_name.dart';
import 'package:milkride/core/utils/app_functional_components.dart';
import 'package:milkride/feature/home/presentation/cubit/home_cubit.dart';
import 'package:milkride/feature/order/domain/usecase/order_cancel_usecase.dart';
import 'package:milkride/feature/order/domain/usecase/order_get_usecase.dart';
import 'package:milkride/feature/order/domain/usecase/order_place_usecase.dart';
import 'package:milkride/feature/order/presentation/cubit/order_state.dart';
import 'package:milkride/feature/order/presentation/screen/order_screen.dart';
import 'package:milkride/service.dart/injection.dart';

class OrderCubit extends Cubit<OrderState> {
  final OrderUsecase orderUsecase;
  final OrderGetUsecase orderGetUsecase;
  final OrderCancelUsecase orderCancelUsecase;
  final customerId = getIt<HomeCubit>().userData?.id ?? 0;
  late List<DateTime> _dates;

  OrderCubit({
    required this.orderUsecase,
    required this.orderGetUsecase,
    required this.orderCancelUsecase,
  }) : super(OrderInitial()) {
    initDateRange();
  }

  void initDateRange() {
    final now = DateTime.now();
    selectDate(date: now);
  }

  void selectDate({required DateTime date}) {
    _dates = List.generate(15, (i) => date.subtract(Duration(days: 7 - i)));
    fetchOrdersForDate(date);
  }

  void fetchOrdersForDate(DateTime date) async {
    emit(OrderLoading());
    final formattedDate = DateFormat('yyyy-MM-dd').format(date);
    final result = await orderGetUsecase(OrderCheckParam(
      deliveryDate: formattedDate,
      customerId: customerId,
    ));

    result.fold(
      (failure) {
        emit(OrderError(message: failure.messege));
        AppFunctionalComponents.showSnackBar(message: failure.messege);
      },
      (response) {
        emit(OrderLoaded(
          orderResponse: response,
          dates: _dates,
          selectedDate: date,
        ));
        if (response.message == AppStrings.orderFound) {
        } else {
          AppFunctionalComponents.showSnackBar(message: AppStrings.orderFail);
        }
      },
    );
  }

  Future<void> placeOrder({required OrderPlaceParam orderPlaceParam}) async {
    Get.context?.loaderOverlay.show();
    final result = await orderUsecase(orderPlaceParam);
    result.fold(
      (failure) {
        AppFunctionalComponents.showSnackBar(message: failure.messege);
      },
      (response) {
        if (response.message == AppStrings.orderSuccess) {
          Get.toNamed(RoutesName.orderSuccess);
          AppFunctionalComponents.showSnackBar(
              message: AppStrings.orderSuccess);
        } else {
          AppFunctionalComponents.showSnackBar(message: AppStrings.orderFail);
        }
      },
    );
    Get.context?.loaderOverlay.hide();
  }

  Future<void> cancelOrder({required OrderCancelParam orderCancelParam}) async {
    Get.context?.loaderOverlay.show();
    final result = await orderCancelUsecase(orderCancelParam);
    result.fold(
      (failure) {
        AppFunctionalComponents.showSnackBar(message: failure.messege);
      },
      (response) {
        if (response.message == AppStrings.orderCancel){
          Get.to(OrderScreen(onBack:(){}));
          AppFunctionalComponents.showSnackBar(message: AppStrings.orderCancel);
        } else {
          AppFunctionalComponents.showSnackBar(message: AppStrings.orderFail);
        }
      },
    );
    Get.context?.loaderOverlay.hide();
  }
}

