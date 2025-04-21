import 'package:milkride/feature/product/domain/entities/categories.dart';

class CategoryResponse {
  String? status;
  int? statusCode;
  String? message;
  List<Categories>? categories;

  CategoryResponse({this.status, this.statusCode, this.message, this.categories});
}
