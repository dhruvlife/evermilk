
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:milkride/core/common/app_text.dart';
import 'package:milkride/core/constant/app_colors.dart';

class SelectedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String data;
  final bool isSlected;
  final double? fontSize;
  final double? btnHeight;
  final double? btnWidth;
  final FontWeight? fontWeight;
  const SelectedButton(
      {super.key,
      required this.onPressed,
      required this.data,
      this.fontSize,
      this.btnHeight,
      this.btnWidth,
      this.fontWeight,
      required this.isSlected});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: btnHeight??30.h,
      width: btnWidth??80.w,
      child: OutlinedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          shape: WidgetStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.r))),
            backgroundColor: isSlected
                ? WidgetStateProperty.all(AppColors.otionButton)
                : WidgetStateProperty.all(AppColors.white)),
        child: AppText(
          data: data,
          fontSize: fontSize??8.sp,
          fontWeight:  fontWeight??FontWeight.w400,
          color: isSlected ? AppColors.white : AppColors.black,
        ),
      ),
    );
  }
}
