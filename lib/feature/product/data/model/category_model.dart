import 'package:milkride/feature/product/domain/entities/categories.dart';
import 'package:milkride/feature/product/domain/entities/category_response.dart';

class CategoryModel extends CategoryResponse{
  CategoryModel({super.status, super.statusCode, super.message, super.categories});
  CategoryModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    statusCode = json['statusCode'];
    message = json['message'];
    if (json['data'] != null) {
      categories = <Categories>[];
      json['data'].forEach((v) {
        categories!.add(Categories.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['statusCode'] = statusCode;
    data['message'] = message;
    if (categories != null) {
      data['data'] = categories!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
