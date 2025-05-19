import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:milkride/core/common/app_elevated_button.dart';
import 'package:milkride/core/common/app_text.dart';
import 'package:milkride/core/common/app_textfield.dart';
import 'package:milkride/core/common/common_container.dart';
import 'package:milkride/core/common/network_fail_card.dart';
import 'package:milkride/core/constant/app_colors.dart';
import 'package:milkride/core/constant/app_strings.dart';
import 'package:milkride/feature/wallet/presentation/cubit/payment/payment_cubit.dart';
import 'package:milkride/feature/wallet/presentation/screen/payment/widgets/amount_section.dart';
import 'package:milkride/feature/wallet/presentation/screen/payment/widgets/pay_button_design.dart';
import 'package:milkride/feature/wallet/presentation/screen/payment/widgets/payment_method_card.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});
  @override
  State<PaymentPage> createState() => _PaymentPageState();
}
class _PaymentPageState extends State<PaymentPage> {
  bool isSelectedPayOnline = true;
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<PaymentCubit>();
    final selectedAmount = cubit.selectedAmount;
    return BlocBuilder<PaymentCubit, PaymentState>(
      builder: (context, state) {
        if(state is PaymentError){
          return NetworkFailCard(messege: state.messege,isButtonRequired: true,);
        }
        return CommonContainer(
          widget: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () => Get.back(),
                    icon: Icon(Icons.arrow_back),
                  ).paddingSymmetric(horizontal: 10.w, vertical: 10.h),
                  AppText(data: AppStrings.addMoney),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () => setState(() => isSelectedPayOnline = true),
                      child: CommonContainer(
                        width: 1.sw,
                        widget: PayMethodCard(
                          icon: Icons.wallet,
                          text: AppStrings.payOnline,
                          selected: isSelectedPayOnline,
                        ),
                        color: isSelectedPayOnline
                            ? AppColors.activeIconColor
                            : AppColors.white,
                        height: 80.h,
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Expanded(
                    child: GestureDetector(
                        onTap: () =>
                            setState(() => isSelectedPayOnline = false),
                        child: CommonContainer(
                            width: 1.sw,
                            widget: PayMethodCard(
                                icon: Icons.payment,
                                text: AppStrings.reqCash,
                                selected: !isSelectedPayOnline),
                            color: isSelectedPayOnline
                                ? AppColors.white
                                : AppColors.activeIconColor,
                            height: 80.h,
                            borderRadius: BorderRadius.circular(10.r))),
                  ),
                ],
              ).paddingSymmetric(horizontal: 10.w),
              AmountSection(
                      cubit: cubit,
                      selectedAmount: selectedAmount,
                      isSelectedPayOnline: isSelectedPayOnline)
                  .paddingSymmetric(horizontal: 10.w, vertical: 10.h),
              if (!isSelectedPayOnline)
                AppTextField(
                  hintText: AppStrings.selectDate,
                  controller: cubit.dateController,
                  ontap: () => cubit.pickDate(),
                  isReadonly: true,
                  onValidate: (value) {
                    if (value == null || value.isEmpty) {
                      return AppStrings.selectDate;
                    }
                    return null;
                  },
                ).paddingSymmetric(horizontal: 10.w),
              const Spacer(),
              CustomElevatedButton(
                onPressed: () {
                  if (isSelectedPayOnline) {
                    cubit.fetchPaymentResponse();
                  } else {
                    cubit.requestCash();
                  }
                },
                child: PayButtonDesign(
                    selectedAmount: selectedAmount,
                    isSelectedPayOnline: isSelectedPayOnline),
              ).paddingSymmetric(horizontal: 10.w, vertical: 5.h),
            ],
          ),
          color: AppColors.whiteShade,
          height: 0.7.sh,
          width: 1.sw,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
        );
      },
    );
  }
}

