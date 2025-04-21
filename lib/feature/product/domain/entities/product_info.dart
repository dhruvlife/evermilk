
import 'package:milkride/feature/product/domain/entities/product.dart';

class ProductInfo {
  List<Product>? filteredPackages;
  List<String>? extraImages;
  String? morningCutoff;
  String? eveningCutoff;
  bool? morningCutoffFlag;
  bool? eveningCutoffFlag;

  ProductInfo(
      {this.filteredPackages,
      this.extraImages,
      this.morningCutoff,
      this.eveningCutoff,
      this.morningCutoffFlag,
      this.eveningCutoffFlag});

  ProductInfo.fromJson(Map<String, dynamic> json) {
    if (json['filteredPackages'] != null) {
      filteredPackages = <Product>[];
      json['filteredPackages'].forEach((v) {
        filteredPackages!.add(Product.fromJson(v));
      });
    }
    extraImages = json['extraImages'].cast<String>();
    morningCutoff = json['morning_cutoff'];
    eveningCutoff = json['evening_cutoff'];
    morningCutoffFlag = json['morning_cutoff_flag'];
    eveningCutoffFlag = json['evening_cutoff_flag'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (filteredPackages != null) {
      data['filteredPackages'] =
          filteredPackages?.map((v) => v.toJson()).toList();
    }
    data['extraImages'] = extraImages;
    data['morning_cutoff'] = morningCutoff;
    data['evening_cutoff'] = eveningCutoff;
    data['morning_cutoff_flag'] = morningCutoffFlag;
    data['evening_cutoff_flag'] = eveningCutoffFlag;
    return data;
  }
}
