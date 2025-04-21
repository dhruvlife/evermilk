import 'package:milkride/feature/cart/domain/entities/common_response.dart';

class CommonDataModel extends CommonResponse {
  CommonDataModel({super.status, super.statusCode, super.message, super.data});

  CommonDataModel.fromJson(Map<String, dynamic> json) {
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
