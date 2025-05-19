import 'package:milkride/feature/wallet/domain/entities/payment_data.dart';

class PaymentResponse {
  String? status;
  int? statusCode;
  String? message;
  PaymentData? data;
  PaymentResponse({this.status, this.statusCode, this.message, this.data});
}

