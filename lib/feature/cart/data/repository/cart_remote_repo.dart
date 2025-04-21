import 'dart:convert';

import 'package:milkride/feature/cart/data/model/cart_page_model.dart';
import 'package:milkride/feature/cart/data/model/common_data_model.dart';
import 'package:milkride/feature/cart/domain/usecase/subscription_usecase.dart';
import 'package:milkride/service.dart/api_service.dart';

abstract interface class CartRemoteRepo {
  Future<CartPageModel> getCartPageResponse({required String customerId});
  Future<CommonDataModel> getCartQtyUpdateResponse({required List<Map<String, String>> cartData});
  Future<CommonDataModel> getRemoveCartItemResponse({required String cartId});
  Future<CommonDataModel> getSubcribeResponse({required SubScribeCartParam subScribeCartParam});
}

class CartImplRemoteRepo implements CartRemoteRepo {
  final ApiService apiService;
  CartImplRemoteRepo({required this.apiService});

  @override
  Future<CartPageModel> getCartPageResponse({required String customerId}) async {
    return await apiService.getCartPageDetails(customerId: customerId);
  }

  @override
  Future<CommonDataModel> getCartQtyUpdateResponse({required List<Map<String, String>> cartData}) async {
    final jsonCart = jsonEncode(cartData);
    return await apiService.getCartQuantityUpdateDetails(cartJson: jsonCart);
  }

  @override
  Future<CommonDataModel> getRemoveCartItemResponse({required String cartId}) async {
    return await apiService.getRemoveCartItemDetails(cartId: cartId);
  }

  @override
  Future<CommonDataModel> getSubcribeResponse({required SubScribeCartParam subScribeCartParam}) async {
    return await apiService.getSubcriptionResponse(
        customerId: subScribeCartParam.customerId,
        packageId: subScribeCartParam.packageId,
        userId: subScribeCartParam.userId,
        frequencyType: subScribeCartParam.frequencyType,
        frequencyValue: subScribeCartParam.frequencyValue,
        quantity: subScribeCartParam.quantity,
        schedule: subScribeCartParam.schedule,
        dayWiseQuantity: subScribeCartParam.dayWiseQuantity,
        deliveryType: subScribeCartParam.deliveryType,
        startDate: subScribeCartParam.startDate,
        endDate: subScribeCartParam.endDate,
        trialProduct: subScribeCartParam.trialProduct,
        noOfUsages: subScribeCartParam.noOfUsages,
        productId: subScribeCartParam.productId,
    );
  }
}
