import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:milkride/core/common/app_text.dart';
import 'package:milkride/core/constant/app_colors.dart';

class ScheduleOptionWidget extends StatelessWidget {
  final String label;
  final bool isSelectedSchedule;
  final Function() onTap;
  const ScheduleOptionWidget({
    super.key,
    required this.label,
     this.isSelectedSchedule = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 30.h,
        padding: EdgeInsets.symmetric(vertical: 10.h),
        width: 1.sw / 5,
        decoration: BoxDecoration(
          color: isSelectedSchedule ? AppColors.optionButton : AppColors.whiteShade,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Center(child: AppText(data: label, fontSize: 8.sp,fontWeight: FontWeight.w700,color:isSelectedSchedule? AppColors.white : AppColors.black)),
      ).paddingAll(2),
    );
  }
}