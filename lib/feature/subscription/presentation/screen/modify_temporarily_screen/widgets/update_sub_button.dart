import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:milkride/core/common/app_elevated_button.dart';
import 'package:milkride/core/common/app_text.dart';
import 'package:milkride/core/constant/app_colors.dart';
import 'package:milkride/core/constant/app_strings.dart';

class UpdateSubButton extends StatelessWidget {
  final void Function() onPressed;
  const UpdateSubButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return CustomElevatedButton(
      backgroundColor: AppColors.optionButton,
      onPressed: onPressed,
      child: AppText(
        data: AppStrings.updateSub,
        color: AppColors.white,
        fontSize: 12.sp,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
