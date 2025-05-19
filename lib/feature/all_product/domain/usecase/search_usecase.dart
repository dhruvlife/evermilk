import 'package:fpdart/fpdart.dart';
import 'package:milkride/core/failure/failure.dart';
import 'package:milkride/core/usecase/usecase.dart';
import 'package:milkride/feature/all_product/domain/entities/all_product_response.dart';
import 'package:milkride/feature/all_product/domain/repository/all_product_repository.dart';
import 'package:milkride/feature/all_product/domain/usecase/all_product_usecase.dart';

class SearchUsecase implements Usecase<AllProductResponse,AllProductParam>{
  final AllProductRepository allProductRepository;
  SearchUsecase({required this.allProductRepository});
  @override
  Future<Either<Failure, AllProductResponse>> call(AllProductParam allProductParam) async {
    return await allProductRepository.getSearchProductResponse(allProductParam: allProductParam);
  }
}