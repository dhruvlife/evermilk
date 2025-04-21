import 'package:milkride/feature/auth/domain/entity/customer.dart';

class OtpResponse {
  String? status;
  int? statusCode;
  String? message;
  String? response;
  String? appToken;
  Customer? customer;
  OtpResponse({
    this.appToken,
    this.customer,
    this.message,
    this.response,
    this.status,
    this.statusCode,
  });
}
