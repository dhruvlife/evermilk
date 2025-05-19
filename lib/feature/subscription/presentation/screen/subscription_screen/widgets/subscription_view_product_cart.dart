import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:milkride/core/common/app_divider.dart';
import 'package:milkride/core/common/app_label.dart';
import 'package:milkride/core/common/app_network_image.dart';
import 'package:milkride/core/common/app_text.dart';
import 'package:milkride/core/common/common_container.dart';
import 'package:milkride/core/constant/app_colors.dart';
import 'package:milkride/core/constant/app_strings.dart';
import 'package:milkride/core/utils/app_functional_components.dart';
import 'package:milkride/feature/subscription/domain/entity/sub_detail.dart';
import 'package:milkride/feature/subscription/presentation/screen/subscription_screen/widgets/subscription_action_button_section.dart';

class SubscriptionViewProductCard extends StatelessWidget {
  final SubScriptionDetail prod;
  const SubscriptionViewProductCard({
    required this.prod,
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    final isResume = prod.isPauseSubscription ?? false;
    String freqType;
    switch (prod.frequencyType) {
      case AppStrings.dayWise:
        freqType = AppStrings.dayWiseCap;
        break;
      case AppStrings.alternateDay:
        freqType = AppStrings.alternateDayCap;
        break;
      case AppStrings.every3Day:
        freqType = AppStrings.every3DayCap;
        break;
      case AppStrings.everyDay:
        freqType = AppStrings.everyDayCap;
        break;
      default:
        freqType = prod.frequencyType ?? '';
    }

    return CommonContainer(
            widget: Column(
              children: [
                CommonContainer(
                    widget: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppText(
                          data: "$freqType • ${prod.deliveryType}",
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w500,
                        ),
                        AppText(
                          data: isResume ? AppStrings.pauseSub : AppStrings.active,
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w500,
                        )
                      ],
                    ).paddingSymmetric(horizontal: 10.w),
                    color: isResume ?AppColors.warningShade: AppColors.optionButtonShade,
                    height: 35.h,
                    width: 1.sw,
                    borderRadius:BorderRadius.vertical(top: Radius.circular(10.r))),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    AppNetWorkImage(
                      image: prod.imageUrl ?? "",
                      height: 80.h,
                      width: 80.w,
                    ).paddingSymmetric(horizontal: 5.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppFunctionalComponents.darkText(data: "${prod.productName}"),
                        AppFunctionalComponents.lightText(data: "(${prod.packageSize} ${prod.volume})"),
                        AppFunctionalComponents.lightText(data: "₹ ${prod.salePrice} x ${prod.qty}"),
                      ],
                    ).paddingOnly(bottom: 10.h),
                    Spacer(),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        AppFunctionalComponents.darkText(data: "₹ ${prod.totalSalePrice}")
                      ],
                    ).paddingOnly(right: 10.w, bottom: 10.h)
                  ],
                ),
                AppDivider(indent: 0),
                SubscriptionActionButtonSection(prod: prod).paddingOnly(bottom: 10.h),
                 isResume
                    ? AppLabel(
                      borderRadius: BorderRadius.circular(8.r),
                        label: "${AppStrings.subPauseFrom} ${prod.pauseSubscription?.pauseStartDate} to ${prod.pauseSubscription?.pauseEndDate}",
                        height: 25.h,
                        width: 1.sw,
                        labelFontWeight: FontWeight.bold,
                        labelSize: 8.sp).paddingSymmetric(horizontal: 5.w): SizedBox.shrink()
              ],
            ),
            height:isResume? 210.h : 180.h,
            width: 1.sw,
            borderRadius: BorderRadius.circular(10.r)).paddingOnly(bottom: 10.h);
  }
}
