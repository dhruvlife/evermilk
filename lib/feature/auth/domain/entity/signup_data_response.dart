
import 'package:milkride/feature/auth/domain/entity/register_signup_detail.dart';

class SignupDataResponse {
  String? status;
  int? statusCode;
  String? message;
  SignupDetail? data;

  SignupDataResponse({this.status, this.statusCode, this.message, this.data});
}