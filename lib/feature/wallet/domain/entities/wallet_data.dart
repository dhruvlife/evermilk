import 'package:milkride/feature/wallet/domain/entities/customer_wallet_data.dart';
import 'package:milkride/feature/wallet/domain/entities/wallet_history.dart';

class WalletData {
  CustomerWalletData? customerWalletData;
  List<WalletHistory>? walletHistory;
  WalletData({this.customerWalletData, this.walletHistory});
  WalletData.fromJson(Map<String, dynamic> json) {
    customerWalletData = json['customerData'] != null
        ? CustomerWalletData.fromJson(json['customerData'])
        : null;
    if (json['walletHistory'] != null) {
      walletHistory = <WalletHistory>[];
      json['walletHistory'].forEach((v) {
        walletHistory!.add(WalletHistory.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (customerWalletData != null) {
      data['customerData'] = customerWalletData!.toJson();
    }
    if (walletHistory != null) {
      data['walletHistory'] =
          walletHistory!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}