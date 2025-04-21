import 'package:fpdart/fpdart.dart';
import 'package:milkride/core/failure/failure.dart';
import 'package:milkride/feature/cart/domain/entities/common_response.dart';
import 'package:milkride/feature/order/domain/entities.dart/order_response.dart';
import 'package:milkride/feature/order/domain/usecase/order_cancel_usecase.dart';
import 'package:milkride/feature/order/domain/usecase/order_get_usecase.dart';
import 'package:milkride/feature/order/domain/usecase/order_place_usecase.dart';

abstract interface class OrderRepository {
  Future<Either<Failure, CommonResponse>> getOrderPlaceResponse({required OrderPlaceParam orderPlaceParam});
  Future<Either<Failure, OrderResponse>> getOrderCheckResponse({required OrderCheckParam orderCheckParam});
  Future<Either<Failure, CommonResponse>> getCancelOrderResponse({required OrderCancelParam orderCancelParam});
}

