import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:milkride/core/common/app_label.dart';
import 'package:milkride/core/common/app_network_image.dart';
import 'package:milkride/core/common/app_text.dart';
import 'package:milkride/core/common/common_container.dart';
import 'package:milkride/core/constant/app_colors.dart';
import 'package:milkride/core/constant/app_strings.dart';
import 'package:milkride/feature/order/domain/entities.dart/to_be_delivered.dart';

class OrderProductCard extends StatelessWidget {
  final Order product;
  final VoidCallback onDelete;
  const OrderProductCard({
    super.key,
    required this.product,
    required this.onDelete,
  });
  @override
  Widget build(BuildContext context) {
    return CommonContainer(
      borderRadius: BorderRadius.circular(10.r),
      height: 90.h,
      width: 1.sw,
      widget: Row(children: [
        AppNetWorkImage(
          image: product.imageUrl ?? "",
          height: 70.h,
          width: 70.w,
          fit: BoxFit.fitHeight,
        ).paddingOnly(right: 5.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                AppLabel(
                        height: 15.h,
                        labelSize: 8.sp,
                        borderRadius: BorderRadius.circular(15.r),
                        width: 60.w,
                        label: product.deliveryType.toString())
                    .paddingOnly(right: 5.w),
                product.subscriptionType == null
                    ? product.packageStatus == AppStrings.deliverd
                        ? AppLabel(
                            height: 15.h,
                            labelSize: 8.sp,
                            borderRadius: BorderRadius.circular(15.r),
                            width: 60.w,
                            label: AppStrings.deliverd)
                        : AppLabel(
                            height: 15.h,
                            labelSize: 8.sp,
                            borderRadius: BorderRadius.circular(15.r),
                            width: 60.w,
                            label: AppStrings.dayWise)
                    : AppLabel(
                        height: 15.h,
                        labelSize: 8.sp,
                        borderRadius: BorderRadius.circular(15.r),
                        width: 60.w,
                        label: AppStrings.subcription,
                      ),
              ],
            ),
            Row(
              children: [
                AppText(data: "${product.name} • ",
                  fontSize: 10.sp,
                  fontWeight: FontWeight.bold),
                AppText(data: "${product.packageSize} ${product.volume}",
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w500)]
            ).paddingOnly(left: 5.w),
            Row(children: [
              AppText(data: "₹ ${product.salePrice} × ", fontSize: 10.sp),
              AppText(data: product.qty.toString(), fontSize: 10.sp)
            ]).paddingOnly(left: 5.w)]),
        Spacer(),
        Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              IconButton(
                  onPressed: onDelete,
                  icon: Icon(Icons.delete, size: 16.sp, color: AppColors.error)),
              AppText(data: "₹ ${product.totalSalePrice}",
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w500)
                  .paddingOnly(right: 10.w)
            ])
      ]).paddingAll(5),
    ).paddingAll(5);
  }
}
