import 'package:fpdart/fpdart.dart';
import 'package:milkride/core/failure/failure.dart';
import 'package:milkride/core/usecase/usecase.dart';
import 'package:milkride/feature/cart/domain/entities/common_response.dart';
import 'package:milkride/feature/wallet/domain/repository/wallet_repository.dart';

class PaymentRequestUsecase implements Usecase<CommonResponse,PaymentRequestParam> {
  final WalletRepository walletRepository;
  PaymentRequestUsecase({required this.walletRepository});
  @override
  Future<Either<Failure,CommonResponse>> call(PaymentRequestParam paymentRequestParam) async {
    return await walletRepository.getPaymentRequestResponse(paymentRequestParam: paymentRequestParam);
  }
}
