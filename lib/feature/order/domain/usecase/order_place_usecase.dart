import 'package:fpdart/fpdart.dart';
import 'package:milkride/core/failure/failure.dart';
import 'package:milkride/core/usecase/usecase.dart';
import 'package:milkride/feature/cart/domain/entities/common_response.dart';
import 'package:milkride/feature/order/domain/repository/order_repository.dart';

class OrderUsecase implements Usecase<CommonResponse,OrderPlaceParam> {
  final OrderRepository orderRepository;
  OrderUsecase({required this.orderRepository});
  @override
  Future<Either<Failure,CommonResponse>> call(OrderPlaceParam orderPlaceParam)async {
    return await orderRepository.getOrderPlaceResponse(orderPlaceParam: orderPlaceParam);
  }
}

class OrderPlaceParam {
  final String userId;
  final int customerId;
  OrderPlaceParam({
    required this.userId,
    required this.customerId,
  });
}

