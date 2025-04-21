import 'package:fpdart/fpdart.dart';
import 'package:milkride/core/failure/failure.dart';
import 'package:milkride/core/usecase/usecase.dart';
import 'package:milkride/feature/cart/domain/entities/common_response.dart';
import 'package:milkride/feature/cart/domain/repository/cart_repository.dart';

class RemoveItemCartUsecase implements Usecase<CommonResponse,String>{
  final CartRepository cartRepository;
  RemoveItemCartUsecase({required this.cartRepository});
  
  @override
  Future<Either<Failure,CommonResponse>> call(cartId)async {
    return await cartRepository.getRemoveCartItemResponse(cartId: cartId);
  }
}
