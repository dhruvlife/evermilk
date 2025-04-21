import 'package:fpdart/fpdart.dart';
import 'package:milkride/core/failure/failure.dart';
import 'package:milkride/core/usecase/usecase.dart';
import 'package:milkride/feature/cart/domain/entities/cart_page_response.dart';
import 'package:milkride/feature/cart/domain/repository/cart_repository.dart';

class CartPageUsecase implements Usecase<CartPageResponse,String>{
  final CartRepository cartRepository;
  CartPageUsecase({required this.cartRepository});
  
  @override
  Future<Either<Failure,CartPageResponse>> call(customerId)async {
    return await cartRepository.getCartPageResponse(customerId: customerId);
  }
}
