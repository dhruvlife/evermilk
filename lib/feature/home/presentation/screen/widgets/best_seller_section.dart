import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:milkride/core/common/app_text.dart';
import 'package:milkride/core/constant/app_strings.dart';
import 'package:milkride/core/routes/routes_name.dart';
import 'package:milkride/core/storage/storage_key.dart';
import 'package:milkride/core/storage/storage_object.dart';
import 'package:milkride/core/utils/app_functional_components.dart';
import 'package:milkride/core/utils/operation.dart';
import 'package:milkride/feature/home/presentation/cubit/home_cubit.dart';
import 'package:milkride/feature/product/domain/entities/product.dart';
import 'package:milkride/feature/home/presentation/screen/widgets/product_card_vertical.dart';
import 'package:milkride/feature/product/domain/usecase/product_usecase.dart';
import 'package:milkride/feature/product/presentation/screen/option_sheet/product_option_sheet.dart';

class BestSellerSection extends StatelessWidget {
  final List<Product> bestSellerProds;
  const BestSellerSection({super.key, required this.bestSellerProds});

  @override
  Widget build(BuildContext context) {
    final uniqueProds =
        Operation.getUniqueProductsByProductId(products: bestSellerProds);
    return SizedBox(
      width: double.infinity,
      height: 220.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
            data: AppStrings.bestSellerTitle,
            fontWeight: FontWeight.w600,
          ).paddingOnly(bottom: 5.h),
          Expanded(
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: uniqueProds.length,
                itemBuilder: (context, index) {
                  return ProductCardVertical(
                    onAdd: () {
                      final customerId = StorageObject.readData(StorageKeys.customerId).toString();
                      AppFunctionalComponents.showSheet(
                        builder: (context) => ProductOptionSheet(
                          prodDetailParam: ProdDetailParam(
                              productId: uniqueProds[index].productId.toString(),
                              customerId: customerId.toString()),
                        ),
                      );
                    },
                    prod: uniqueProds[index],
                    onTapProd: () {
                      final customerId = context.read<HomeCubit>().userData?.id;
                      Get.toNamed(RoutesName.productDetail,
                          arguments: ProdDetailParam(
                              productId: uniqueProds[index].productId.toString(),
                              customerId: customerId.toString()));
                    },
                  ).paddingOnly(right: 10.w);
                }),
          )
        ],
      ),
    ).paddingSymmetric(vertical: 10.h);
  }
}
