import 'package:milkride/feature/cart/data/model/common_data_model.dart';
import 'package:milkride/feature/order/data/model/order_data_model.dart';
import 'package:milkride/feature/order/domain/usecase/order_cancel_usecase.dart';
import 'package:milkride/feature/order/domain/usecase/order_get_usecase.dart';
import 'package:milkride/feature/order/domain/usecase/order_place_usecase.dart';
import 'package:milkride/service.dart/api_service.dart';

abstract interface class OrderRemoteRepo {
  Future<CommonDataModel> getOrderPlaceResponse({required OrderPlaceParam orderPlaceParam});
  Future<OrderDataModel> getOrderResponse({required OrderCheckParam orderCheckParam});
  Future<CommonDataModel> getCancelOrder({required OrderCancelParam orderCancelParam});
}

class OrderImplRemoteRepo implements OrderRemoteRepo {
  final ApiService apiService;
  OrderImplRemoteRepo({required this.apiService});
  @override
  Future<CommonDataModel> getOrderPlaceResponse({required OrderPlaceParam orderPlaceParam}) {
    return apiService.getOrderPlace(
      userId: orderPlaceParam.userId,
      customerId: orderPlaceParam.customerId.toString(),
    );
  }

  @override
  Future<OrderDataModel> getOrderResponse({required OrderCheckParam orderCheckParam}) {
    return apiService.getOrders(
      date: orderCheckParam.deliveryDate,
      customerId: orderCheckParam.customerId.toString(),
    );
  }

  @override
  Future<CommonDataModel> getCancelOrder({required OrderCancelParam orderCancelParam}) {
    return apiService.getCancelOrder(
      orderId: orderCancelParam.orderId,
      packageId: orderCancelParam.packageId,
      reasonId: orderCancelParam.reasonId,
    );
  }
}
