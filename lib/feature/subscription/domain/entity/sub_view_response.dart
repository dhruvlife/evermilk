import 'package:milkride/feature/subscription/domain/entity/sub_detail.dart';

class SubscriptionViewResponse {
  String? status;
  int? statusCode;
  String? message;
  List<SubScriptionDetail>? data;
  SubscriptionViewResponse({
    required this.status,
    required this.statusCode,
    required this.message,
    required this.data,
  });
}
