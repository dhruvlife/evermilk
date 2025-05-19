import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:milkride/core/failure/failure.dart';
import 'package:milkride/core/utils/exeption_handler.dart';
import 'package:milkride/feature/cart/domain/entities/common_response.dart';
import 'package:milkride/feature/wallet/data/repository/wallet_remote_repo.dart';
import 'package:milkride/feature/wallet/domain/entities/payment_response.dart';
import 'package:milkride/feature/wallet/domain/entities/wallet_history_response.dart';
import 'package:milkride/feature/wallet/domain/entities/wallet_response.dart';
import 'package:milkride/feature/wallet/domain/repository/wallet_repository.dart';
import 'package:milkride/feature/wallet/domain/usecase/wallet_usecase.dart';

class WalletImplRepo implements WalletRepository {
  final WalletRemoteRepo walletRemoteRepo;
  WalletImplRepo({required this.walletRemoteRepo});

  @override
  Future<Either<Failure, WalletResponse>> getWalletpageResponse({required WalletParam walletParam}) async {
    try {
      final walletResponse = await walletRemoteRepo.getWalletResponse(walletParam: walletParam);
      return right(walletResponse);
    } on DioException catch (e) {
      return left(HandleExeption.handleError(error: e));
    }
  }

  @override
  Future<Either<Failure, WalletHistoryResponse>> getWalletHistoryResponse({required String customerId}) async {
    try {
      final walletHistoryResponse = await walletRemoteRepo.getWalletHistoryResponse(customerId:customerId);
      return right(walletHistoryResponse);
    } on DioException catch (e) {
      return left(HandleExeption.handleError(error: e));
    }
  }
  
  @override
  Future<Either<Failure, WalletHistoryResponse>> getBillingHistoryResponse({required String customerId}) async {
    try {
      final billingHistoryResponse = await walletRemoteRepo.getBillingHistoryResponse(customerId:customerId);
      return right(billingHistoryResponse);
    } on DioException catch (e) {
      return left(HandleExeption.handleError(error: e));
    }
  }

  @override
  Future<Either<Failure, PaymentResponse>> getPayOnlineResponse({required PayOnlineParam payOnlineParam}) async {
    try {
      final payOnlineResponse = await walletRemoteRepo.getPayOnlineResponse(payOnlineParam: payOnlineParam);
      return right(payOnlineResponse);
    } on DioException catch (e) {
      return left(HandleExeption.handleError(error: e));
    }
  }

  @override
  Future<Either<Failure, CommonResponse>> getPaymentRequestResponse({required PaymentRequestParam paymentRequestParam}) async {
    try {
      final paymentRequestResponse = await walletRemoteRepo.getPaymentRequestResponse(paymentRequestParam: paymentRequestParam);
      return right(paymentRequestResponse);
    } on DioException catch (e) {
      return left(HandleExeption.handleError(error: e));
    }
  }

  @override
  Future<Either<Failure, CommonResponse>> getVerifyPaymentResponse({required VerifyPaymentParam verifyPaymentParam}) async {
    try {
      final verifyPaymentResponse = await walletRemoteRepo.getVerifyPaymentResponse(verifyPaymentParam: verifyPaymentParam);
      return right(verifyPaymentResponse);
    } on DioException catch (e) {
      return left(HandleExeption.handleError(error: e));
    }
  }
}
