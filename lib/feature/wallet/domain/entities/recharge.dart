import 'package:milkride/feature/wallet/domain/entities/wallet_history.dart';

class Recharge {
  String? date;
  List<WalletHistory>? rechargeData;

  Recharge({this.date, this.rechargeData});

  Recharge.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    if (json['data'] != null) {
      rechargeData = <WalletHistory>[];
      json['data'].forEach((v) {
        rechargeData!.add(WalletHistory.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['date'] = date;
    if (rechargeData != null) {
      data['data'] = rechargeData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}