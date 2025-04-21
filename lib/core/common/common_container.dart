import 'package:flutter/material.dart';
import 'package:milkride/core/constant/app_colors.dart';

class CommonContainer extends StatelessWidget {
  final Widget widget;
  final double height;
  final double width;
  final BorderRadiusGeometry? borderRadius;
  final Color? color;
  final Color? borderColor;
  final double? borderWidth;
  const CommonContainer({
    super.key,
    required this.widget,
    required this.height,
    required this.width,
    this.color,
    this.borderColor,
    this.borderRadius,
    this.borderWidth
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,width: width,
      child: Container(
        height: height,width: width,
        decoration: BoxDecoration(
          color: color ?? AppColors.white,
          borderRadius: borderRadius,
          border: Border.all(color:borderColor??Colors.transparent,width:borderWidth??1)
        ),
        child: widget,
      ),
    );
  }
}
