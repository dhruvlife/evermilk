class ProfileData {
  int? id;
  String? name;
  String? mobileNumber;
  String? email;
  String? gender;
  String? deliveryType;
  int? isPostpaid;
  String? customerReferrerCode;
  int? isVacation;
  String? address;
  String? hub;
  String? area;
  String? latestWallet;
  String? creditLimit;
  String? deliveryBoyName;

  ProfileData(
      {this.id,
      this.name,
      this.mobileNumber,
      this.email,
      this.gender,
      this.deliveryType,
      this.isPostpaid,
      this.customerReferrerCode,
      this.isVacation,
      this.address,
      this.hub,
      this.area,
      this.latestWallet,
      this.creditLimit,
      this.deliveryBoyName});

  ProfileData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    mobileNumber = json['mobile_number'];
    email = json['email'];
    gender = json['gender'];
    deliveryType = json['delivery_type'];
    isPostpaid = json['is_postpaid'];
    customerReferrerCode = json['customer_referrer_code'];
    isVacation = json['isVacation'];
    address = json['address'];
    hub = json['hub'];
    area = json['area'];
    latestWallet = json['latest_wallet'];
    creditLimit = json['credit_limit'];
    deliveryBoyName = json['delivery_boy_name'];
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
    data['isVacation'] = isVacation;
    data['address'] = address;
    data['hub'] = hub;
    data['area'] = area;
    data['latest_wallet'] = latestWallet;
    data['credit_limit'] = creditLimit;
    data['delivery_boy_name'] = deliveryBoyName;
    return data;
  }
}