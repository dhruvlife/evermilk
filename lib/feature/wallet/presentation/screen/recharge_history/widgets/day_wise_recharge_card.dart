import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:milkride/core/common/app_text.dart';
import 'package:milkride/feature/wallet/domain/entities/recharge.dart';
import 'package:milkride/feature/wallet/presentation/screen/wallet_page/widget/pay_list_tile.dart';

class DayWiseRechargeCard extends StatelessWidget {
  final Recharge recharge;
  const DayWiseRechargeCard({super.key, required this.recharge});
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
          padding:EdgeInsets.only(top: 10.h),
          itemCount: recharge.rechargeData?.length ?? 0,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            final data = recharge.rechargeData?[index];
            if (data == null) return SizedBox.shrink();
            return PaymentListTile(walletHistory: data);
          },
        )
      ],
    ).paddingSymmetric(vertical: 10.h);
  }
}