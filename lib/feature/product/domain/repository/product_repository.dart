import 'package:fpdart/fpdart.dart';
import 'package:milkride/core/failure/failure.dart';
import 'package:milkride/feature/product/domain/entities/category_response.dart';
import 'package:milkride/feature/product/domain/entities/cat_product_response.dart';
import 'package:milkride/feature/product/domain/entities/product_detail_response.dart';
import 'package:milkride/feature/product/domain/entities/product_variants_resp.dart';
import 'package:milkride/feature/product/domain/usecase/category_products_usecase.dart';
import 'package:milkride/feature/product/domain/usecase/product_usecase.dart';

abstract interface class ProductRepository{
  Future<Either<Failure,CategoryProductResponse>> getCategoryProducts({required CategoryProdParam categoryProdParam});
  Future<Either<Failure,CategoryResponse>> getAllCategories({required int userId});
  Future<Either<Failure,ProductDetailResponse>> getProdDetail({required ProdDetailParam prodDetailParam});
  Future<Either<Failure,ProdVariantsResponse>> getProdVariants({required ProdDetailParam prodDetailParam});
}

