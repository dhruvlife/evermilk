import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:milkride/core/failure/failure.dart';
import 'package:milkride/core/utils/exeption_handler.dart';
import 'package:milkride/feature/cart/domain/entities/common_response.dart';
import 'package:milkride/feature/order/data/repository/order_remote_repo.dart';
import 'package:milkride/feature/order/domain/entities/order_response.dart';
import 'package:milkride/feature/order/domain/repository/order_repository.dart';
import 'package:milkride/feature/order/domain/usecase/order_cancel_usecase.dart';
import 'package:milkride/feature/order/domain/usecase/order_get_usecase.dart';
import 'package:milkride/feature/order/domain/usecase/order_place_usecase.dart';

class OrderImplRepo implements OrderRepository {
  final OrderRemoteRepo orderRemoteRepo;
  OrderImplRepo({required this.orderRemoteRepo});

  @override
  Future<Either<Failure, CommonResponse>> getOrderPlaceResponse({required OrderPlaceParam orderPlaceParam})async{
    try {
      final orderPlaceResponse = await orderRemoteRepo.getOrderPlaceResponse(orderPlaceParam: orderPlaceParam);
      return right(orderPlaceResponse);
    } on DioException catch (e) {
      return left(HandleExeption.handleError(error: e));
    }
  }
  
  @override
  Future<Either<Failure, OrderResponse>> getOrderCheckResponse({required OrderCheckParam orderCheckParam})async {
    try {
      final orderPlaceResponse = await orderRemoteRepo.getOrderResponse(orderCheckParam: orderCheckParam);
      return right(orderPlaceResponse);
    } on DioException catch (e) {
      return left(HandleExeption.handleError(error: e));
    }
  }
  
  @override
  Future<Either<Failure,CommonResponse>> getCancelOrderResponse({required OrderCancelParam orderCancelParam})async{
    try {
      final orderCancelResponse = await orderRemoteRepo.getCancelOrder(orderCancelParam: orderCancelParam);
      return right(orderCancelResponse);
    } on DioException catch (e) {
      return left(HandleExeption.handleError(error: e));
    }
  }
}
