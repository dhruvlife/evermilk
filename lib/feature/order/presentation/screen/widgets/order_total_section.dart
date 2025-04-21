import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:milkride/core/common/app_divider.dart';
import 'package:milkride/core/common/app_text.dart';
import 'package:milkride/core/common/common_container.dart';
import 'package:milkride/core/constant/app_colors.dart';
import 'package:milkride/core/constant/app_strings.dart';

class OrderDetailSection extends StatelessWidget {
  final String total;
  const OrderDetailSection({
    super.key,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    return CommonContainer(
      borderRadius: BorderRadius.circular(10.r),
      widget: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText(
                data: AppStrings.orderSubTotal,
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
              ),
              AppText(
                data:"₹ $total",
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText(
                data: AppStrings.orderDeliveryCharges,
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.grey,
              ),
              AppText(
                data: "₹ 0",
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
              ),
            ],
          ),
          AppDivider(indent: 0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText(
                data: AppStrings.orderAmountTotal,
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.grey,
              ),
              AppText(
                data:"₹ $total",
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
              ),
            ],
          ),
        ],
      ).paddingSymmetric(horizontal: 10.w, vertical: 5.h),
      height: 100.h,
      width: 1.sw,
    );
  }
}