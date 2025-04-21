import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:milkride/core/common/app_text.dart';
import 'package:milkride/core/constant/app_colors.dart';

class AppLabel extends StatelessWidget {
  final VoidCallback? onTap;
  final List<Color>? colors;
  final Color? labelColor;
  final double height;
  final double width;
  final String label;
  final BorderRadius? borderRadius;
  final double? labelSize;
  final FontWeight? labelFontWeight;
  final double? labelPadding;

  const AppLabel(
      {super.key,
      this.onTap,
      this.colors,
      this.labelColor,
      required this.height,
      required this.width,
      this.borderRadius,
      this.labelPadding,
      required this.label,
      this.labelFontWeight,
      this.labelSize});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ?? () {},
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors:colors ?? [AppColors.labelF,AppColors.labelM,AppColors.labelE] ),
          borderRadius: borderRadius,
        ),
        child: Center(
          child: AppText(
            data: label,
            color:labelColor ?? AppColors.white,
            fontSize: labelSize ?? 12.sp,
            fontWeight: labelFontWeight ?? FontWeight.w600,
          ),
        ).paddingAll(labelPadding??2.sp),
      ),
    );
  }
}
