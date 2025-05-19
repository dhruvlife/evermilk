import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:milkride/core/common/app_text.dart';
import 'package:milkride/core/constant/app_colors.dart';
import 'package:milkride/core/constant/app_strings.dart';

class PayButtonDesign extends StatelessWidget {
  const PayButtonDesign({
    super.key,
    required this.selectedAmount,
    required this.isSelectedPayOnline,
  });

  final int selectedAmount;
  final bool isSelectedPayOnline;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppText(
              data: AppStrings.orderAmountTotal,
              fontSize: 12.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.white,
            ),
            AppText(
              data: "₹$selectedAmount",
              fontSize: 12.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.white,
            ),
          ],
        ),
        AppText(
          data: isSelectedPayOnline? AppStrings.proceedToPay:AppStrings.reqCash,
          color: AppColors.white,
          fontSize: 12.sp,
          fontWeight: FontWeight.w600,
        )
      ],
    );
  }
}
