import 'package:equatable/equatable.dart';
import 'package:milkride/feature/wallet/domain/entities/recharge.dart';

abstract class BillingHistoryState extends Equatable {
  const BillingHistoryState();
  @override
  List<Object?> get props => [];
}

class BillingHistoryInitial extends BillingHistoryState {
  const BillingHistoryInitial();
}

class BillingHistoryLoading extends BillingHistoryState {
  const BillingHistoryLoading();
}

class BillingHistoryLoaded extends BillingHistoryState {
  final List<Recharge> recharges;
  final String? selectedFilter;
  const BillingHistoryLoaded({
    required this.recharges,
    this.selectedFilter,
  });
  @override
  List<Object?> get props => [recharges, selectedFilter];
}

class BillingHistoryError extends BillingHistoryState {
  final String message;
  const BillingHistoryError({required this.message});
  @override
  List<Object?> get props => [message];
}
