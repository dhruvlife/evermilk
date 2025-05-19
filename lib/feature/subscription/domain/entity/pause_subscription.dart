class PauseSubscription {
  int? pauseSubId;
  String? pauseStartDate;
  String? pauseEndDate;
  PauseSubscription({this.pauseSubId, this.pauseStartDate, this.pauseEndDate});

  PauseSubscription.fromJson(Map<String, dynamic> json) {
    pauseSubId = json['pause_sub_id'];
    pauseStartDate = json['pause_start_date'];
    pauseEndDate = json['pause_end_date'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['pause_sub_id'] = pauseSubId;
    data['pause_start_date'] = pauseStartDate;
    data['pause_end_date'] = pauseEndDate;
    return data;
  }
}
