import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:milkride/feature/product/domain/usecase/category_products_usecase.dart';
import 'package:milkride/feature/product/presentation/cubit/category_product/category_product_state.dart';

class CategoryProductsCubit extends Cubit<CategoryProductsState> {
  final CategoryProductsUsecase categoryProductsUsecase;
  CategoryProductsCubit({required this.categoryProductsUsecase}) : super(CategoryProductsInitial());

  Future<void> fetchCategoryProducts({required String categoryId, required String customerId}) async {
    emit(CategoryProductsLoading());
    final result = await categoryProductsUsecase(CategoryProdParam(categoryId: categoryId, customerId: customerId));
    result.fold(
      (failure) => emit(CategoryProductsError(message:failure.messege)),
      (response) => emit(CategoryProductsLoaded(response:response)),
    );
  }
}
