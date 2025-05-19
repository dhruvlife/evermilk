import 'package:milkride/feature/wallet/domain/entities/recharge.dart';
import 'package:milkride/feature/wallet/domain/entities/wallet_history_response.dart';

class WalletHistory extends WalletHistoryResponse{
  WalletHistory({super.status, super.statusCode, super.message, super.recharge});
  WalletHistory.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    statusCode = json['statusCode'];
    message = json['message'];
    if (json['data'] != null) {
      recharge = <Recharge>[];
      json['data'].forEach((v) {
        recharge!.add(Recharge.fromJson(v));
      });
    }
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['statusCode'] = statusCode;
    data['message'] = message;
    if (recharge != null) {
      data['data'] = recharge!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
