import 'package:fpdart/fpdart.dart';
import 'package:milkride/core/failure/failure.dart';
import 'package:milkride/core/usecase/usecase.dart';
import 'package:milkride/feature/product/domain/entities/product_detail_response.dart';
import 'package:milkride/feature/product/domain/repository/product_repository.dart';

class ProductDetailUsecase implements Usecase<ProductDetailResponse,ProdDetailParam>{
  final ProductRepository productRepository;
  ProductDetailUsecase({required this.productRepository});

  @override
  Future<Either<Failure, ProductDetailResponse>> call(ProdDetailParam productDetailParam)async {
    return await productRepository.getProdDetail(prodDetailParam: productDetailParam);
  }
}

class ProdDetailParam {
  final String productId;
  final String customerId;
  ProdDetailParam({
    required this.productId,
    required this.customerId,
  });
}
