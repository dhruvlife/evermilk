import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:milkride/core/common/app_text.dart';
import 'package:milkride/core/common/common_container.dart';
import 'package:milkride/core/constant/app_colors.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback? onIconPressed;
  final VoidCallback? onActionPressed;
  final IconData? iconPrefix;
  final IconData? actionIcon;
  final bool showAction;
  final double? fontSize;
  final double? iconSize;
  final FontWeight? fontWeight;

  const CommonAppBar({
    super.key,
    required this.title,
    this.onIconPressed,
    this.onActionPressed,
    this.iconPrefix,
    this.actionIcon,
    this.fontSize,
    this.showAction = true,
    this.iconSize,
    this.fontWeight
  });

  @override
  Widget build(BuildContext context) {
    return CommonContainer(
      color: AppColors.white,
      borderRadius: BorderRadius.vertical(bottom: Radius.circular(12.r)),
      height: preferredSize.height,
      width: 1.sw,
      widget: SafeArea(
        child: Row(
          children: [
            IconButton(
              onPressed: onIconPressed ?? () => Get.back(),
              icon: Icon(
                iconPrefix ?? Icons.menu,
                color: AppColors.black,
                size: iconSize,
              ),
            ),
            Expanded(
              child: Center(
                child: AppText(
                  data: title,
                  fontSize: fontSize ?? 14.sp,
                  fontWeight:fontWeight ?? FontWeight.w700,
                  color: AppColors.black,
                ),
              ),
            ),
            showAction
                ? IconButton(
                    onPressed: onActionPressed ?? () {},
                    icon: Icon(
                      size: iconSize,
                      actionIcon ?? Icons.wallet_outlined,
                      color: AppColors.black,
                    ),
                  ).paddingOnly(right: 10.w)
                : SizedBox(width: 48.w),
          ],
        ).paddingAll(1.sp),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(80.h);
}

