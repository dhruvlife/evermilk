import 'package:milkride/feature/subscription/domain/entity/sub_detail.dart';
import 'package:milkride/feature/subscription/domain/entity/sub_view_response.dart';

class SubscriptionViewModel extends SubscriptionViewResponse {
  SubscriptionViewModel({
    super.status,
    super.statusCode,
    super.message,
    super.data,
  });
  factory SubscriptionViewModel.fromJson(Map<String, dynamic> json) {
    return SubscriptionViewModel(
      status: json['status'],
      statusCode: json['statusCode'],
      message: json['message'],
      data: json['data'] != null
          ? (json['data'] as List).map((v) => SubScriptionDetail.fromJson(v)).toList()
          : null,
    );
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['statusCode'] = statusCode;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
