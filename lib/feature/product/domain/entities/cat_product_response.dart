import 'package:milkride/feature/product/domain/entities/product.dart';

class CategoryProductResponse {
  String? status;
  int? statusCode;
  String? message;
  List<Product>? prodData;

  CategoryProductResponse({this.status, this.statusCode, this.message, this.prodData});
}
