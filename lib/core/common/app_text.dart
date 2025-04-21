import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppText extends StatelessWidget {
  final String data;
  final Color color;
  final FontWeight fontWeight;
  final double fontSize;
  final TextAlign textAlign;
  final int? maxLines;
  final TextOverflow? overflow;
  final TextDecoration? decoration;

  const AppText({
    super.key,
    required this.data,
    this.color = Colors.black,
    this.fontWeight = FontWeight.w400,
    this.fontSize = 16,
    this.textAlign = TextAlign.start,
    this.maxLines,
    this.overflow,
    this.decoration,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      style: TextStyle(
        overflow: overflow??TextOverflow.visible,
        color: color,
        fontSize: fontSize.sp,
        fontWeight: fontWeight,
        decoration:decoration?? TextDecoration.none
      ),
    );
  }
}
