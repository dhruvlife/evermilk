import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:milkride/core/common/app_text.dart';
import 'package:milkride/core/constant/app_colors.dart';

class GenderOption extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final bool isSelected;

  const GenderOption({
    super.key,
    required this.icon,
    required this.label,
    required this.onTap,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 40.h,
        width: 0.25.sw,
        decoration: BoxDecoration(
          color: isSelected ? AppColors.activeIconColor : AppColors.inactiveIconColor,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: isSelected ? AppColors.white : AppColors.black,
            ).paddingOnly(right: 4.w),
            AppText(
              data: label,
              color: isSelected ? AppColors.white :AppColors.black,
              fontWeight: FontWeight.w500,
            ),
          ],
        ),
      ),
    );
  }
}
