import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:milkride/core/common/app_elevated_button.dart';
import 'package:milkride/core/common/app_text.dart';
import 'package:milkride/core/constant/app_colors.dart';
import 'package:milkride/core/constant/app_strings.dart';

class OrderSuccessScreen extends StatelessWidget {
  const OrderSuccessScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Spacer(),
          Center(
            child: Icon(
              Icons.check_circle,
              color: AppColors.optionButton,
              size: 50.sp,
            ),
          ),
          AppText(data: AppStrings.thankYou).paddingOnly(bottom: 50.h),
          CustomElevatedButton(
            onPressed: (){
              Get.back();
              Get.back();
              Get.back();
            } ,
            child: AppText(data:AppStrings.continueShopping),
          ).paddingSymmetric(horizontal: 15.w),
          Spacer(),
        ],
      ),
    );
  }
}
