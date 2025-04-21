import 'package:milkride/feature/product/domain/entities/product_detail_response.dart';
import 'package:milkride/feature/product/domain/entities/product_info.dart';

class ProductDetailModel extends ProductDetailResponse {
  ProductDetailModel({super.status, super.statusCode, super.message, super.data});

  ProductDetailModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    statusCode = json['statusCode'];
    message = json['message'];
    data = json['data'] != null ? ProductInfo.fromJson(json['data']) : null;
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
