import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:milkride/core/common/app_divider.dart';
import 'package:milkride/core/common/app_text.dart';
import 'package:milkride/core/common/common_container.dart';
import 'package:milkride/core/common/loding_indicator.dart';
import 'package:milkride/core/common/network_fail_card.dart';
import 'package:milkride/core/common/quantity_button.dart';
import 'package:milkride/core/constant/app_strings.dart';
import 'package:milkride/core/utils/app_functional_components.dart';
import 'package:milkride/feature/product/domain/usecase/product_usecase.dart';
import 'package:milkride/feature/product/presentation/cubit/product_variants/product_variant_cubit.dart';
import 'package:milkride/feature/product/presentation/cubit/product_variants/product_variant_state.dart';
import 'package:milkride/feature/product/presentation/screen/option_sheet/widgets/delivery_button.dart';
import 'package:milkride/feature/product/presentation/screen/option_sheet/widgets/product_size_option_card.dart';

class ProductOptionSheet extends StatelessWidget {
  final ProdDetailParam prodDetailParam;
  const ProductOptionSheet({super.key, required this.prodDetailParam});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ProductVariantCubit>();
    cubit.fetchProductVariants(prodVarParam: prodDetailParam);
    return SizedBox(
      height: 0.45.sh,
      child: BlocBuilder<ProductVariantCubit, ProductVariantState>(
        builder: (context, state) {
          if (state is ProductVariantLoading) {
            return LodingIndicator();
          } else if (state is ProductVariantLoaded) {
            final product = state.selectedProduct;
            final packages = state.response.prodInfo ?? [];
            if (packages.isEmpty) {
              return Center(child: Text(AppStrings.packNotExist));
            }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppText(
                        data: product?.name ?? "", fontWeight: FontWeight.bold),
                    IconButton(
                        onPressed: () => Get.back(),
                        icon: const Icon(Icons.close)),
                  ],
                ).paddingSymmetric(horizontal: 10.w),
                SizedBox(
                  height: 80.h,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: packages.length,
                    itemBuilder: (context, index) {
                      return ProductSizeOptionCard(
                        prod: packages[index],
                        isSlected: product?.id == packages[index].id,
                        onTap: () => cubit.selectProduct(packages[index]),
                      );
                    },
                  ),
                ).paddingSymmetric(horizontal: 10.w),
                CommonContainer(
                  height: 200.h,
                  width: double.infinity,
                  borderRadius: BorderRadius.circular(10.r),
                  widget: Column(
                    children: [
                      Row(
                        children: [
                          AppText(
                              data: AppStrings.chooseDeliveryType,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600),
                          Spacer(),
                          SelectedButton(
                            data: AppStrings.morning,
                            isSlected: state.deliveryType == 0,
                            onPressed: () => cubit.changeDeliveryType(0),
                          ).paddingOnly(right: 5.w),
                          SelectedButton(
                            data: AppStrings.evening,
                            isSlected: state.deliveryType == 1,
                            onPressed: () => cubit.changeDeliveryType(1),
                          ),
                        ],
                      ).paddingSymmetric(horizontal: 10.w, vertical: 5.h),
                      AppDivider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppFunctionalComponents.darkText(
                                  data: AppStrings.itemTotal, fontSize: 14.sp),
                              AppFunctionalComponents.darkText(
                                  data:
                                      "₹${cubit.totalPrice.toStringAsFixed(2)}",
                                  fontSize: 14.sp)
                            ],
                          ),
                          QuantityButton(
                              quantity: "${state.quantity}",
                              onIncreaseQuant: () => cubit.incrementQty(),
                              onReduceQuant: () => cubit.decrementQty()),
                        ],
                      ).paddingSymmetric(horizontal: 10.w),
                      Spacer(),
                      Row(
                        children: [
                          Expanded(
                            child: SelectedButton(
                              fontSize: 14.h,
                              btnHeight: 40.h,
                              data: AppStrings.buyOnce,
                              isSlected: true,
                              onPressed: () { },
                            ),
                          ),
                          SizedBox(width: 10.w),
                          Expanded(
                            child: SelectedButton(
                              fontSize: 14.h,
                              btnHeight: 40.h,
                              data: AppStrings.subscribe,
                              isSlected: false,
                              onPressed: () {},
                            ),
                          ),
                        ],
                      ).paddingSymmetric(horizontal: 10.w, vertical: 10.h),
                    ],
                  ),
                ).paddingAll(10.sp),
              ],
            );
          } else if (state is ProductVariantError) {
            return Center(
                child: NetworkFailCard(
              messege: state.message,
            ));
          }
          return SizedBox();
        },
      ),
    );
  }
}
