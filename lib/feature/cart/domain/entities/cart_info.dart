
import 'package:milkride/feature/cart/domain/entities/delivery_details.dart';
import 'package:milkride/feature/product/domain/entities/product.dart';

class CartInfo {
  List<Product>? package;
  DeliveryDetails? deliveryDetails;
  CartInfo({this.package, this.deliveryDetails});
  
  CartInfo.fromJson(Map<String, dynamic> json) {
    if (json['package'] != null) {
      package = <Product>[];
      json['package'].forEach((v) {
        package!.add( Product.fromJson(v));
      });
    }
    deliveryDetails = json['delivery_details'] != null
        ? DeliveryDetails.fromJson(json['delivery_details'])
        : null;
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (package != null) {
      data['package'] = package!.map((v) => v.toJson()).toList();
    }
    if (deliveryDetails != null) {
      data['delivery_details'] = deliveryDetails!.toJson();
    }
    return data;
  }
}