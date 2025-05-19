
import 'package:milkride/feature/wallet/domain/entities/recharge.dart';

class WalletHistoryResponse{
  String? status;
  int? statusCode;
  String? message;
  List<Recharge>? recharge;
  WalletHistoryResponse({this.status, this.statusCode, this.message, this.recharge});
}

