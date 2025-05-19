import 'package:milkride/feature/order/domain/entities/order_reason.dart';
import 'package:milkride/feature/order/domain/entities/to_be_delivered.dart';

class OrderDetail {
  List<Order>? toBeDelivered;
  List<Order>? delivered;
  List<Order>? refund;
  List<OrderReasons>? orderReasons;

  OrderDetail({this.toBeDelivered, this.delivered, this.refund, this.orderReasons});

  OrderDetail.fromJson(Map<String, dynamic> json) {
    if (json['to_be_delivered'] != null) {
      toBeDelivered = <Order>[];
      json['to_be_delivered'].forEach((v) {
        toBeDelivered!.add(Order.fromJson(v));
      });
    }
    if (json['delivered'] != null) {
      delivered = <Order>[];
      json['delivered'].forEach((v) {
        delivered!.add(Order.fromJson(v));
      });
    }
    if (json['refund'] != null) {
      refund = <Order>[];
      json['refund'].forEach((v) {
        refund!.add(Order.fromJson(v));
      });
    }
    if (json['order_reasons'] != null) {
      orderReasons = <OrderReasons>[];
      json['order_reasons'].forEach((v) {
        orderReasons!.add(OrderReasons.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (toBeDelivered != null) {
      data['to_be_delivered'] =
          toBeDelivered!.map((v) => v.toJson()).toList();
    }
    if (delivered != null) {
      data['delivered'] = delivered!.map((v) => v.toJson()).toList();
    }
    if (refund != null) {
      data['refund'] = refund!.map((v) => v.toJson()).toList();
    }
    if (orderReasons != null) {
      data['order_reasons'] =
          orderReasons!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
