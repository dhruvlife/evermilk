import 'package:fpdart/fpdart.dart';
import 'package:milkride/core/failure/failure.dart';
import 'package:milkride/feature/all_product/domain/entities/all_product_response.dart';
import 'package:milkride/feature/all_product/domain/usecase/all_product_usecase.dart';

abstract interface class AllProductRepository {
  Future<Either<Failure, AllProductResponse>> getAllProductResponse({required AllProductParam allProductParam});
  Future<Either<Failure, AllProductResponse>> getSearchProductResponse({required AllProductParam allProductParam});
}

