import 'package:milkride/feature/all_product/domain/entities/all_product_data.dart';

class AllProductResponse {
  String? status;
  int? statusCode;
  String? message;
  AllProductData? allProductdata;
  AllProductResponse({
    this.status,
    this.statusCode,
    this.message,
    this.allProductdata,
  });
}
