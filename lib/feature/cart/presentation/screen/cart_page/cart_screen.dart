import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:milkride/core/common/app_text.dart';
import 'package:milkride/core/common/common_app_bar.dart';
import 'package:milkride/core/common/loding_indicator.dart';
import 'package:milkride/core/common/network_fail_card.dart';
import 'package:milkride/core/constant/app_strings.dart';
import 'package:milkride/core/routes/routes_name.dart';
import 'package:milkride/core/storage/storage_key.dart';
import 'package:milkride/core/storage/storage_object.dart';
import 'package:milkride/feature/cart/presentation/cubit/cart/cart_cubit.dart';
import 'package:milkride/feature/cart/presentation/cubit/cart/cart_state.dart';
import 'package:milkride/feature/cart/presentation/screen/cart_page/widgets/cart_product_card.dart';
import 'package:milkride/feature/cart/presentation/screen/cart_page/widgets/delete_product_dialog.dart';
import 'package:milkride/feature/cart/presentation/screen/cart_page/widgets/delivery_cart_card.dart';
import 'package:milkride/feature/cart/presentation/screen/cart_page/widgets/order_cart_section_card.dart';
import 'package:milkride/feature/cart/presentation/screen/cart_page/widgets/place_order_button.dart';
import 'package:milkride/feature/home/presentation/cubit/home_cubit.dart';
import 'package:milkride/feature/order/domain/usecase/order_place_usecase.dart';
import 'package:milkride/feature/order/presentation/cubit/order_cubit.dart';
import 'package:milkride/service.dart/injection.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});
  @override
  State<CartPage> createState() => _CartPageState();
}
class _CartPageState extends State<CartPage> {
  @override
  void initState() {
    fetchCartDate();
    super.initState();
  }
  void fetchCartDate() async {
    final customerId = getIt<HomeCubit>().userData?.id;
    getIt<CartPageCubit>().fetchCartPageDetail(customerId: customerId.toString());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        onIconPressed:() => Get.toNamed(RoutesName.home),
        title: AppStrings.cartPageTitle,
        iconPrefix: Icons.arrow_back_ios,
        showAction: false,
      ),
      body: BlocConsumer<CartPageCubit, CartPageState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is CartPageLoading) {
            return LodingIndicator();
          } else if (state is CartPageError) {
            return NetworkFailCard(messege: state.failure.messege);
          } else if (state is CartPageLoaded) {
            final cubit = context.read<CartPageCubit>();
            final cartInfo = state.cartPageResponse.cartResponse;
            final product = cartInfo?.package ?? [];
            final cartQuantitiesList = cubit.cartQuantities.entries
                .map((entry) => {"cart_id": entry.key.toString(),
                      "qty": entry.value.toString(),
                    }).toList();
            final isChange = cubit.isCartChanged();
            return Stack(
              alignment: AlignmentDirectional.bottomCenter,
              children: [
                SizedBox(
                  height: 1.sh,
                  child: ListView(
                    children: [
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: product.length,
                        itemBuilder: (context, index) {
                          final currentProduct = product[index];
                          return CartProductCard(
                            onTapDelete: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return DeleteProductDialog(cartId: currentProduct.cartId.toString());
                                },
                              );
                            },
                            quantity: state.productQuantities[currentProduct.cartId ?? 0] ??1,
                            cartInfo: cartInfo,
                            product: currentProduct,
                            onQuautIncrease: () {cubit.incrementQty(cartId: currentProduct.cartId ?? 0);},
                            onQuautreduce: () {cubit.decrementQty(cartId: currentProduct.cartId ?? 0);
                            },
                          );
                        },
                      ).paddingOnly(bottom: 10.h),
                      AppText(
                        data: AppStrings.orderSectionTitle,
                        fontWeight: FontWeight.w600).paddingOnly(left: 15.w),
                      OrderCartSectionCard(total: state.totalAmount.toString()).paddingSymmetric(horizontal: 10.w, vertical: 10.h),
                      DeliveryCartCard(deliveryAddress:cartInfo?.deliveryDetails?.deliveryAddress ?? "").paddingOnly(bottom: 100.h),
                    ],
                  ),
                ),
                PlaceOrderButton(
                  onPlaceOrder: isChange
                      ? () {
                          cubit.quantityUpdate(cartData:cartQuantitiesList);
                        }
                      : () {final customerId = getIt<HomeCubit>().userData?.id;
                          context.read<OrderCubit>().placeOrder(
                              orderPlaceParam: OrderPlaceParam(
                                  userId: StorageObject.readData(StorageKeys.userId),
                                  customerId: customerId??0));
                        },
                  totalAmount: "₹ ${state.totalAmount}",
                  isChange: isChange,
                ),
              ],
            );
          }
          return Container();
        },
      ),
    );
  }
}
