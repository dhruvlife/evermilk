import 'package:fpdart/fpdart.dart';
import 'package:milkride/core/failure/failure.dart';
import 'package:milkride/core/usecase/usecase.dart';
import 'package:milkride/feature/cart/domain/entities/common_response.dart';
import 'package:milkride/feature/order/domain/repository/order_repository.dart';

class OrderCancelUsecase implements Usecase<CommonResponse,OrderCancelParam> {
  final OrderRepository orderRepository;
  OrderCancelUsecase({required this.orderRepository});
  @override
  Future<Either<Failure,CommonResponse>> call(OrderCancelParam orderCancelParam)async{
    return await orderRepository.getCancelOrderResponse(orderCancelParam: orderCancelParam);
  }
}

class OrderCancelParam {
  final String orderId;
  final String packageId;
  final String reasonId;
  OrderCancelParam({
    required this.orderId,
    required this.packageId,
    required this.reasonId,
  });
}
