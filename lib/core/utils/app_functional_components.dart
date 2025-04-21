import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:milkride/core/common/app_text.dart';
import 'package:milkride/core/constant/app_colors.dart';

class AppFunctionalComponents {
  static void showSnackBar({
    required String message,
    String title = 'Alert',
    Color backgroundColor = Colors.black,
    Color textColor = Colors.white,
    SnackPosition position = SnackPosition.BOTTOM,
    Duration duration = const Duration(seconds: 2),
  }) {
    Get.closeAllSnackbars();

    Get.snackbar(title, message,
        backgroundColor: backgroundColor,
        colorText: textColor,
        snackPosition: position,
        duration: duration,
        margin: EdgeInsets.all(5.sp),
        borderRadius: 12.r);
  }

  static AppText darkText({required String data, double? fontSize}) {
    return AppText(
      data: data,
      fontSize: fontSize ?? 10.sp,
      fontWeight: FontWeight.w600,
      color: AppColors.darkGrey,
    );
  }

  static AppText lightText({required String data, double? fontSize}) {
    return AppText(
      data: data,
      fontSize: fontSize ?? 8.sp,
      fontWeight: FontWeight.w600,
      color: AppColors.lightGrey,
    );
  }

  static Future<T?> showSheet<T>({
    required WidgetBuilder builder,
    bool isScrollControlled = true,
    bool isDismissible = true,
    bool enableDrag = true,
  }) {
    final context = Get.context;
    if (context == null) {
      return Future.value(null);
    }
    return showModalBottomSheet<T>(
      context: context,
      isScrollControlled: isScrollControlled,
      isDismissible: isDismissible,
      enableDrag: enableDrag,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(10.r)),
      ),
      builder: builder,
    );
  }
}
