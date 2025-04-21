import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:milkride/core/constant/app_colors.dart';

class LodingIndicator extends StatelessWidget {
  final double? width;
  final double? boxWidth;
  final double? boxHeight;
  const LodingIndicator({super.key, this.width, this.boxWidth, this.boxHeight});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: boxHeight ?? 15.h,
        width: boxHeight ?? 15.h,
        child: CircularProgressIndicator(
          strokeWidth: width ?? 1.sp,
          color: AppColors.black,
        ),
      ),
    );
  }
}
