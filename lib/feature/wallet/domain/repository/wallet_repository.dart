import 'package:fpdart/fpdart.dart';
import 'package:milkride/core/failure/failure.dart';
import 'package:milkride/feature/cart/domain/entities/common_response.dart';
import 'package:milkride/feature/wallet/domain/entities/payment_response.dart';
import 'package:milkride/feature/wallet/domain/entities/wallet_history_response.dart';
import 'package:milkride/feature/wallet/domain/entities/wallet_response.dart';
import 'package:milkride/feature/wallet/domain/usecase/wallet_usecase.dart';

abstract interface class WalletRepository {
  Future<Either<Failure, WalletResponse>> getWalletpageResponse ({required WalletParam walletParam});
  Future<Either<Failure, WalletHistoryResponse>> getWalletHistoryResponse ({required String customerId});
  Future<Either<Failure, WalletHistoryResponse>> getBillingHistoryResponse ({required String customerId});
  Future<Either<Failure, PaymentResponse>> getPayOnlineResponse ({required PayOnlineParam payOnlineParam});
  Future<Either<Failure, CommonResponse>> getVerifyPaymentResponse ({required VerifyPaymentParam verifyPaymentParam});
  Future<Either<Failure, CommonResponse>> getPaymentRequestResponse ({required PaymentRequestParam paymentRequestParam});
}
class PayOnlineParam{
  final String customerId;
  final String amount;
  PayOnlineParam({required this.amount,required this.customerId});
}
class VerifyPaymentParam{
  final String customerId;
  final String transactionId;
  final String orderId;
  VerifyPaymentParam({required this.customerId,required this.orderId,required this.transactionId});
}
class PaymentRequestParam{
  final String customerId;
  final String amount;
  final String date;
  PaymentRequestParam({required this.amount,required this.customerId,required this.date});
}

