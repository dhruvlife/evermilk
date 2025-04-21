import 'package:milkride/feature/product/domain/entities/product.dart';

class ProdVariantsResponse {
  String? status;
  int? statusCode;
  String? message;
  List<Product>? prodInfo;
  bool? morningCutoff;
  bool? eveningCutoff;

  ProdVariantsResponse({
    this.status,
    this.statusCode,
    this.message,
    this.prodInfo,
    this.morningCutoff,
    this.eveningCutoff,
  });
}