import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:milkride/core/common/app_text.dart';
import 'package:milkride/core/common/common_container.dart';
import 'package:milkride/core/constant/app_colors.dart';

class QuantityButton extends StatelessWidget {
  final double? height;
  final double? width;
  final double? iconSize;
  final FontWeight?fontWeight;
  final String quantity;
  final VoidCallback onReduceQuant;
  final VoidCallback onIncreaseQuant;
  final BorderRadiusGeometry? borderRadius;

  const QuantityButton({
    super.key,
    required this.quantity,
    this.fontWeight,
    this.borderRadius,
    this.height,
    this.iconSize,
    this.width,
    required this.onIncreaseQuant,
    required this.onReduceQuant,
  });

  @override
  Widget build(BuildContext context) {
    return CommonContainer(
      borderRadius: borderRadius??BorderRadius.circular(20.r),
      borderColor: AppColors.optionButton,
        widget: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 30.h,width: 30.w,
              child: IconButton(
                icon: Icon(Icons.remove,size:iconSize??12.sp),
                onPressed: onReduceQuant,
              ),
            ),
            AppText(data:quantity,fontSize:iconSize??12.sp,fontWeight:fontWeight ?? FontWeight.w600,),
            SizedBox(
              height: 30.h,width: 30.w,
              child: IconButton(
                icon: Icon(Icons.add,size:iconSize??12.sp),
                onPressed: onIncreaseQuant,
              ),
            ),
          ],
        ),
        height: height ?? 30.h,
        width: width ?? 90.w);
  }
}
