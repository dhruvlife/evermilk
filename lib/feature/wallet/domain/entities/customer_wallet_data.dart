class CustomerWalletData {
  String? email;
  String? wallet;
  String? creditLimit;
  bool? acceptByCash;
  bool? acceptByOnline;
  int? minimumCashCollection;
  int? minimumRecharge;
  int? maximumCashCollection;
  int? maximumRecharge;

  CustomerWalletData(
      {this.email,
      this.wallet,
      this.creditLimit,
      this.acceptByCash,
      this.acceptByOnline,
      this.minimumCashCollection,
      this.minimumRecharge,
      this.maximumCashCollection,
      this.maximumRecharge});

  CustomerWalletData.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    wallet = json['wallet'];
    creditLimit = json['credit_limit'];
    acceptByCash = json['accept_by_cash'];
    acceptByOnline = json['accept_by_online'];
    minimumCashCollection = json['minimum_cash_collection'];
    minimumRecharge = json['minimum_recharge'];
    maximumCashCollection = json['maximum_cash_collection'];
    maximumRecharge = json['maximum_recharge'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['wallet'] = wallet;
    data['credit_limit'] = creditLimit;
    data['accept_by_cash'] = acceptByCash;
    data['accept_by_online'] = acceptByOnline;
    data['minimum_cash_collection'] = minimumCashCollection;
    data['minimum_recharge'] = minimumRecharge;
    data['maximum_cash_collection'] = maximumCashCollection;
    data['maximum_recharge'] = maximumRecharge;
    return data;
  }
}
