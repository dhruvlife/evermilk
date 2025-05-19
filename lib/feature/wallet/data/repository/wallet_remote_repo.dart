import 'package:milkride/feature/cart/data/model/common_data_model.dart';
import 'package:milkride/feature/wallet/data/model/payment_model.dart';
import 'package:milkride/feature/wallet/data/model/wallet_history_model.dart';
import 'package:milkride/feature/wallet/data/model/wallet_model.dart';
import 'package:milkride/feature/wallet/domain/repository/wallet_repository.dart';
import 'package:milkride/feature/wallet/domain/usecase/wallet_usecase.dart';
import 'package:milkride/service/api_service.dart';

abstract interface class WalletRemoteRepo {
  Future<WalletModel> getWalletResponse({required WalletParam walletParam});
  Future<WalletHistory> getWalletHistoryResponse({required String customerId});
  Future<WalletHistory> getBillingHistoryResponse({required String customerId});
  Future<PaymentModel> getPayOnlineResponse ({required PayOnlineParam payOnlineParam});
  Future<CommonDataModel> getVerifyPaymentResponse ({required VerifyPaymentParam verifyPaymentParam});
  Future<CommonDataModel> getPaymentRequestResponse ({required PaymentRequestParam paymentRequestParam});
}

class WalletImplRemoteRepo implements WalletRemoteRepo {
  final ApiService apiService;
  WalletImplRemoteRepo({required this.apiService});

  @override
  Future<WalletModel> getWalletResponse({required WalletParam walletParam}) {
    return apiService.getWalletPageResponse(
      userId: walletParam.userId,
      customerId: walletParam.customerId.toString(),
    );
  }
  
  @override
  Future<WalletHistory> getWalletHistoryResponse({required String customerId}) {
    return apiService.getWalletHistoryResponse(
      customerId: customerId.toString(),
    );
  }
  
  @override
  Future<WalletHistory> getBillingHistoryResponse({required String customerId}) {
    return apiService.getBillingHistoryResponse(
      customerId: customerId.toString(),
    );
  }
  
  @override
  Future<PaymentModel> getPayOnlineResponse({required PayOnlineParam payOnlineParam}) {
    return apiService.getPayOnlineResponse(customerId: payOnlineParam.customerId, amount: payOnlineParam.amount);
  }
  
  @override
  Future<CommonDataModel> getPaymentRequestResponse({required PaymentRequestParam paymentRequestParam}) {
    return apiService.getPaymentRequestResponse(customerId: paymentRequestParam.customerId, amount: paymentRequestParam.amount, date: paymentRequestParam.date);
  }
  
  @override
  Future<CommonDataModel> getVerifyPaymentResponse({required VerifyPaymentParam verifyPaymentParam}) {
    return apiService.getVerifyPaymentResponse(customerId: verifyPaymentParam.customerId, transactionId: verifyPaymentParam.transactionId, orderId: verifyPaymentParam.orderId);
  }
}
