import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:milkride/core/common/app_elevated_button.dart';
import 'package:milkride/core/constant/app_colors.dart';
import 'package:milkride/core/utils/app_functional_components.dart';

class SubscriptionActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final String title;
  final String description;
  final Widget widget;


  const SubscriptionActionButton({
    super.key,
    required this.icon,
    required this.label,
    required this.title,
    required this.description,
    required this.widget
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30.h,
      width: 95.w,
      child: CustomElevatedButton(
        backgroundColor: AppColors.whiteShade,
        onPressed: () {
          AppFunctionalComponents.showActionDialog(
            context: context,
            titleIcon: icon,
            title: title,
            subtitle: description,
            actions: widget
          );
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(icon, size: 10.sp),
            AppFunctionalComponents.darkText(data: label),
          ],
        ),
      ),
    );
  }
}
