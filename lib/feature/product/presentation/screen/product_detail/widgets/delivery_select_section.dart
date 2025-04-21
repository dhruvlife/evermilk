import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:milkride/core/constant/app_strings.dart';
import 'package:milkride/feature/product/presentation/cubit/product_detail/prod_detail_cubit.dart';
import 'package:milkride/feature/product/presentation/screen/option_sheet/widgets/delivery_button.dart';

class DeliveryChooseCard extends StatelessWidget {
  const DeliveryChooseCard(
      {super.key, required this.cubit, required this.deliveryType});

  final ProdDetailCubit cubit;
  final String deliveryType;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      SelectedButton(
        data: AppStrings.morning,
        isSlected: deliveryType == AppStrings.morning,
        onPressed: () => cubit.changeDeliveryType(delivery: AppStrings.morning),
      ).paddingOnly(right: 5.w),
      SelectedButton(
        data: AppStrings.evening,
        isSlected: deliveryType == AppStrings.evening,
        onPressed: () => cubit.changeDeliveryType(delivery: AppStrings.evening),
      )
    ]);
  }
}
