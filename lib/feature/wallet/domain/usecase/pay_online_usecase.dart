import 'package:fpdart/fpdart.dart';
import 'package:milkride/core/failure/failure.dart';
import 'package:milkride/core/usecase/usecase.dart';
import 'package:milkride/feature/wallet/domain/entities/payment_response.dart';
import 'package:milkride/feature/wallet/domain/repository/wallet_repository.dart';

class PaymentUsecase implements Usecase<PaymentResponse,PayOnlineParam> {
  final WalletRepository walletRepository;
  PaymentUsecase({required this.walletRepository});
  @override
  Future<Either<Failure,PaymentResponse>> call(PayOnlineParam payOnlineParam) async {
    return await walletRepository.getPayOnlineResponse(payOnlineParam: payOnlineParam);
  }
}
