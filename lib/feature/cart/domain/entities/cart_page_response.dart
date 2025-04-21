import 'package:milkride/feature/cart/domain/entities/cart_info.dart';

class CartPageResponse {
  String? status;
  int? statusCode;
  String? message;
  CartInfo? cartResponse;

  CartPageResponse({this.status, this.statusCode, this.message, this.cartResponse});
}