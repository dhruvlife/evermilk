import 'package:milkride/feature/wallet/domain/entities/wallet_data.dart';

class WalletResponse {
  String? status;
  int? statusCode;
  String? message;
  WalletData? data;
  WalletResponse({this.data, this.message, this.status, this.statusCode});
}
