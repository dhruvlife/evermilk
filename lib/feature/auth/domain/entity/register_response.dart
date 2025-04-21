import 'package:milkride/feature/auth/domain/entity/customer.dart';

class RegisterResponse {
  String? status;
  int? statusCode;
  String? message;
  Customer? customer;
  String? appToken;

  RegisterResponse({
    this.appToken,
    this.customer,
    this.message,
    this.status,
    this.statusCode,
  });
}
