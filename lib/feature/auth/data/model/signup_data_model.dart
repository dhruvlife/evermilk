import 'package:milkride/feature/auth/domain/entity/signup_data_response.dart';
import 'package:milkride/feature/auth/domain/entity/register_signup_detail.dart';

class SignupDataModel extends SignupDataResponse {
  SignupDataModel({
    super.status,
    super.statusCode,
    super.message,
    super.data,
  });

  SignupDataModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    statusCode = json['statusCode'];
    message = json['message'];
    data = json['data'] != null ? SignupDetail.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> response = <String, dynamic>{};
    response['status'] = status;
    response['statusCode'] = statusCode;
    response['message'] = message;
    if (data != null) {
      response['data'] = data!.toJson();
    }
    return response;
  }
}
