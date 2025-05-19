import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:milkride/core/common/app_text.dart';
import 'package:milkride/core/common/common_container.dart';
import 'package:milkride/core/constant/app_colors.dart';

class PayAmountBox extends StatelessWidget {
  final VoidCallback onTap;
  final int amount;
  final bool isSelected;

  const PayAmountBox(
      {super.key,
      required this.onTap,
      required this.amount,
      required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CommonContainer(
        widget: Center(
            child: AppText(
                data: "₹ $amount",
                color: isSelected ? AppColors.whiteShade : AppColors.black,
                fontWeight: FontWeight.w500,
                fontSize: 12.sp)),
        height: 40.h,
        width: 80.w,
        color: isSelected ? AppColors.activeIconColor : AppColors.whiteShade,
        borderRadius: BorderRadius.circular(5.r),
      ),
    );
  }
}
