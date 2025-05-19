class PaymentData {
  String? customerId;
  String? amount;
  String? customerName;
  String? email;
  String? mobileNumber;
  String? link;
  String? orderId;
  String? razorPayApi;
  String? razorPaySecretKey;

  PaymentData(
      {this.customerId,
      this.amount,
      this.customerName,
      this.email,
      this.mobileNumber,
      this.link,
      this.orderId,
      this.razorPayApi,
      this.razorPaySecretKey});

  PaymentData.fromJson(Map<String, dynamic> json) {
    customerId = json['customer_id'];
    amount = json['amount'];
    customerName = json['customer_name'];
    email = json['email'];
    mobileNumber = json['mobile_number'];
    link = json['link'];
    orderId = json['order_id'];
    razorPayApi = json['razor_pay_api'];
    razorPaySecretKey = json['razor_pay_secret_key'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['customer_id'] = customerId;
    data['amount'] = amount;
    data['customer_name'] = customerName;
    data['email'] = email;
    data['mobile_number'] = mobileNumber;
    data['link'] = link;
    data['order_id'] = orderId;
    data['razor_pay_api'] = razorPayApi;
    data['razor_pay_secret_key'] = razorPaySecretKey;
    return data;
  }
}
