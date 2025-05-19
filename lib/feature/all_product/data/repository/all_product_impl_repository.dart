import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:milkride/core/failure/failure.dart';
import 'package:milkride/core/utils/exeption_handler.dart';
import 'package:milkride/feature/all_product/data/repository/all_product_remote_repository.dart';
import 'package:milkride/feature/all_product/domain/entities/all_product_response.dart';
import 'package:milkride/feature/all_product/domain/repository/all_product_repository.dart';
import 'package:milkride/feature/all_product/domain/usecase/all_product_usecase.dart';

class AllProductImplRepo implements AllProductRepository {
  final AllProductRemoteRepository allProductRemoteRepository;
  AllProductImplRepo({required this.allProductRemoteRepository});
  
  @override
  Future<Either<Failure, AllProductResponse>> getAllProductResponse({required AllProductParam allProductParam}) async {
    try {
      final allProductResponse = await allProductRemoteRepository.getAllProductResponse(allProductParam: allProductParam);
      return right(allProductResponse);
    } on DioException catch (e) {
      return left(HandleExeption.handleError(error:e));
    }
  }
  
  @override
  Future<Either<Failure, AllProductResponse>> getSearchProductResponse({required AllProductParam allProductParam}) async {
      try {
      final searchProductResponse = await allProductRemoteRepository.getSearchProductResponse(allProductParam: allProductParam);
      return right(searchProductResponse);
    } on DioException catch (e) {
      return left(HandleExeption.handleError(error:e));
    }
  }
}