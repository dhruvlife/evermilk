
class Order {
  int? subscriptionId;
  String? subscriptionType;
  int? orderId;
  String? deliveryType;
  String? totalSalePrice;
  String? totalSalePriceDecimal;
  int? packageId;
  String? name;
  int? orderPackageId;
  String? packageSize;
  int? qty;
  String? dayQty;
  String? refundStatus;
  String? salePrice;
  String? salePriceDecimal;
  String? volume;
  String? imageUrl;
  String? packageStatus;
  int? modifiedQty;

  Order(
      {this.subscriptionId,
      this.subscriptionType,
      this.orderId,
      this.deliveryType,
      this.totalSalePrice,
      this.totalSalePriceDecimal,
      this.packageId,
      this.name,
      this.orderPackageId,
      this.packageSize,
      this.qty,
      this.dayQty,
      this.refundStatus,
      this.salePrice,
      this.salePriceDecimal,
      this.volume,
      this.imageUrl,
      this.packageStatus,
      this.modifiedQty});

  Order.fromJson(Map<String, dynamic> json) {
    subscriptionId = json['subscription_id'];
    subscriptionType = json['subscription_type'];
    orderId = json['order_id'];
    deliveryType = json['delivery_type'];
    totalSalePrice = json['total_sale_price'];
    totalSalePriceDecimal = json['total_sale_price_decimal'];
    packageId = json['package_id'];
    name = json['name'];
    orderPackageId = json['order_package_id'];
    packageSize = json['package_size'];
    qty = json['qty'];
    dayQty = json['day_qty'];
    refundStatus = json['refund_status'];
    salePrice = json['sale_price'];
    salePriceDecimal = json['sale_price_decimal'];
    volume = json['volume'];
    imageUrl = json['image_url'];
    packageStatus = json['package_status'];
    modifiedQty = json['modified_qty'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['subscription_id'] = subscriptionId;
    data['subscription_type'] = subscriptionType;
    data['order_id'] = orderId;
    data['delivery_type'] = deliveryType;
    data['total_sale_price'] = totalSalePrice;
    data['total_sale_price_decimal'] = totalSalePriceDecimal;
    data['package_id'] = packageId;
    data['name'] = name;
    data['order_package_id'] = orderPackageId;
    data['package_size'] = packageSize;
    data['qty'] = qty;
    data['day_qty'] = dayQty;
    data['refund_status'] = refundStatus;
    data['sale_price'] = salePrice;
    data['sale_price_decimal'] = salePriceDecimal;
    data['volume'] = volume;
    data['image_url'] = imageUrl;
    data['package_status'] = packageStatus;
    data['modified_qty'] = modifiedQty;
    return data;
  }
}
