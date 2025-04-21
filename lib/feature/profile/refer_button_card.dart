import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:milkride/core/common/app_text.dart';
import 'package:milkride/core/common/common_container.dart';
import 'package:milkride/core/constant/app_colors.dart';
import 'package:milkride/core/constant/app_strings.dart';
import 'package:milkride/core/utils/app_functional_components.dart';

class ReferButtonCard extends StatelessWidget {
  final String? referCode;
  const ReferButtonCard({
    super.key,
    required this.referCode,
  });
  @override
  Widget build(BuildContext context) {
    return CommonContainer(
      height: 50.h,
      width: double.infinity,
      widget: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(
                  data: AppStrings.profilereferCode,
                  fontSize: 10.sp,
                  color: AppColors.lightGrey),
              AppText(
                  data: referCode ?? "",
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w600)
            ]),
        IconButton(
            style: ButtonStyle(
                backgroundColor:
                    WidgetStateProperty.all(AppColors.themeBgColor)),
            icon: Icon(Icons.copy, size: 18.sp, color: AppColors.white),
            onPressed: () {
              if (referCode?.isNotEmpty ?? false) {
                Clipboard.setData(
                  ClipboardData(
                    text: referCode ?? "",
                  ),
                );
                AppFunctionalComponents.showSnackBar(
                  message: AppStrings.profileClipBoard,
                  title: AppStrings.profileClipBoardTitle,
                );
              }
            })
      ]).paddingSymmetric(horizontal: 10.w),
    );
  }
}
