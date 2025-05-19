import 'package:milkride/feature/all_product/domain/entities/all_product_data.dart';
import 'package:milkride/feature/all_product/domain/entities/all_product_response.dart';

class AllProductModel extends AllProductResponse{
  AllProductModel({super.status, super.statusCode, super.message, super.allProductdata});
  
  AllProductModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    statusCode = json['statusCode'];
    message = json['message'];
    allProductdata = json['data'] != null ? AllProductData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['statusCode'] = statusCode;
    data['message'] = message;
    if (allProductdata != null) {
      data['data'] = allProductdata!.toJson();
    }
    return data;
  }
}


