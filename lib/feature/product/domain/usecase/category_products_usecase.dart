import 'package:fpdart/fpdart.dart';
import 'package:milkride/core/failure/failure.dart';
import 'package:milkride/core/usecase/usecase.dart';
import 'package:milkride/feature/product/domain/entities/cat_product_response.dart';
import 'package:milkride/feature/product/domain/repository/product_repository.dart';

class CategoryProductsUsecase implements Usecase<CategoryProductResponse,CategoryProdParam>{
  final ProductRepository productRepository;
  CategoryProductsUsecase({required this.productRepository});
  @override
  Future<Either<Failure, CategoryProductResponse>> call(CategoryProdParam categoryProdParam){
    return productRepository.getCategoryProducts(categoryProdParam: categoryProdParam);
  }
}

class CategoryProdParam {
  final String categoryId;
  final String customerId;
  CategoryProdParam({
    required this.categoryId,
    required this.customerId,
  });
}
