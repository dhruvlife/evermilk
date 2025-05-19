import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:milkride/core/common/app_elevated_button.dart';
import 'package:milkride/core/common/app_text.dart';
import 'package:milkride/core/common/common_container.dart';
import 'package:milkride/core/constant/app_colors.dart';
import 'package:milkride/core/constant/app_strings.dart';
import 'package:milkride/core/utils/app_functional_components.dart';
import 'package:milkride/feature/wallet/domain/entities/customer_wallet_data.dart';
import 'package:milkride/feature/wallet/presentation/screen/payment/payment_page.dart';


class WalletPageTopSection extends StatelessWidget {
  final CustomerWalletData? customerWalletData;
  const WalletPageTopSection({super.key, required this.customerWalletData});
  @override
  Widget build(BuildContext context) {
    return CommonContainer(
      widget: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CommonContainer(
              widget: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                      data: AppStrings.walletBalance,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500),
                  AppText(
                      data: "₹ ${customerWalletData?.wallet}",
                      fontWeight: FontWeight.w500,
                      fontSize: 14.sp)
                ],
              ).paddingOnly(left: 10.w),
              color: AppColors.whiteShade,
              borderRadius: BorderRadius.circular(10.r),
              height: 100.h,
              width: 0.42.sw,
            ),
            CommonContainer(
              widget: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                      data: AppStrings.reserveBalance,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500),
                  AppText(
                      data: "₹ ${customerWalletData?.creditLimit}",
                      fontWeight: FontWeight.w500,
                      fontSize: 14.sp)
                ],
              ).paddingOnly(left: 10.w),
              color: AppColors.whiteShade,
              borderRadius: BorderRadius.circular(10.r),
              height: 100.h,
              width: 0.42.sw,
            ),
          ],
        ).paddingSymmetric(horizontal: 10.w, vertical: 10.h),
        CustomElevatedButton(
                onPressed: () {
                  AppFunctionalComponents.showSheet(builder: (context) => PaymentPage());
                },
                child: AppText(
                    data: AppStrings.addAmount,
                    color: AppColors.white,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600))
            .paddingSymmetric(horizontal: 10.w, vertical: 5.h)
      ]),
      color: AppColors.white,
      borderRadius: BorderRadius.circular(10.r),
      height: 190.h,
      width: 1.sw,
    );
  }
}
