import 'package:equatable/equatable.dart';
import 'package:milkride/feature/order/domain/entities/order_response.dart';

abstract class OrderState extends Equatable {
  const OrderState();
  @override
  List<Object?> get props => [];
}

class OrderInitial extends OrderState {}

class OrderLoading extends OrderState {}

class OrderLoaded extends OrderState {
  final List<DateTime> dates;
  final DateTime selectedDate;
  final OrderResponse orderResponse;
  const OrderLoaded({
    required this.orderResponse,
    required this.dates,
    required this.selectedDate,
  });
  @override
  List<Object?> get props => [orderResponse, dates, selectedDate];
}

class OrderError extends OrderState {
  final String message;
  const OrderError({required this.message});
  @override
  List<Object?> get props => [message];
}
