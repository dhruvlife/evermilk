import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:milkride/core/common/app_elevated_button.dart';
import 'package:milkride/core/common/app_text.dart';
import 'package:milkride/core/common/common_container.dart';
import 'package:milkride/core/constant/app_colors.dart';
import 'package:milkride/core/constant/app_strings.dart';

class PlaceOrderButton extends StatelessWidget {
  final VoidCallback onPlaceOrder;
  final String totalAmount;
  bool isChange;
  PlaceOrderButton({
    required this.isChange,
    super.key,required this.onPlaceOrder,required this.totalAmount
  });
  @override
  Widget build(BuildContext context) {
    return CommonContainer(
      
      height: 70.h,
      width: 1.sw,
      widget: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
              AppText(
                  data: AppStrings.orderPayableAmount,
                  fontWeight: FontWeight.w600,
                  fontSize: 12.sp),
              AppText(
                  data: totalAmount,
                  fontWeight: FontWeight.w600,
                  fontSize: 12.sp),
            ],
          ),
          SizedBox(
            height: 40.h,
            width: 140.w,
            child: CustomElevatedButton(
              backgroundColor: isChange?Colors.orange:AppColors.activeIconColor,
                onPressed: onPlaceOrder,
                child: AppText(
                  data:isChange?AppStrings.orderUpdate: AppStrings.orderPlaceOrder,
                  fontSize: 12.sp,
                  color: AppColors.white,
                  fontWeight: FontWeight.w600,
                )),
          ),
        ],
      ).paddingSymmetric(horizontal: 10.w,vertical: 10.h),
    );
  }
}
