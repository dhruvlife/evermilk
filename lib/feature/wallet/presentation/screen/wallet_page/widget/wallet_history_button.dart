import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:milkride/core/common/app_elevated_button.dart';
import 'package:milkride/core/common/app_text.dart';
import 'package:milkride/core/constant/app_colors.dart';



class WalletHistoryButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final void Function() onPressed;
  const WalletHistoryButton(
      {super.key,
      required this.icon,
      required this.label,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80.h,
      child: CustomElevatedButton(
        width: 0.42.sw,
        onPressed: onPressed,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(icon, color: AppColors.white, size: 30.sp),
            AppText(
              data: label,
              color: AppColors.white,
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
            ),
          ],
        ),
      ),
    );
  }
}