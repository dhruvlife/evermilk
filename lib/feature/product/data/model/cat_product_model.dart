
import 'package:milkride/feature/product/domain/entities/product.dart';
import 'package:milkride/feature/product/domain/entities/cat_product_response.dart';

class CategoryProductModel extends CategoryProductResponse{
  CategoryProductModel({super.prodData, super.message, super.status, super.statusCode});

  CategoryProductModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    statusCode = json['statusCode'];
    message = json['message'];
    if (json['data'] != null) {
      prodData = <Product>[];
      json['data'].forEach((v) {
        prodData!.add(Product.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['statusCode'] = statusCode;
    data['message'] = message;
    if (prodData != null) {
      data['data'] = prodData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}