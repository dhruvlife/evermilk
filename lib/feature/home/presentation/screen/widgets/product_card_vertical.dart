import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:milkride/core/common/app_label.dart';
import 'package:milkride/core/common/app_network_image.dart';
import 'package:milkride/core/common/app_text.dart';
import 'package:milkride/core/common/common_container.dart';
import 'package:milkride/core/common/food_type_card.dart';
import 'package:milkride/core/common/mrp_text.dart';
import 'package:milkride/core/constant/app_colors.dart';
import 'package:milkride/core/constant/app_strings.dart';
import 'package:milkride/core/utils/app_functional_components.dart';
import 'package:milkride/feature/product/domain/entities/product.dart';

class ProductCardVertical extends StatelessWidget {
  final Product prod;
  final VoidCallback onTapProd;
  final VoidCallback? onAdd;
  final double? width;
  final double? height;
  final double? imageHeight;
  final double? dataHeight;
  final double? labelWidth;
  final double? labelHeight;
  const ProductCardVertical(
      {super.key,
      required this.prod,
      required this.onTapProd,
      this.onAdd,
      this.height,
      this.imageHeight,
      this.width,
      this.labelWidth,
      this.labelHeight,
      this.dataHeight});
  @override
  Widget build(BuildContext context) {
    final prodName = prod.name ?? "";
    final isMustTry = prod.mustTry ?? false;
    return GestureDetector(
      onTap: onTapProd,
      child: CommonContainer(
        borderRadius: BorderRadius.circular(5.r),
        height: height ?? 160.h,
        width: width ?? 140.w,
        widget: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: AlignmentDirectional.topEnd,
              children: [
                AppNetWorkImage(
                    borderRadius: 5.r,
                    image: prod.imageUrl ?? "",
                    fit: BoxFit.fill,
                    height: imageHeight ?? 120.h,
                    width: double.infinity),
                isMustTry
                    ? AppLabel(
                        height: labelHeight ?? 20.h,
                        width: labelWidth ?? 60.w,
                        label: "Must Try",
                        labelFontWeight: FontWeight.w600,
                        labelSize: 10.sp,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(5.r),
                            topRight: Radius.circular(5.r)))
                    : Container(),
              ],
            ).paddingOnly(bottom: 4.h),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              AppFunctionalComponents.darkText(
                  data: prodName.length > 20
                      ? "${prodName.substring(0, 19)}.."
                      : prodName),
              FoodTypeCard(
                  isVeg: prod.foodType == "veg", height: 12.h, width: 12.w)
            ]).paddingSymmetric(horizontal: 4.w),
            SizedBox(
              height: dataHeight ?? 50.h,
              width: 130.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MrpText(
                    sellPrice: "₹${prod.salePrice}",
                    height: 20.h,
                    width: 120.w,
                    mrpPrice: "₹${prod.mrpPrice}",
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppFunctionalComponents.lightText(
                          data: "( ${prod.packageSize ?? ""} ${prod.volume ?? ""} )"),
                      GestureDetector(
                        onTap: onAdd,
                        child: CommonContainer(
                          width: 70.w,
                          height: 25.h,
                          borderRadius: BorderRadius.circular(5.r),
                          color: AppColors.optionButton,
                          widget: Center(
                            child: AppText(
                              data: AppStrings.add,
                              fontSize: 8.sp,
                              color: AppColors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ).paddingSymmetric(horizontal: 4.w)
          ],
        ),
      ),
    );
  }
}
