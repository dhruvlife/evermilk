import 'package:milkride/feature/product/domain/entities/product_info.dart';

class ProductDetailResponse {
  String? status;
  int? statusCode;
  String? message;
  ProductInfo? data;

  ProductDetailResponse({
    this.status,
    this.statusCode,
    this.message,
    this.data,
  });
}
