import 'package:fpdart/fpdart.dart';
import 'package:milkride/core/failure/failure.dart';
import 'package:milkride/core/usecase/usecase.dart';
import 'package:milkride/feature/wallet/domain/entities/wallet_response.dart';
import 'package:milkride/feature/wallet/domain/repository/wallet_repository.dart';

class WalletUsecase implements Usecase<WalletResponse,WalletParam> {
  final WalletRepository walletRepository;
  WalletUsecase({required this.walletRepository});
  @override
  Future<Either<Failure,WalletResponse>> call(WalletParam walletParam)async {
    return await walletRepository.getWalletpageResponse(walletParam: walletParam);
  }
}

class WalletParam {
  final String userId;
  final String customerId;
  WalletParam({
    required this.customerId,
    required this.userId,
  });
}
