import 'package:milkride/feature/auth/domain/entity/resend_otp_response.dart';

class ResendOtpModel extends ResendOtpResponse {
  ResendOtpModel({
    super.status,
    super.statusCode,
    super.message,
    super.data,
  });

  ResendOtpModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    statusCode = json['statusCode'];
    message = json['message'];
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> response = <String, dynamic>{};
    response['status'] = status;
    response['statusCode'] = statusCode;
    response['message'] = message;
    response['data'] = data;
    return response;
  }
}
