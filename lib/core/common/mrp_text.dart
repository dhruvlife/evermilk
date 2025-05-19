import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:milkride/core/common/app_text.dart';

class MrpText extends StatelessWidget {
  final String sellPrice;
  final String? mrpPrice;
  final double height;
  final double width;
  final FontWeight? mrpFontWeight;
  final FontWeight? sellFontWeight;
  final double? mrpFontSize;
  final double? sellFontSize;
  final double? paddig;
  final bool? isCenter;
  const MrpText(
      {super.key,
      required this.sellPrice,
      this.mrpPrice,
      this.paddig,
      required this.height,
      this.mrpFontSize,
      this.mrpFontWeight,
      this.sellFontSize,
      this.sellFontWeight,
      this.isCenter,
      required this.width});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment:isCenter==true ?  MainAxisAlignment.center:MainAxisAlignment.start,
        children: [
          AppText(
            fontWeight: sellFontWeight ?? FontWeight.w700,
            data: sellPrice,
            fontSize: sellFontSize ?? 10.sp,
          ).paddingOnly(right: paddig ?? 4.w),
          mrpPrice != null
              ? AppText(
                  fontWeight: mrpFontWeight ?? FontWeight.w400,
                  fontSize: mrpFontSize ?? 10.sp,
                  data: mrpPrice ?? "",
                  decoration:TextDecoration.combine([TextDecoration.lineThrough,]),
                )
              : Container()
        ],
      ),
    );
  }
}
