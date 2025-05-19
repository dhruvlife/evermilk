import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:milkride/core/common/app_divider.dart';
import 'package:milkride/core/common/app_text.dart';
import 'package:milkride/core/constant/app_colors.dart';
import 'package:milkride/core/constant/app_strings.dart';
import 'package:milkride/feature/wallet/domain/entities/recharge.dart';

class DayWiseBillCard extends StatelessWidget {
  final Recharge recharge;
  const DayWiseBillCard({super.key, required this.recharge});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(
          data: recharge.date ?? "",
          fontWeight: FontWeight.w700,
          fontSize: 12.sp,
        ).paddingOnly(left: 15.w),
        ListView.builder(
          padding: EdgeInsets.only(top: 10.h),
          itemCount: recharge.rechargeData?.length ?? 0,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            final data = recharge.rechargeData?[index];
            if (data == null) return SizedBox.shrink();
            final isDebit = data.paymentType == AppStrings.debit;
            final sign = isDebit ? "-" : "+";
            return Container(
              color: AppColors.white,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 130.w,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppText(
                                data: data.date ?? "",
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w500),
                            AppText(
                                data: data.reason ?? "",
                                fontSize: 10.sp,
                                color:isDebit?AppColors.error: AppColors.success,
                                fontWeight: FontWeight.w500)],
                        ),
                      ), 
                      SizedBox(
                        width: 70.w,
                        child: Column(
                          children: [
                            AppText(
                                data: AppStrings.debitText,
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w500),
                            AppText(
                                data: "$sign ₹${data.amount}",
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w500,
                                color:isDebit?AppColors.error: AppColors.success)],
                        ),
                      ),
                      SizedBox(
                        width: 70.w,
                        child: Column(
                          children: [
                            AppText(
                                data: AppStrings.balance,
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w500),
                            AppText(
                                data: "$sign ₹${data.balance}",
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w500,
                                color:isDebit?AppColors.error: AppColors.success)],
                        ),
                      ), 
                    ],
                  ).paddingSymmetric(horizontal: 15.w, vertical: 8.h),
                  AppDivider(indent: 0)
                ],
              ),
            );
          },
        )
      ],
    ).paddingSymmetric(vertical: 10.h);
  }
}