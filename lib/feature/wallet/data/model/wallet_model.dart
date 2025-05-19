import 'package:milkride/feature/wallet/domain/entities/wallet_data.dart';
import 'package:milkride/feature/wallet/domain/entities/wallet_response.dart';

class WalletModel extends WalletResponse {
  WalletModel({super.status, super.statusCode, super.message, super.data});

  WalletModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    statusCode = json['statusCode'];
    message = json['message'];
    data = json['data'] != null ? WalletData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['statusCode'] = statusCode;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}
