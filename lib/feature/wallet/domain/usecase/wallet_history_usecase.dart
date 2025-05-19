import 'package:fpdart/fpdart.dart';
import 'package:milkride/core/failure/failure.dart';
import 'package:milkride/core/usecase/usecase.dart';
import 'package:milkride/feature/wallet/domain/entities/wallet_history_response.dart';
import 'package:milkride/feature/wallet/domain/repository/wallet_repository.dart';

class WalletHistoryUsecase implements Usecase<WalletHistoryResponse,String> {
  final WalletRepository walletRepository;
  WalletHistoryUsecase({required this.walletRepository});
  @override
  Future<Either<Failure,WalletHistoryResponse>> call(String customerId) async {
    return await walletRepository.getWalletHistoryResponse(customerId: customerId);
  }
}
