import 'package:equatable/equatable.dart';
import 'package:milkride/feature/product/domain/entities/cat_product_response.dart';

abstract class CategoryProductsState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CategoryProductsInitial extends CategoryProductsState {}
class CategoryProductsLoading extends CategoryProductsState {}

class CategoryProductsLoaded extends CategoryProductsState {
  final CategoryProductResponse response;
  CategoryProductsLoaded({required this.response});
  @override
  List<Object?> get props => [response];
}

class CategoryProductsError extends CategoryProductsState {
  final String message;
  CategoryProductsError({required this.message});
  @override
  List<Object?> get props => [message];
}
