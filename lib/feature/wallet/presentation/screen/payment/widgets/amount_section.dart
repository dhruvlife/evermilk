import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:milkride/core/common/app_text.dart';
import 'package:milkride/core/common/common_container.dart';
import 'package:milkride/core/constant/app_strings.dart';
import 'package:milkride/feature/wallet/presentation/cubit/payment/payment_cubit.dart';
import 'package:milkride/feature/wallet/presentation/screen/payment/widgets/pay_amount_box.dart';

class AmountSection extends StatelessWidget {
  const AmountSection({
    super.key,
    required this.cubit,
    required this.selectedAmount,
    required this.isSelectedPayOnline,
  });

  final PaymentCubit cubit;
  final int selectedAmount;
  final bool isSelectedPayOnline;

  @override
  Widget build(BuildContext context) {
    return CommonContainer(
      widget: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.r)),
              hintText: AppStrings.addAmount,
            ),
            controller: cubit.amountController,
            keyboardType: TextInputType.number,
            onChanged: cubit.updateAmountFromText,
          ),
          SizedBox(height: 10.h),
          SizedBox(
            height: 40.h,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children:
                  [100, 500, 1000, 1500, 2500, 5000].map((amount) {
                return Padding(
                  padding: EdgeInsets.only(right: 5.w),
                  child: PayAmountBox(
                    amount: amount,
                    isSelected: selectedAmount == amount,
                    onTap: () => cubit.selectAmount(amount),
                  ),
                );
              }).toList(),
            ),
          ),
          AppText(
            data: isSelectedPayOnline
                ? AppStrings.payOnlineRange
                : AppStrings.reqCashRange,
            fontSize: 10.sp,
          ).paddingSymmetric(vertical: 10.h),
        ],
      ).paddingSymmetric(horizontal: 10.w, vertical: 10.h),
      height: 180.h,
      width: 1.sw,
      borderRadius: BorderRadius.circular(10.r),
    );
  }
}
