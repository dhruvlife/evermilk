part of 'subscribe_cubit.dart';

abstract class SubscriptionState extends Equatable {
  const SubscriptionState();
  @override
  List<Object?> get props => [];
}

class SubscriptionInitial extends SubscriptionState {}

class SubscriptionLoaded extends SubscriptionState {
  final int quantity;
  final String deliveryType;
  final String? schedule;
  final DateTime? startDate;
  final DateTime? endDate;
  final List<int> dayWiseQuantities;
  const SubscriptionLoaded({
    required this.quantity,
    required this.deliveryType,
    required this.schedule,
    required this.startDate,
    required this.endDate,
    required this.dayWiseQuantities,
  });
  @override
  List<Object?> get props => [
        quantity,
        deliveryType,
        schedule,
        startDate,
        endDate,
        dayWiseQuantities,
      ];
}

class SubscriptionSuccess extends SubscriptionState {
  final String message;
  const SubscriptionSuccess(this.message);
  @override
  List<Object?> get props => [message];
}

class SubscriptionError extends SubscriptionState {
  final String message;
  const SubscriptionError(this.message);
  @override
  List<Object?> get props => [message];
}
