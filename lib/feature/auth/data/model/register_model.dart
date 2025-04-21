import 'package:milkride/feature/auth/domain/entity/customer.dart';
import 'package:milkride/feature/auth/domain/entity/register_response.dart';

class RegisterModel extends  RegisterResponse{
  RegisterModel({
    super.status,
    super.statusCode,
    super.message,
    super.customer,
    super.appToken,
  });

  RegisterModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    statusCode = json['statusCode'];
    message = json['message'];
    customer = json['customer'] != null
        ? Customer.fromJson(json['customer'])
        : null;
    appToken = json['app_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['statusCode'] = statusCode;
    data['message'] = message;
    if (customer != null) {
      data['customer'] = customer!.toJson();
    }
    data['app_token'] = appToken;
    return data;
  }
}

