import 'package:milkride/feature/product/domain/entities/product.dart';

class AllProductData {
  int? totalProductCount;
  List<Product>? packages;
  int? totalPages;
  int? totalItems;
  bool? morningCutoff;
  bool? eveningCutoff;

  AllProductData(
      {this.totalProductCount,
      this.packages,
      this.totalPages,
      this.totalItems,
      this.morningCutoff,
      this.eveningCutoff});

  AllProductData.fromJson(Map<String, dynamic> json) {
    totalProductCount = json['total_product_count'];
    if (json['packages'] != null) {
      packages = <Product>[];
      json['packages'].forEach((v) {
        packages!.add(Product.fromJson(v));
      });
    }
    totalPages = json['totalPages'];
    totalItems = json['totalItems'];
    morningCutoff = json['morning_cutoff'];
    eveningCutoff = json['evening_cutoff'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['total_product_count'] = totalProductCount;
    if (packages != null) {
      data['packages'] = packages!.map((v) => v.toJson()).toList();
    }
    data['totalPages'] = totalPages;
    data['totalItems'] = totalItems;
    data['morning_cutoff'] = morningCutoff;
    data['evening_cutoff'] = eveningCutoff;
    return data;
  }
}