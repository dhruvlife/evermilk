import 'package:fpdart/fpdart.dart';
import 'package:milkride/core/failure/failure.dart';
import 'package:milkride/core/usecase/usecase.dart';
import 'package:milkride/feature/product/domain/entities/product_variants_resp.dart';
import 'package:milkride/feature/product/domain/repository/product_repository.dart';
import 'package:milkride/feature/product/domain/usecase/product_usecase.dart';

class ProductVariantsUsecase implements Usecase<ProdVariantsResponse,ProdDetailParam>{
  final ProductRepository productRepository;
  ProductVariantsUsecase({required this.productRepository});

  @override
  Future<Either<Failure,ProdVariantsResponse>> call(ProdDetailParam productDetailParam)async {
    return await productRepository.getProdVariants(prodDetailParam: productDetailParam);
  }
}