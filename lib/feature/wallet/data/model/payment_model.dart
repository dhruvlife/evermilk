import 'package:milkride/feature/wallet/domain/entities/payment_data.dart';
import 'package:milkride/feature/wallet/domain/entities/payment_response.dart';

class PaymentModel extends PaymentResponse {
  PaymentModel({super.status, super.statusCode, super.message, super.data});

  PaymentModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    statusCode = json['statusCode'];
    message = json['message'];
    data = json['data'] != null ? PaymentData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['statusCode'] = statusCode;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}



