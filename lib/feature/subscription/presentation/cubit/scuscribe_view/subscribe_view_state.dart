part of 'subscribe_view_cubit.dart';

abstract class SubscribeViewState extends Equatable {
  const SubscribeViewState();
  @override
  List<Object?> get props => [];
}

class SubscribeViewInitial extends SubscribeViewState {}
class SubscribeViewLoading extends SubscribeViewState {}
class SubscribeViewError extends SubscribeViewState {
  final String message;
  const SubscribeViewError({required this.message});
}

class SubscribeViewDateChanged extends SubscribeViewState {
  final String startDate;
  final String endDate;
  const SubscribeViewDateChanged({required this.startDate, required this.endDate});
  @override
  List<Object?> get props => [startDate, endDate];
}

class SubscribeViewLoaded extends SubscribeViewState {
final List<SubScriptionDetail>? subscribeResponse;
const SubscribeViewLoaded({required this.subscribeResponse});
  @override
  List<Object?> get props => [subscribeResponse];
}

