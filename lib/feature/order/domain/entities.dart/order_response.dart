import 'package:milkride/feature/order/domain/entities.dart/order_detail.dart';

class OrderResponse {
  String? status;
  int? statusCode;
  String? message;
  OrderDetail? data;
  int? toBeDeliveredGrandTotal;
  String? toBeDeliveredGrandTotalDecimal;
  int? deliveredGrandTotal;
  String? deliveredGrandTotalDecimal;
  int? refundGrandTotal;
  String? refundGrandTotalDecimal;

  OrderResponse({
    this.status,
    this.statusCode,
    this.message,
    this.data,
    this.toBeDeliveredGrandTotal,
    this.toBeDeliveredGrandTotalDecimal,
    this.deliveredGrandTotal,
    this.deliveredGrandTotalDecimal,
    this.refundGrandTotal,
    this.refundGrandTotalDecimal,
  });
}
