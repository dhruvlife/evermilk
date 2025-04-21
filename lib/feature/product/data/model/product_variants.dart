import 'package:milkride/feature/product/domain/entities/product.dart';
import 'package:milkride/feature/product/domain/entities/product_variants_resp.dart';

class ProdVariantsModel extends ProdVariantsResponse{
  ProdVariantsModel({
    super.status,
    super.statusCode,
    super.message,
    super.prodInfo,
    super.morningCutoff,
    super.eveningCutoff,
  });

  ProdVariantsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    statusCode = json['statusCode'];
    message = json['message'];
    if (json['data'] != null) {
      prodInfo = <Product>[];
      json['data'].forEach((v) {
        prodInfo!.add(Product.fromJson(v));
      });
    }
    morningCutoff = json['morning_cutoff'];
    eveningCutoff = json['evening_cutoff'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['statusCode'] = statusCode;
    data['message'] = message;
    if (prodInfo != null) {
      data['data'] = prodInfo!.map((v) => v.toJson()).toList();
    }
    data['morning_cutoff'] = morningCutoff;
    data['evening_cutoff'] = eveningCutoff;
    return data;
  }
}
