import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:milkride/core/common/app_label.dart';
import 'package:milkride/core/common/app_network_image.dart';
import 'package:milkride/core/common/common_container.dart';
import 'package:milkride/core/common/food_type_card.dart';
import 'package:milkride/core/common/mrp_text.dart';
import 'package:milkride/core/constant/app_strings.dart';
import 'package:milkride/core/routes/routes_name.dart';
import 'package:milkride/core/utils/app_functional_components.dart';
import 'package:milkride/feature/home/presentation/cubit/home_cubit.dart';
import 'package:milkride/feature/product/domain/entities/product.dart';
import 'package:milkride/feature/product/domain/usecase/product_usecase.dart';
import 'package:milkride/feature/product/presentation/screen/option_sheet/widgets/option_button.dart';
import 'package:milkride/feature/product/presentation/screen/option_sheet/product_option_sheet.dart';
import 'package:milkride/service.dart/injection.dart';

class ProductCategoryCard extends StatelessWidget {
  final Product product;
  final double? height;
  final double? imageWidth;

  const ProductCategoryCard({
    super.key,
    required this.product,
    this.height,
    this.imageWidth,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          final customerId = context.read<HomeCubit>().userData?.id;
          Get.toNamed(RoutesName.productDetail,
              arguments: ProdDetailParam(
                  productId: product.productId.toString(),
                  customerId: customerId.toString()));
        },
        child: CommonContainer(
          height: height ?? 100.h,
          width: double.infinity,
          widget: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(5.r),
                child: AppNetWorkImage(
                  image: product.imageUrl ?? "",
                  height: height ?? 90.h,
                  width: imageWidth ?? 90.w,
                ),
              ).paddingSymmetric(horizontal: 5.w, vertical: 5.h),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppFunctionalComponents.lightText(
                        data: product.brand ?? "", fontSize: 10.sp),
                    Row(
                      children: [
                        AppFunctionalComponents.darkText(
                                data: product.name ?? "")
                            .paddingOnly(right: 2.w),
                        FoodTypeCard(
                          isVeg: product.foodType == "veg",
                          height: 10.h,
                          width: 10.w,
                        ),
                      ],
                    ),
                    AppFunctionalComponents.lightText(
                        data: "${product.packageSize} ${product.volume}",
                        fontSize: 10.sp),
                    MrpText(
                      sellPrice: "₹${product.salePrice}",
                      height: 20.h,
                      width: 120.w,
                      mrpPrice: "₹${product.mrpPrice}",
                      sellFontSize: 12.sp,
                    )
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  if (product.mustTry == true)
                    AppLabel(
                      height: 20.h,
                      width: 60.w,
                      label: AppStrings.mustTry,
                      borderRadius: BorderRadius.circular(5.r),
                    ),
                  OptionButton(
                    onPressed: () {
                      final customerId = getIt<HomeCubit>().userData?.id;
                      AppFunctionalComponents.showSheet(
                        builder: (context) => ProductOptionSheet(
                          prodDetailParam: ProdDetailParam(
                              productId: product.productId.toString(),
                              customerId: customerId.toString()),
                        ),
                      );
                    },
                  ),
                ],
              ).paddingSymmetric(horizontal: 5.w, vertical: 5.h),
            ],
          ),
        )).paddingSymmetric(horizontal: 5.w, vertical: 5.h);
  }
}
