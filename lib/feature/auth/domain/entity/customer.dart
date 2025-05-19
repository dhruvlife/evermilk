class Customer {
  int? id;
  String? name;
  String? mobileNumber;
  String? email;
  String? gender;
  String? deliveryType;
  int? isPostpaid;
  String? customerReferrerCode;
  dynamic wallet;
  String? creditLimit;

  Customer(
      {this.id,
      this.name,
      this.mobileNumber,
      this.email,
      this.gender,
      this.deliveryType,
      this.isPostpaid,
      this.customerReferrerCode,
      this.creditLimit,
      this.wallet
      });

  Customer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    mobileNumber = json['mobile_number'];
    email = json['email'];
    gender = json['gender'];
    deliveryType = json['delivery_type'];
    isPostpaid = json['is_postpaid'];
    customerReferrerCode = json['customer_referrer_code'];
    wallet = json['wallet'];
    creditLimit = json['credit_limit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['mobile_number'] = mobileNumber;
    data['email'] = email;
    data['gender'] = gender;
    data['delivery_type'] = deliveryType;
    data['is_postpaid'] = isPostpaid;
    data['customer_referrer_code'] = customerReferrerCode;
    data['wallet'] = wallet;
    data['credit_limit'] = creditLimit;
    return data;
  }
}