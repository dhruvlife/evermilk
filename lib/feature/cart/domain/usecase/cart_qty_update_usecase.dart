import 'package:fpdart/fpdart.dart';
import 'package:milkride/core/failure/failure.dart';
import 'package:milkride/core/usecase/usecase.dart';
import 'package:milkride/feature/cart/domain/entities/common_response.dart';
import 'package:milkride/feature/cart/domain/repository/cart_repository.dart';

class CartQtyUpdateUsecase implements Usecase<CommonResponse,List<Map<String, String>>>{
  final CartRepository cartRepository;
  CartQtyUpdateUsecase({required this.cartRepository});
  
  @override
  Future<Either<Failure,CommonResponse>> call(cartData)async {
    return await cartRepository.getCartQtyUpdateResponse(cartData: cartData);
  }
}
