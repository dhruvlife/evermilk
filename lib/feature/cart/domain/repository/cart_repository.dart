import 'package:fpdart/fpdart.dart';
import 'package:milkride/core/failure/failure.dart';
import 'package:milkride/feature/cart/domain/entities/cart_page_response.dart';
import 'package:milkride/feature/cart/domain/entities/common_response.dart';
import 'package:milkride/feature/cart/domain/usecase/subscription_usecase.dart';

abstract interface class CartRepository {
  Future<Either<Failure, CartPageResponse>> getCartPageResponse({required String customerId});
  Future<Either<Failure, CommonResponse>> getCartQtyUpdateResponse({required List<Map<String, String>> cartData});
  Future<Either<Failure, CommonResponse>> getRemoveCartItemResponse({required String cartId});
  Future<Either<Failure, CommonResponse>> getSubcribeResponse({required SubScribeCartParam subScribeCartParam});
}
