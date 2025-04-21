import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:milkride/core/common/app_text.dart';
import 'package:milkride/core/constant/app_colors.dart';

class RegisterAppBar extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  const RegisterAppBar({super.key,required this.title,required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.h,
      width: double.infinity,
      decoration: BoxDecoration(color: AppColors.themeIconColor,borderRadius:BorderRadius.vertical(bottom: Radius.circular(15.r))),
      child: Row(
        children: [
          Container(
            height: 40.h,
            width: 40.w,
            decoration: BoxDecoration(
                color: AppColors.themeBgColor,
                borderRadius: BorderRadius.circular(20.r)),
            child: Center(
              child: IconButton(
                onPressed: onPressed,
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: AppColors.themeIconColor,
                  size: 20.sp,
                ),
              ).paddingOnly(left: 5.w),
            ),
          ).paddingOnly(right: 15.w),
          AppText(data: title,color: AppColors.themeBgColor,fontSize: 16.sp,fontWeight: FontWeight.w600,),
        ],
      ).paddingSymmetric(horizontal: 20.w).paddingOnly(top: 40.h,bottom: 10.h),
    );
  }
}
