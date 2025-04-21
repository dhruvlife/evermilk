
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:milkride/core/common/app_text.dart';
import 'package:milkride/core/common/common_container.dart';
import 'package:milkride/core/constant/app_colors.dart';

class ProfileDataCard extends StatelessWidget {
  final String data;
  final String title;
  const ProfileDataCard({
    super.key,
    required this.data,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return CommonContainer(
      widget: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
            data: title,
            fontSize: 10.sp,
            color: AppColors.lightGrey,
          ),
          AppText(
            data: data,
            fontSize: 10.sp,
            fontWeight: FontWeight.w600,
          ),
        ],
      ).paddingSymmetric(horizontal: 10.w, vertical: 5.h),
      height: 50.h,
      width: double.infinity,
      borderRadius: BorderRadius.circular(5.r),
    ).paddingOnly(bottom: 10.h);
  }
}
