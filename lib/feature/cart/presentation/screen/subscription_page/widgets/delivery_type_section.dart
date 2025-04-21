import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:milkride/core/common/common_container.dart';
import 'package:milkride/core/constant/app_strings.dart';
import 'package:milkride/feature/product/presentation/screen/option_sheet/widgets/delivery_button.dart';

class DeliveryTypeWidget extends StatelessWidget {
  final bool isMorning;
  final Function() toggleIsMorning;
  const DeliveryTypeWidget({
    super.key,
    required this.isMorning,
    required this.toggleIsMorning,
  });
  @override
  Widget build(BuildContext context) {
    return CommonContainer(
      widget: Row(
        children: [
          SelectedButton(
            onPressed: () {
              if (!isMorning) toggleIsMorning();
            },
            data: AppStrings.morning,
            isSlected: isMorning,
          ).paddingSymmetric(horizontal: 10.w),
          SelectedButton(
            onPressed: () {
              if (isMorning) toggleIsMorning();
            },
            data: AppStrings.evening,
            isSlected: !isMorning,
          ),
        ],
      ),
      height: 60.h,
      width: 1.sw,
    );
  }
}