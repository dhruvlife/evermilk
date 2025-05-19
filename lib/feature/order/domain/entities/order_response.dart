import 'package:milkride/feature/order/domain/entities/order_detail.dart';

class OrderResponse {
  String? status;
  int? statusCode;
  String? message;
  OrderDetail? data;
  String? toBeDeliveredGrandTotal;
  String? toBeDeliveredGrandTotalDecimal;
  String? deliveredGrandTotal;
  String? deliveredGrandTotalDecimal;
  String? refundGrandTotal;
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
