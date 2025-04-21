import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:milkride/core/common/app_label.dart';
import 'package:milkride/core/common/app_network_image.dart';
import 'package:milkride/core/common/common_container.dart';
import 'package:milkride/core/common/mrp_text.dart';
import 'package:milkride/core/common/quantity_button.dart';
import 'package:milkride/core/constant/app_strings.dart';
import 'package:milkride/core/utils/app_functional_components.dart';
import 'package:milkride/feature/cart/domain/entities/cart_info.dart';
import 'package:milkride/feature/product/domain/entities/product.dart';

class SubcriptionProdCard extends StatelessWidget {
  final Product product;
  final CartInfo? cartInfo;
  final VoidCallback onTapDelete;
  final VoidCallback onQuautIncrease;
  final VoidCallback onQuautreduce;
  int quantity;
  SubcriptionProdCard(
      {super.key,
      required this.product,
      required this.onQuautIncrease,
      required this.onQuautreduce,
      this.cartInfo,
      required this.onTapDelete,
      required this.quantity});

  @override
  Widget build(BuildContext context) {
    return CommonContainer(
            widget: Row(
              children: [
                AppNetWorkImage(
                  fit: BoxFit.cover,
                  radius: BorderRadius.circular(10.r),
                  image: product.imageUrl ?? "",
                  height: 70.h,
                  width: 70.w,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        AppLabel(
                                height: 15.h,
                                width: 50.w,
                                label: product.deliveryType ?? "",
                                borderRadius: BorderRadius.circular(15.r),
                                labelSize: 8.sp)
                            .paddingOnly(right: 5.w),
                        AppLabel(
                            height: 15.h,
                            width: 100.w,
                            label: "${AppStrings.deliverOn} ${product.deliveryDate}",
                            borderRadius: BorderRadius.circular(15.r),
                            labelSize: 8.sp),
                      ],
                    ),
                    AppFunctionalComponents.darkText(
                        data: product.name ?? "", fontSize: 10.sp),
                    AppFunctionalComponents.lightText(
                        data:
                            "${product.packageSize} ${product.volume}",
                        fontSize: 10.sp),
                    MrpText(sellPrice: "₹ ${product.salePrice}",mrpPrice:"₹ ${product.mrpPrice}", height:20.h, width:110.w)
                  ],
                ).paddingSymmetric(vertical: 5.h, horizontal: 5.w),
                Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    QuantityButton(
                      quantity: quantity.toString(),
                      onIncreaseQuant: onQuautIncrease,
                      onReduceQuant: onQuautreduce,
                    ).paddingOnly(bottom: 10.h)
                  ],
                )
              ],
            ).paddingSymmetric(horizontal: 5.w),
            height: 80.h,
            width: 0.9.sw)
        .paddingSymmetric(horizontal: 10.w, vertical: 3.h);
  }
}
