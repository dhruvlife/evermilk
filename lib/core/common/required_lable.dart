import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class RequiredLabel extends StatelessWidget {
  final String text;
  final bool isRequired;

  const RequiredLabel({
    super.key,
    required this.text,
    this.isRequired = false,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: text,
        style: TextStyle(
          fontSize: 12.sp,
          fontWeight: FontWeight.w500,
          color: Colors.black,
        ),
        children: isRequired
            ? [
                TextSpan(
                  text: " *",
                  style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                ),
              ]
            : [],
      ),
    ).paddingOnly(bottom: 5.h, left: 5.w);
  }
}
