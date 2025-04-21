import 'package:equatable/equatable.dart';
import 'package:milkride/core/failure/failure.dart';
import 'package:milkride/feature/cart/domain/entities/cart_page_response.dart';

abstract class CartPageState extends Equatable {
  const CartPageState();
  @override
  List<Object?> get props => [];
}
class CartPageInitial extends CartPageState {}
class CartPageLoading extends CartPageState {}

class CartPageLoaded extends CartPageState {
  final CartPageResponse cartPageResponse;
  final Map<int, int> productQuantities;
  final double totalAmount;
  const CartPageLoaded({
    required this.cartPageResponse,
    required this.productQuantities,
    required this.totalAmount,
  });
  @override
  List<Object?> get props => [cartPageResponse,productQuantities, totalAmount];
}
class CartPageError extends CartPageState {
  final Failure failure;
  const CartPageError(this.failure);
  @override
  List<Object?> get props => [failure];
}
