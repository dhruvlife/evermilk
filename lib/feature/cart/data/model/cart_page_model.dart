import 'package:milkride/feature/cart/domain/entities/cart_info.dart';
import 'package:milkride/feature/cart/domain/entities/cart_page_response.dart';

class CartPageModel extends CartPageResponse{
  CartPageModel({super.status, super.statusCode, super.message, super.cartResponse});

  CartPageModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    statusCode = json['statusCode'];
    message = json['message'];
    cartResponse = json['data'] != null ? CartInfo.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> response = <String, dynamic>{};
    response['status'] = status;
    response['statusCode'] = statusCode;
    response['message'] = message;
    if (cartResponse != null) {
      response['data'] = cartResponse?.toJson();
    }
    return response;
  }
}

