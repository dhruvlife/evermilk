class WalletHistory {
  int? id;
  String? createdAt;
  String? amountType;
  String? amount;
  String? walletReason;
  String? paymentStatus;
  String? date;
  String? paymentType;
  String? balance;
  String? reason;

  WalletHistory({
    this.id,
    this.createdAt,
    this.amountType,
    this.amount,
    this.walletReason,
    this.paymentStatus,
    this.date,
    this.paymentType,
    this.balance,
    this.reason,
  });

  WalletHistory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['created_at'];
    amountType = json['amount_type'];
    amount = json['amount'];
    walletReason = json['wallet_reason'];
    paymentStatus = json['payment_status'];
    date = json['date'];
    paymentType = json['payment_type'];
    balance = json['balance'];
    reason = json['reason'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['created_at'] = createdAt;
    data['amount_type'] = amountType;
    data['amount'] = amount;
    data['wallet_reason'] = walletReason;
    data['payment_status'] = paymentStatus;
    data['date'] = date;
    data['payment_type'] = paymentType;
    data['balance'] = balance;
    data['reason'] = reason;
    return data;
  }
}