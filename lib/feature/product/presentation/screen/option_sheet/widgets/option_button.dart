
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:milkride/core/common/app_elevated_button.dart';
import 'package:milkride/core/common/app_text.dart';
import 'package:milkride/core/constant/app_colors.dart';
import 'package:milkride/core/constant/app_strings.dart';

class OptionButton extends StatelessWidget {
  final VoidCallback onPressed;
  const OptionButton({
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30.h,
      width: 80.w,
      child: CustomElevatedButton(onPressed: onPressed,backgroundColor: AppColors.otionButton, child:Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppText(data: AppStrings.option,fontSize: 8.sp,color: AppColors.white,fontWeight: FontWeight.w600,),
          Icon(Icons.arrow_drop_down,color: AppColors.white,size: 8.sp,)
        ],
      ))
    );
  }
}
