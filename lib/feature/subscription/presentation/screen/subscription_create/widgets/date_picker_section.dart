import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:milkride/core/common/app_text.dart';
import 'package:milkride/core/common/common_container.dart';
import 'package:milkride/core/constant/app_colors.dart';

class DatePickerWidget extends StatelessWidget {
  final String label;
  final DateTime? date;
  final Function() onTap;
  const DatePickerWidget({
    super.key,
    required this.label,
    required this.date,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: CommonContainer(
          borderRadius: BorderRadius.circular(5.r),
          widget: Center(
            child: AppText(
              fontSize: 12.sp,fontWeight: FontWeight.w400,
              data: date == null
                  ? label
                  : DateFormat('dd MMM yyyy').format(date!))),
          height: 40.h,
          width: 1.sw,
          color: AppColors.white
        ),
      ),
    );
  }
}