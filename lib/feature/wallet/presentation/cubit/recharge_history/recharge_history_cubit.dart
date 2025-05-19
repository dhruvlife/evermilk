import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:milkride/core/constant/app_strings.dart';
import 'package:milkride/core/storage/storage_key.dart';
import 'package:milkride/core/storage/storage_object.dart';
import 'package:milkride/feature/wallet/domain/entities/recharge.dart';
import 'package:milkride/feature/wallet/domain/usecase/wallet_history_usecase.dart';
import 'package:intl/intl.dart';
part 'recharge_history_state.dart';

class RechargeHistoryCubit extends Cubit<RechargeHistoryState> {
  final WalletHistoryUsecase walletHistoryUsecase;
  RechargeHistoryCubit({required this.walletHistoryUsecase}) : super(RechargeHistoryInitial());
  List<Recharge> _allRecharges = [];

  Future<void> fetchRechargeHistory() async {
    emit(RechargeHistoryLoading());
    try {
      final customerId = StorageObject.readData(StorageKeys.customerId)?.toString();
      if (customerId == null) {
        emit(RechargeHistoryError(message: AppStrings.customerNotFound));
        return;
      }
      final result = await walletHistoryUsecase.call(customerId);
      result.fold(
        (failure) => emit(RechargeHistoryError(message: failure.messege)),
        (response) {
          if(response.status == AppStrings.success){
            _allRecharges = response.recharge ?? [];
            emit(RechargeHistoryLoaded(recharges: _allRecharges));
          }
        },
      );
    } catch (e) {
      emit(RechargeHistoryError(message: e.toString()));
    }
  }
  Future<void> filterRechargeHistoryByDate(DateTime date) async {
    emit(RechargeHistoryLoading());
    try {
      final formattedDate = DateFormat('dd MMM yyyy').format(date);
      final filtered = _allRecharges.where((r) => r.date == formattedDate).toList();
      emit(RechargeHistoryLoaded(recharges: filtered, selectedFilter: formattedDate));
    } catch (e) {
      emit(RechargeHistoryError(message: e.toString()));
    }
  }
  void resetFilter() {
    emit(RechargeHistoryLoaded(recharges: _allRecharges));
  }
}
