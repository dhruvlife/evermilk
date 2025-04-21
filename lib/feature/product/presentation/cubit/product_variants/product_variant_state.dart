import 'package:equatable/equatable.dart';
import 'package:milkride/feature/product/domain/entities/product.dart';
import 'package:milkride/feature/product/domain/entities/product_variants_resp.dart';

abstract class ProductVariantState extends Equatable {
  const ProductVariantState();
  @override
  List<Object?> get props => [];
}

class ProductVariantInitial extends ProductVariantState {}
class ProductVariantLoading extends ProductVariantState {}

class ProductVariantLoaded extends ProductVariantState {
  final ProdVariantsResponse response;
  final Product? selectedProduct;
  final int quantity;
  final int deliveryType;
  const ProductVariantLoaded({
    required this.response,
    required this.selectedProduct,
    required this.quantity,
    required this.deliveryType,
  });

  ProductVariantLoaded copyWith({
    ProdVariantsResponse? response,
    Product? selectedProduct,
    int? quantity,
    int? deliveryType,
  }) {
    return ProductVariantLoaded(
      response: response ?? this.response,
      selectedProduct: selectedProduct ?? this.selectedProduct,
      quantity: quantity ?? this.quantity,
      deliveryType: deliveryType ?? this.deliveryType,
    );
  }
  @override
  List<Object?> get props => [response, selectedProduct, quantity, deliveryType];
}

class ProductVariantError extends ProductVariantState {
  final String message;
  const ProductVariantError({required this.message});
  @override
  List<Object?> get props => [message];
}
