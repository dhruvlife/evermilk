import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppDivider extends StatelessWidget {
  final double? indent;
  const AppDivider({super.key,this.indent});

  @override
  Widget build(BuildContext context) {
    return Divider(
      indent: indent??0.03.sw,endIndent: indent??0.03.sw,
    );
  }
}