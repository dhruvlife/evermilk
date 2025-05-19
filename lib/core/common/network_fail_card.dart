import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:milkride/core/common/app_elevated_button.dart';
import 'package:milkride/core/common/app_image.dart';
import 'package:milkride/core/common/app_text.dart';
import 'package:milkride/core/constant/app_colors.dart';
import 'package:milkride/core/key/app_images.dart';

class NetworkFailCard extends StatelessWidget {
  final String messege;
  final String? buttonText;
  final bool isButtonRequired;
  final void Function()? onButtontap;
  const NetworkFailCard(
      {super.key,
      required this.messege,
      required this.isButtonRequired,
      this.onButtontap,
      this.buttonText});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        AppImage(image: AppImages.networkFail, height: 150.h, width: 150.w),
        AppText(data: messege, fontSize: 12.sp, fontWeight: FontWeight.w500)
            .paddingOnly(bottom: 10.h),
        isButtonRequired
            ? SizedBox(
                height: 40.h,
                width: 100.w,
                child: CustomElevatedButton(
                    onPressed: onButtontap ?? () {},
                    child: AppText(
                        data: buttonText ?? "",
                        color: AppColors.white,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500)),
              )
            : SizedBox.shrink()
      ]),
    );
  }
}
