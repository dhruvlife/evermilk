part of 'payment_cubit.dart';


abstract class PaymentState extends Equatable {
  @override
  List<Object?> get props => [];
}

class PaymentInitial extends PaymentState {}

class PaymentAmountSelected extends PaymentState {
  final int amount;
  PaymentAmountSelected(this.amount);
  @override
  List<Object?> get props => [amount];
}

class PaymentLoaded extends PaymentState {
  final PaymentResponse paymentResponse;
  PaymentLoaded({required this.paymentResponse});
  @override
  List<Object?> get props => [paymentResponse];
}

class PaymentVerifyLoaded extends PaymentState {
  final CommonResponse commonResponse;
  PaymentVerifyLoaded({required this.commonResponse});
  @override
  List<Object?> get props => [commonResponse];
}


class PaymentError extends PaymentState {
  final String messege;
  PaymentError({required this.messege});
  @override
  List<Object?> get props => [messege];
}

class PaymentDateSelected extends PaymentState {
  final String date;
  PaymentDateSelected({required this.date});
  @override
  List<Object?> get props => [date];
}

