import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:milkride/core/common/app_label.dart';
import 'package:milkride/core/common/app_network_image.dart';
import 'package:milkride/core/common/app_text.dart';
import 'package:milkride/core/common/food_type_card.dart';
import 'package:milkride/core/common/quantity_button.dart';
import 'package:milkride/core/constant/app_strings.dart';
import 'package:milkride/core/routes/routes_name.dart';
import 'package:milkride/core/utils/app_functional_components.dart';
import 'package:milkride/feature/product/domain/entities/product.dart';
import 'package:milkride/feature/product/presentation/cubit/product_detail/prod_detail_cubit.dart';
import 'package:milkride/feature/product/presentation/screen/option_sheet/widgets/delivery_button.dart';
import 'package:milkride/feature/product/presentation/screen/option_sheet/widgets/product_size_option_card.dart';
import 'package:milkride/feature/product/presentation/screen/product_detail/widgets/delivery_select_section.dart';

class ProdDetailPageSection extends StatelessWidget {
  final Product? selected;
  final List<Product> variantList;
  final ProdDetailCubit cubit;
  final String label;
  final String quantity;
  final String deliveryType;

  const ProdDetailPageSection({
    super.key,
    required this.selected,
    required this.variantList,
    required this.cubit,
    required this.label,
    required this.quantity,
    required this.deliveryType,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      AppNetWorkImage(
              radius: BorderRadius.circular(10.r),
              fit: BoxFit.fill,
              borderRadius: 10.r,
              image: selected?.imageUrl ?? '',
              height: 300.h,
              width: 1.sw)
          .paddingOnly(bottom: 10.h),
      AppLabel(
              height: 20.h,
              width: 1.sw,
              label: label,
              borderRadius: BorderRadius.circular(10.r))
          .paddingOnly(bottom: 10.h),
      AppFunctionalComponents.lightText(
          data: "${selected?.brand}", fontSize: 14.sp),
      Row(children: [
        AppFunctionalComponents.darkText(
                data: selected?.name ?? "", fontSize: 18.sp)
            .paddingOnly(right: 10.h),
        FoodTypeCard(
            isVeg: selected?.foodType == "veg", height: 15.h, width: 15.w)
      ]).paddingOnly(bottom: 4.h),
      SizedBox(
          height: 80.h,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: variantList.length,
              itemBuilder: (context, index) {
                return ProductSizeOptionCard(
                    prod: variantList[index],
                    isSlected: selected?.id == variantList[index].id,
                    onTap: () => context
                        .read<ProdDetailCubit>()
                        .selectVariant(variant: variantList[index]));
              })),
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        AppFunctionalComponents.lightText(
            data: AppStrings.quantity, fontSize: 14.sp),
        QuantityButton(
            quantity: quantity,
            onIncreaseQuant: () => cubit.incrementQty(),
            onReduceQuant: () => cubit.decrementQty())
      ]).paddingSymmetric(horizontal: 10.w, vertical: 20.h),
       AppText(
          data: AppStrings.chooseDeliveryType,
          fontSize: 12.sp,
          fontWeight: FontWeight.w600),
      DeliveryChooseCard(
        cubit: cubit,
        deliveryType: deliveryType,
      ).paddingSymmetric(horizontal: 10.w, vertical: 10.h),
      AppText(
          data: AppStrings.purchaseType,
          fontSize: 12.sp,
          fontWeight: FontWeight.w600),
      Row(
        children: [
          SelectedButton(
              btnWidth: 90.w,
              data: "Buy Once",
              isSlected: true,
              onPressed: () {}),
          SizedBox(width: 10.w),
          SelectedButton(
              btnWidth: 90.w,
              data: "Subscribe",
              isSlected: false,
              onPressed: () {
                Get.toNamed(RoutesName.subscribePage,arguments: selected);
              }),
        ],
      ).paddingSymmetric(horizontal: 10.w, vertical: 10.h),
      SizedBox(height: 100.h)
    ]);
  }
}
