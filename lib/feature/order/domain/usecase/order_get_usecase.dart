import 'package:fpdart/fpdart.dart';
import 'package:milkride/core/failure/failure.dart';
import 'package:milkride/core/usecase/usecase.dart';
import 'package:milkride/feature/order/domain/entities.dart/order_response.dart';
import 'package:milkride/feature/order/domain/repository/order_repository.dart';

class OrderGetUsecase implements Usecase<OrderResponse,OrderCheckParam> {
  final OrderRepository orderRepository;
  OrderGetUsecase({required this.orderRepository});
  @override
  Future<Either<Failure,OrderResponse>> call(OrderCheckParam orderCheckParam)async {
    return await orderRepository.getOrderCheckResponse(orderCheckParam: orderCheckParam);
  }
}

class OrderCheckParam {
  final String deliveryDate;
  final int customerId;
  OrderCheckParam({
    required this.deliveryDate,
    required this.customerId,
  });
}
