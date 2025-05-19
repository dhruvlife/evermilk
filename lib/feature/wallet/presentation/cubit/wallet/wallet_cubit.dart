import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:milkride/core/constant/app_strings.dart';
import 'package:milkride/core/storage/storage_key.dart';
import 'package:milkride/core/storage/storage_object.dart';
import 'package:milkride/core/utils/app_functional_components.dart';
import 'package:milkride/feature/wallet/domain/entities/wallet_response.dart';
import 'package:milkride/feature/wallet/domain/usecase/wallet_usecase.dart';
part 'wallet_state.dart';

class WalletCubit extends Cubit<WalletState> {
  final WalletUsecase walletUsecase;
  WalletCubit({required this.walletUsecase}) : super(WalletInitial());
  
  Future<void> getWalletResponse() async {
    emit(WalletLoading());
    try {
      final customerId = StorageObject.readData(StorageKeys.customerId);
      final userId = StorageObject.readData(StorageKeys.userId);
      if (customerId == null || userId == null) {
        emit(const WalletError(message:AppStrings.customerNotFound));
        return;
      }
      final result = await walletUsecase(
        WalletParam(
          customerId: customerId.toString(),
          userId: userId.toString(),
        ),
      );
      result.fold(
        (failure) {
          emit(WalletError(message: failure.messege));
          AppFunctionalComponents.showSnackBar(message: failure.messege);
        },
        (response) {
          if (response.status == AppStrings.success) {
            emit(WalletLoaded(walletResponse: response));
          } else {
            emit(const WalletError(message: AppStrings.orderFail));
            AppFunctionalComponents.showSnackBar(message: AppStrings.orderFail);
          }
        },
      );
    } catch (e) {
      emit(WalletError(message: e.toString()));
      AppFunctionalComponents.showSnackBar(message: AppStrings.unExpectedError);
    }
  }
}
