import 'package:intl/intl.dart';
import 'package:milkride/core/constant/app_strings.dart';
import 'package:milkride/core/storage/storage_key.dart';
import 'package:milkride/core/storage/storage_object.dart';
import 'package:milkride/feature/wallet/domain/entities/recharge.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:milkride/feature/wallet/domain/usecase/billing_history_usecase.dart';
import 'package:milkride/feature/wallet/presentation/cubit/billing_history/billing_history_state.dart';

class BillingHistoryCubit extends Cubit<BillingHistoryState> {
  final BillingHistoryUsecase billingHistoryUsecase;
  BillingHistoryCubit({required this.billingHistoryUsecase}) : super(BillingHistoryInitial());
  List<Recharge> allRecharges = [];

  Future<void> fetchBillingHistory() async {
    emit(BillingHistoryLoading());
    try {
      final customerId = StorageObject.readData(StorageKeys.customerId)?.toString();
      if (customerId == null) {
        emit(BillingHistoryError(message: AppStrings.customerNotFound));
        return;
      }
      final result = await billingHistoryUsecase.call(customerId);
      result.fold(
        (failure) => emit(BillingHistoryError(message: failure.messege)),
        (response) {
          if(response.status == AppStrings.success){
            allRecharges = response.recharge ?? [];
            emit(BillingHistoryLoaded(recharges: allRecharges));
          }
        },
      );
    } catch (e) {
      emit(BillingHistoryError(message: e.toString()));
    }
  }

  Future<void> filterBillingHistoryByDate(DateTime date) async {
    emit(BillingHistoryLoading());
    try {
      final formattedDate = DateFormat('dd MMM yyyy').format(date);
      final filtered = allRecharges.where((r) => r.date == formattedDate).toList();
      emit(BillingHistoryLoaded(recharges: filtered, selectedFilter: formattedDate));
    } catch (e) {
      emit(BillingHistoryError(message: e.toString()));
    }
  }
  void resetFilter() {
    emit(BillingHistoryLoaded(recharges: allRecharges));
  }
}
