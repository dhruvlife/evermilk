import 'package:milkride/feature/auth/domain/entity/customer.dart';
import 'package:milkride/feature/auth/domain/entity/otp_response.dart';

class OtpVerifyModel extends OtpResponse {
  OtpVerifyModel({
    super.status,
    super.statusCode,
    super.message,
    super.response,
    super.appToken,
    super.customer,
  });

  OtpVerifyModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    statusCode = json['statusCode'];
    message = json['message'];
    response = json['response'];
    appToken = json['app_token'];
    customer =
        json['customer'] != null ? Customer.fromJson(json['customer']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> response = <String, dynamic>{};
    response['status'] = status;
    response['statusCode'] = statusCode;
    response['message'] = message;
    response['response'] = this.response;
    response['app_token'] = appToken;
    if (customer != null) {
      response['customer'] = customer!.toJson();
    }
    return response;
  }
}


