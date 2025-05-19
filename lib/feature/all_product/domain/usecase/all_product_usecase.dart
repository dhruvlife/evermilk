import 'package:fpdart/fpdart.dart';
import 'package:milkride/core/failure/failure.dart';
import 'package:milkride/core/usecase/usecase.dart';
import 'package:milkride/feature/all_product/domain/entities/all_product_response.dart';
import 'package:milkride/feature/all_product/domain/repository/all_product_repository.dart';

class AllProductUsecase implements Usecase<AllProductResponse,AllProductParam>{
  final AllProductRepository allProductRepository;
  AllProductUsecase({required this.allProductRepository});
  @override
  Future<Either<Failure, AllProductResponse>> call(AllProductParam allProductParam) async {
    return await allProductRepository.getAllProductResponse(allProductParam: allProductParam);
  }
}

class AllProductParam {
  final int? categoryId;
  final String customerId;
  final int page;
  final int length;
  final String? keyword;

  AllProductParam({
    this.categoryId,
    required this.customerId,
    this.page = 1,
    this.length = 10,
    this.keyword,
  });

  AllProductParam copyWith({
    int? categoryId,
    String? customerId,
    int? page,
    int? length,
    String? keyword,
  }) {
    return AllProductParam(
      categoryId: categoryId ?? this.categoryId,
      customerId: customerId ?? this.customerId,
      page: page ?? this.page,
      length: length ?? this.length,
      keyword: keyword ?? this.keyword,
    );
  }
}


