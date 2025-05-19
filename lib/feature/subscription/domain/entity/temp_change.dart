class TempChanges {
  int? tempSubId;
  int? orderSubscriptionId;
  String? tempStartDate;
  String? tempEndDate;
  int? tempQty;
  TempChanges({
    this.tempSubId,
    this.orderSubscriptionId,
    this.tempStartDate,
    this.tempEndDate,
    this.tempQty,
  });
  TempChanges.fromJson(Map<String, dynamic> json) {
    tempSubId = json['temp_sub_id'];
    orderSubscriptionId = json['order_subscription_id'];
    tempStartDate = json['temp_start_date'];
    tempEndDate = json['temp_end_date'];
    tempQty = json['temp_qty'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['temp_sub_id'] = tempSubId;
    data['order_subscription_id'] = orderSubscriptionId;
    data['temp_start_date'] = tempStartDate;
    data['temp_end_date'] = tempEndDate;
    data['temp_qty'] = tempQty;
    return data;
  }
}
