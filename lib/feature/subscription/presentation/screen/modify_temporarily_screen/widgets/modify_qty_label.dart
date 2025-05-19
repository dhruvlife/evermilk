import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:milkride/core/common/app_text.dart';
import 'package:milkride/core/common/common_container.dart';
import 'package:milkride/core/constant/app_colors.dart';
import 'package:milkride/core/constant/app_strings.dart';
import 'package:milkride/core/utils/app_functional_components.dart';

class ModifyQtyLabel extends StatelessWidget {
  final bool isSingleDay;
  final int qty;
  final String fromDate;
  final String toDate;

  const ModifyQtyLabel({
    super.key,
    required this.isSingleDay,
    required this.fromDate,
    required this.qty,
    required this.toDate,
  });

  @override
  Widget build(BuildContext context) {
    final formattedFromDate = fromDate.isEmpty ? AppFunctionalComponents.formatDate(date:'') : AppFunctionalComponents.formatDate(date:fromDate);
    final formattedToDate = toDate.isEmpty ? AppFunctionalComponents.formatDate(date:'') : AppFunctionalComponents.formatDate(date:toDate);
    return CommonContainer(
      width: 1.sw,
      height: 30.h,
      color: AppColors.btnShade,
      borderRadius: BorderRadius.circular(5.r),
      widget: AppText(
        data: isSingleDay
            ? "${AppStrings.qtyChangeTo} $qty on $formattedFromDate"
            : "${AppStrings.qtyChangeTo} $qty from $formattedFromDate to $formattedToDate",
        color: AppColors.optionButton,
        fontSize: 10.sp,
        fontWeight: FontWeight.w500,
      ).paddingAll(5),
    );
  }
}
