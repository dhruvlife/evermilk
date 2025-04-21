import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:milkride/core/common/app_text.dart';
import 'package:milkride/core/constant/app_colors.dart';
import 'package:milkride/core/constant/app_strings.dart';

class NoOrderFoundCard extends StatelessWidget {
  const NoOrderFoundCard({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 200.h,width: 0.8.sw,
        child: Column(
          children: [
            Icon(Icons.category,size: 50.sp,color: AppColors.inactiveIconColor).paddingOnly(bottom: 10.h),
            AppText(data: AppStrings.noOrderFound,fontSize: 10.sp,fontWeight: FontWeight.w600,color: AppColors.grey),
          ],
        ),
      ),
    );
  }
}
