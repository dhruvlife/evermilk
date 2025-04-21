import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:milkride/core/constant/app_strings.dart';
import 'package:milkride/core/failure/failure.dart';
import 'package:milkride/core/utils/app_functional_components.dart';
import 'package:milkride/feature/cart/domain/entities/cart_info.dart';
import 'package:milkride/feature/cart/domain/entities/cart_page_response.dart';
import 'package:milkride/feature/cart/domain/entities/common_response.dart';
import 'package:milkride/feature/cart/domain/usecase/cart_page_usecase.dart';
import 'package:milkride/feature/cart/domain/usecase/cart_qty_update_usecase.dart';
import 'package:milkride/feature/cart/domain/usecase/remove_item_cart_usecase.dart';
import 'package:milkride/feature/cart/domain/usecase/subscription_usecase.dart';
import 'package:milkride/feature/cart/presentation/cubit/cart/cart_state.dart';
import 'package:milkride/feature/home/presentation/cubit/home_cubit.dart';
import 'package:milkride/service.dart/injection.dart';

class CartPageCubit extends Cubit<CartPageState> {
  final CartPageUsecase cartPageUsecase;
  final CartQtyUpdateUsecase cartQtyUpdateUsecase;
  final RemoveItemCartUsecase removeItemCartUsecase;
  final SubscriptionUsecase subscriptionUsecase;
  CartPageCubit({
    required this.cartPageUsecase,
    required this.cartQtyUpdateUsecase,
    required this.removeItemCartUsecase,
    required this.subscriptionUsecase,
  }) : super(CartPageInitial());

  Map<int, int> cartQuantities = {};
  Map<int, int> originalQuantities = {};
  double totalAmount = 0.0;
  
  Future<void> fetchCartPageDetail({required String customerId}) async {
    emit(CartPageLoading());
    final Either<Failure, CartPageResponse> result = await cartPageUsecase.call(customerId);
    result.fold(
      (failure) {
        AppFunctionalComponents.showSnackBar(message: failure.messege);
      },
      (result) {
        if (result.status == AppStrings.success && result.cartResponse != null) {
          cartQuantities.clear();
          originalQuantities.clear();
          for (var item in result.cartResponse?.package ?? []) {
            if (item.cartId != null) {
              int cartId = item.cartId!;
              int qty = item.qty ?? 1;
              cartQuantities[cartId] = qty;
              originalQuantities[cartId] = qty;
            }
          }
          final total = calculateTotalPrice(cartData:result.cartResponse!);
          emit(CartPageLoaded(
            cartPageResponse: result,
            productQuantities: Map<int, int>.from(cartQuantities),
            totalAmount: total,
          ));
        }
      },
    );
  }

  bool isCartChanged() {
    for (final entry in cartQuantities.entries) {
      final original = originalQuantities[entry.key] ?? 0;
      if (entry.value != original) {
        return true;
      }
    }
    return false;
  }

  double calculateTotalPrice({required CartInfo cartData}) {
    double total = 0.0;
    final items = cartData.package ?? [];
    for (var item in items) {
      final price = item.price ?? 0;
      final cartId = item.cartId!;
      final qty = cartQuantities[cartId] ?? item.qty ?? 1;
      total += price * qty;
    }
    return total;
  }

  void setCurrentState() {
    if (state is CartPageLoaded) {
      final response = (state as CartPageLoaded).cartPageResponse;
      emit(CartPageLoaded(
          cartPageResponse: response,
          productQuantities: Map<int, int>.from(cartQuantities),
          totalAmount: calculateTotalPrice(cartData:response.cartResponse!)));
    }
  }

  void incrementQty({required int cartId}) {
    int current = cartQuantities[cartId] ?? 1;
    cartQuantities[cartId] = current + 1;
    setCurrentState();
  }

  void decrementQty({required int cartId}) {
    int current = cartQuantities[cartId] ?? 1;
    if (current > 1) {
      cartQuantities[cartId] = current - 1;
      setCurrentState();
    }
  }

  Future<void> quantityUpdate({required List<Map<String, String>> cartData}) async {
    Get.context?.loaderOverlay.show();
    final Either<Failure, CommonResponse> result = await cartQtyUpdateUsecase.call(cartData);
    result.fold((failure) {
      AppFunctionalComponents.showSnackBar(message: failure.messege);
    }, (response) {
      if (response.message == AppStrings.qtyUpdateSuccess) {
        AppFunctionalComponents.showSnackBar(message: AppStrings.qtyUpdateSuccess);
        final customerId = getIt<HomeCubit>().userData?.id;
        fetchCartPageDetail(customerId: customerId.toString());           
      } else {
        AppFunctionalComponents.showSnackBar(message: AppStrings.qtyUpdateFail);
      }
    });
    Get.context?.loaderOverlay.hide();
  }

  Future<void> removeItemFromCart({required String cartId}) async {
    Get.context?.loaderOverlay.show();
    final Either<Failure, CommonResponse> result = await removeItemCartUsecase.call(cartId);
    result.fold(
    (failure) {AppFunctionalComponents.showSnackBar(message: failure.messege);},
    (response) {
      final customerId = getIt<HomeCubit>().userData?.id;
      fetchCartPageDetail(customerId: customerId.toString());
      if (response.message == AppStrings.cartItemRemoveSuccess) {
        AppFunctionalComponents.showSnackBar(message: AppStrings.cartItemRemoveSuccess);
      } else {
        AppFunctionalComponents.showSnackBar(message: AppStrings.cartItemRemoveFail);
      }
    });
    Get.context?.loaderOverlay.hide();
  }

  Future<void> addToCart({required SubScribeCartParam subScribeCartParam}) async {
    Get.context?.loaderOverlay.show();
    final Either<Failure, CommonResponse> result = await subscriptionUsecase.call(subScribeCartParam);
    result.fold((failure) {
      AppFunctionalComponents.showSnackBar(message: failure.messege);
    }, (response) {
      if (response.message == AppStrings.cartUpdateSuccess) {
        AppFunctionalComponents.showSnackBar(message: AppStrings.cartUpdateSuccess);
      } else {
        AppFunctionalComponents.showSnackBar(message: AppStrings.cartUpdateFail);
      }
    });
    Get.context?.loaderOverlay.hide();
  }
}
