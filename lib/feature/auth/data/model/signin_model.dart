
import 'package:milkride/feature/auth/domain/entity/signin_response.dart';

class SignInModel extends SignInResponse {
  SignInModel({
    super.status,
    super.statusCode,
    super.message,
    super.data,
    super.userId,
  });

  SignInModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    statusCode = json['statusCode'];
    message = json['message'];
    data = json['data'];
    userId = json['user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> response = <String, dynamic>{};
    response['status'] = status;
    response['statusCode'] = statusCode;
    response['message'] = message;
    response['data'] = data;
    response['user_id'] = userId;
    return response;
  }
}
