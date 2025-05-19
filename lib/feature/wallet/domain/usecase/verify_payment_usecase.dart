import 'package:fpdart/fpdart.dart';
import 'package:milkride/core/failure/failure.dart';
import 'package:milkride/core/usecase/usecase.dart';
import 'package:milkride/feature/cart/domain/entities/common_response.dart';
import 'package:milkride/feature/wallet/domain/repository/wallet_repository.dart';

class VerifyPaymentUsecase implements Usecase<CommonResponse,VerifyPaymentParam> {
  final WalletRepository walletRepository;
  VerifyPaymentUsecase({required this.walletRepository});
  @override
  Future<Either<Failure,CommonResponse>> call(VerifyPaymentParam verifyPaymentParam) async {
    return await walletRepository.getVerifyPaymentResponse(verifyPaymentParam: verifyPaymentParam);
  }
}
