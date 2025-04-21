import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:milkride/core/constant/app_colors.dart';
import 'package:pinput/pinput.dart';

class OtpPut extends StatelessWidget {
  final TextEditingController otpController;
  const OtpPut({super.key, required this.otpController});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Pinput(
        controller: otpController,
        length: 4,
        keyboardType: TextInputType.number,
        defaultPinTheme: PinTheme(
          height: 50.h,
          width: 50.w,
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.borderColor),
            borderRadius: BorderRadius.circular(5.r),
          ),
        ),
        focusedPinTheme: PinTheme(
          height: 50.h,
          width: 50.w,
          textStyle: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
          ),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.activeIconColor),
            borderRadius: BorderRadius.circular(10.r),
          ),
        ),
      ),
    );
  }
}
