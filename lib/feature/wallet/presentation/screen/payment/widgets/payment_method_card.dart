import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:milkride/core/common/app_text.dart';
import 'package:milkride/core/constant/app_colors.dart';

class PayMethodCard extends StatelessWidget {
  final IconData icon;
  final String text;
  final bool selected;
  const PayMethodCard({super.key,required this.icon, required this.text, required this.selected});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon,
            size: 30.sp,
            color: selected ? AppColors.white : AppColors.activeIconColor),
        AppText(
          data: text,
          color: selected ? AppColors.white : AppColors.activeIconColor,
          fontSize: 12.sp,
          fontWeight: FontWeight.w600,
        ),
      ],
    ).paddingOnly(left: 10.w);
  }
}
