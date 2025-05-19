import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:milkride/core/common/app_elevated_button.dart';
import 'package:milkride/core/common/app_text.dart';
import 'package:milkride/core/constant/app_colors.dart';

class CommonEmptyCard extends StatelessWidget {
  final IconData icon;
  final String messege;
  final String? buttonText;
  final VoidCallback? onTap;
  const CommonEmptyCard({
    super.key,
    required this.messege,
    required this.icon,
    this.onTap,
    this.buttonText,
  });
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 200.h,
        width: 0.8.sw,
        child: Column(
          children: [
            Icon(icon, size: 60.sp, color: AppColors.activeIconColor)
                .paddingOnly(bottom: 10.h),
            AppText(
                data: messege,
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.grey).paddingOnly(bottom:10.h),
            buttonText == null
                ?SizedBox.shrink() :
                 CustomElevatedButton(
                    width: 0.7.sw,
                    onPressed: onTap ?? () {},
                    child: AppText(
                        data: buttonText ?? "",
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,color: AppColors.white))
          ],
        ),
      ),
    );
  }
}
