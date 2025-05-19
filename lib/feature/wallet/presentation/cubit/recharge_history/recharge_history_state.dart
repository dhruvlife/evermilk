part of 'recharge_history_cubit.dart';

abstract class RechargeHistoryState extends Equatable {
  const RechargeHistoryState();
  @override
  List<Object?> get props => [];
}

class RechargeHistoryInitial extends RechargeHistoryState {}
class RechargeHistoryLoading extends RechargeHistoryState {}

class RechargeHistoryLoaded extends RechargeHistoryState {
  final List<Recharge> recharges;
  final String? selectedFilter;
  const RechargeHistoryLoaded({
    required this.recharges,
    this.selectedFilter,
  });
  @override
  List<Object?> get props => [recharges, selectedFilter];
}

class RechargeHistoryError extends RechargeHistoryState {
  final String message;
  const RechargeHistoryError({required this.message});
  @override
  List<Object?> get props => [message];
}
