import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:milkride/core/common/app_divider.dart';
import 'package:milkride/core/common/app_text.dart';
import 'package:milkride/core/common/common_container.dart';
import 'package:milkride/core/constant/app_strings.dart';
import 'package:milkride/core/utils/app_functional_components.dart';

class OrderCartSectionCard extends StatelessWidget {
  final String total;
  const OrderCartSectionCard({
    super.key,required this.total
  });

  

  @override
  Widget build(BuildContext context) {
    return CommonContainer(
        widget: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppText(
                  data: AppStrings.orderSubTotal,
                  fontWeight: FontWeight.w600,
                  fontSize: 14.sp,
                ),
                AppText(
                  data:"₹ $total",
                  fontWeight: FontWeight.w600,
                  fontSize: 12.sp,
                ),
              ],
            ).paddingOnly(bottom: 5.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppFunctionalComponents.lightText(
                    data: AppStrings.orderDeliveryCharges, fontSize: 12.sp),
                AppText(
                  data: "₹ 0",
                  fontWeight: FontWeight.w600,
                  fontSize: 12.sp,
                ),
              ],
            ).paddingOnly(bottom: 5.h),
            AppDivider(
              indent: 0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppText(
                  data: AppStrings.orderAmountTotal,
                  fontWeight: FontWeight.w600,
                  fontSize: 14.sp,
                ),
                AppText(
                  data: "₹ $total",
                  fontWeight: FontWeight.w600,
                  fontSize: 12.sp,
                ),
              ],
            ).paddingSymmetric(vertical: 5.h),
          ],
        ).paddingAll(10.sp),
        borderRadius: BorderRadius.circular(10.r),
        height: 120.h,
        width: 1.sw);
  }
}

