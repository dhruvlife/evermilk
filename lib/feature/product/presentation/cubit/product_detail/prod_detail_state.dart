import 'package:equatable/equatable.dart';
import 'package:milkride/feature/product/domain/entities/product.dart';
import 'package:milkride/feature/product/domain/entities/product_detail_response.dart';

abstract class ProdDetailState extends Equatable {
  const ProdDetailState();
  @override
  List<Object?> get props => [];
}

class ProdDetailInitial extends ProdDetailState {}

class ProdDetailLoading extends ProdDetailState {}

class ProdDetailLoaded extends ProdDetailState {
  final ProductDetailResponse response;
  final Product? selectedVariant;
  final int quantity;
  final String deliveryType;
  const ProdDetailLoaded({
    required this.response,
    required this.selectedVariant,
    required this.quantity,
    required this.deliveryType,
  });

  ProdDetailLoaded copyWith({
    ProductDetailResponse? response,
    Product? selectedVariant,
    int? quantity,
    String? deliveryType,
  }) {
    return ProdDetailLoaded(
      response: response ?? this.response,
      selectedVariant: selectedVariant ?? this.selectedVariant,
      quantity: quantity ?? this.quantity,
      deliveryType: deliveryType ?? this.deliveryType,
    );
  }
  @override
  List<Object?> get props => [
        response,
        selectedVariant,
        quantity,
        deliveryType,
      ];
}

class ProdDetailError extends ProdDetailState {
  final String message;
  const ProdDetailError({required this.message});
  @override
  List<Object?> get props => [message];
}
