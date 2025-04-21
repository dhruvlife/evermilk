import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:milkride/core/failure/failure.dart';
import 'package:milkride/core/utils/exeption_handler.dart';
import 'package:milkride/feature/product/data/repository/product_remote_repo.dart';
import 'package:milkride/feature/product/domain/entities/category_response.dart';
import 'package:milkride/feature/product/domain/entities/cat_product_response.dart';
import 'package:milkride/feature/product/domain/entities/product_detail_response.dart';
import 'package:milkride/feature/product/domain/entities/product_variants_resp.dart';
import 'package:milkride/feature/product/domain/repository/product_repository.dart';
import 'package:milkride/feature/product/domain/usecase/category_products_usecase.dart';
import 'package:milkride/feature/product/domain/usecase/product_usecase.dart';

class ProductImplRepo implements ProductRepository {
  final ProductRemoteRepo productRemoteRepo;
  ProductImplRepo({required this.productRemoteRepo});

  @override
  Future<Either<Failure, CategoryResponse>> getAllCategories({required int userId}) async {
    try {
      final allCategories = await productRemoteRepo.getAllCategoryResponse(userId: userId);
      return right(allCategories);
    } on DioException catch (e) {
      return left(HandleExeption.handleError(error:e));
    }
  }

  @override
  Future<Either<Failure, CategoryProductResponse>> getCategoryProducts({required CategoryProdParam categoryProdParam}) async {
    try {
      final categoeyProds = await productRemoteRepo.getCategoriesProducts(categoryProdParam: categoryProdParam);
      return right(categoeyProds);
    } on DioException catch (e) {
      return left(HandleExeption.handleError(error:e));
    }
  }

  @override
  Future<Either<Failure, ProductDetailResponse>> getProdDetail({required ProdDetailParam prodDetailParam})async {
   try {
      final productDetail = await productRemoteRepo.getProductDetail(prodDetailParam: prodDetailParam);
      return right(productDetail);
    } on DioException catch (e) {
      return left(HandleExeption.handleError(error:e));
    }
  }

  @override
  Future<Either<Failure, ProdVariantsResponse>> getProdVariants({required ProdDetailParam prodDetailParam})async {
    try {
      final productVariants = await productRemoteRepo.getProductVariants(prodDetailParam: prodDetailParam);
      return right(productVariants);
    } on DioException catch (e) {
      return left(HandleExeption.handleError(error:e));
    }
  }
}
