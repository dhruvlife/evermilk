import 'package:milkride/core/common/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:milkride/core/common/app_divider.dart';
import 'package:milkride/core/constant/app_colors.dart';
import 'package:milkride/core/constant/app_strings.dart';
import 'package:milkride/feature/wallet/domain/entities/wallet_history.dart';

class PaymentListTile extends StatelessWidget {
  final WalletHistory? walletHistory;
  const PaymentListTile({super.key, required this.walletHistory});
  @override
  Widget build(BuildContext context) {
    final isDebit = walletHistory?.amountType == AppStrings.debit;
    final sign = isDebit ? "-" : "+";
    return Container(
      color: AppColors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText(
                  data: walletHistory?.createdAt ?? "",
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w500),
              AppText(
                  data: "$sign ₹${walletHistory?.amount}",
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w500,
                  color:isDebit? AppColors.error:AppColors.success),
            ],
          ),
          AppText(
              data: walletHistory?.walletReason ?? "",
              fontSize: 10.sp,
              color: isDebit? AppColors.error:AppColors.success,
              fontWeight: FontWeight.w500),
          AppDivider(indent: 0).paddingOnly(bottom: 1.h)
        ],
      ).paddingSymmetric(horizontal: 15.w,vertical: 8.h),
    );
  }
}