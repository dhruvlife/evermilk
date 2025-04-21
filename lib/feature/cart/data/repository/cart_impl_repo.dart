import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:milkride/core/failure/failure.dart';
import 'package:milkride/core/utils/exeption_handler.dart';
import 'package:milkride/feature/cart/data/repository/cart_remote_repo.dart';
import 'package:milkride/feature/cart/domain/entities/cart_page_response.dart';
import 'package:milkride/feature/cart/domain/entities/common_response.dart';
import 'package:milkride/feature/cart/domain/repository/cart_repository.dart';
import 'package:milkride/feature/cart/domain/usecase/subscription_usecase.dart';

class CartImplRepo implements CartRepository {
  final CartRemoteRepo cartRemoteRepo;
  CartImplRepo({required this.cartRemoteRepo});

  @override
  Future<Either<Failure, CartPageResponse>> getCartPageResponse({required String customerId}) async {
    try {
      final cartPageResponse = await cartRemoteRepo.getCartPageResponse(customerId: customerId);
      return right(cartPageResponse);
    } on DioException catch (e) {
      return left(HandleExeption.handleError(error: e));
    }
  }

  @override
  Future<Either<Failure, CommonResponse>> getCartQtyUpdateResponse({required List<Map<String, String>> cartData})async{
    try {
      final cartQtyUpdateResponse = await cartRemoteRepo.getCartQtyUpdateResponse(cartData: cartData);
      return right(cartQtyUpdateResponse);
    } on DioException catch (e) {
      return left(HandleExeption.handleError(error: e));
    }
  }

  @override
  Future<Either<Failure, CommonResponse>> getRemoveCartItemResponse({required String cartId})async{
    try {
      final removeCartItemResponse = await cartRemoteRepo.getRemoveCartItemResponse(cartId: cartId);
      return right(removeCartItemResponse);
    } on DioException catch (e) {
      return left(HandleExeption.handleError(error: e));
    }
  }

  @override
  Future<Either<Failure, CommonResponse>> getSubcribeResponse({required SubScribeCartParam subScribeCartParam})async{
    try {
      final subcribeResponse = await cartRemoteRepo.getSubcribeResponse(subScribeCartParam: subScribeCartParam);
      return right(subcribeResponse);
    } on DioException catch (e) {
      return left(HandleExeption.handleError(error: e));
    }
  }
}
