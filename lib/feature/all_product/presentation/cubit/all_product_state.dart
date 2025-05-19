part of 'all_product_cubit.dart';

abstract class AllProductState extends Equatable {
  const AllProductState();
  @override
  List<Object> get props => [];
}
class AllProductInitial extends AllProductState {}
class AllProductLoading extends AllProductState {}

class AllProductLoaded extends AllProductState {
  final List<Product> products;
  final List<Categories> categories;
  const AllProductLoaded({required this.products, required this.categories});
  @override
  List<Object> get props => [products, categories];
}

class AllProductError extends AllProductState {
  final String message;
  const AllProductError({required this.message});
  @override
  List<Object> get props => [message];
}

