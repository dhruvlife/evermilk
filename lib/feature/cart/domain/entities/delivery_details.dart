class DeliveryDetails {
  String? deliveryDate;
  String? deliveryAddress;
  String? customerId;
  DeliveryDetails({this.deliveryDate, this.deliveryAddress, this.customerId});

  DeliveryDetails.fromJson(Map<String, dynamic> json) {
    deliveryDate = json['delivery_date'];
    deliveryAddress = json['delivery_address'];
    customerId = json['customer_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['delivery_date'] = deliveryDate;
    data['delivery_address'] = deliveryAddress;
    data['customer_id'] = customerId;
    return data;
  }
}