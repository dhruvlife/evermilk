import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:milkride/core/common/app_text.dart';
import 'package:milkride/core/common/common_container.dart';
import 'package:milkride/core/constant/app_strings.dart';

class DeliveryCartCard extends StatelessWidget {
  final String deliveryAddress;
  const DeliveryCartCard({super.key, required this.deliveryAddress});

  @override
  Widget build(BuildContext context) {
    return CommonContainer(
        widget: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppText(
                data: AppStrings.orderDeliveryAddress,
                fontSize: 12.sp,
                fontWeight: FontWeight.w600),
            AppText(data: deliveryAddress, fontSize: 12.sp)
          ],
        ).paddingAll(10.sp),
        height: 80.h,
        width: 1.sw,
        borderRadius: BorderRadius.circular(10.r)).paddingSymmetric(horizontal: 10.w).paddingOnly(bottom: 20.h);
  }
}
