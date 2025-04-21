import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:milkride/core/common/app_text.dart';
import 'package:milkride/core/constant/app_colors.dart';
import 'package:milkride/core/constant/app_strings.dart';
import 'package:milkride/core/routes/routes_name.dart';
import 'package:milkride/feature/product/domain/entities/categories.dart';
import 'package:milkride/feature/home/presentation/screen/widgets/categories_product_card.dart';

class CategorySection extends StatelessWidget {
  final List<Categories> categories;
  const CategorySection({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 175.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText(
                data: AppStrings.categoryTitle,
                fontWeight: FontWeight.w600,
              ),
              GestureDetector(
                onTap: ()=> Get.toNamed(RoutesName.viewAllCat),
                child: AppText(
                  data: AppStrings.viewAll,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.lightGrey,
                ),
              )
            ],
          ).paddingOnly(bottom: 5.h),
          Expanded(
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return CategoriesProductCard(
                    categoryProd: categories[index],
                    onTapCategory: () {
                      Get.toNamed(RoutesName.categoeyProds,arguments:categories[index] );
                    },
                  ).paddingOnly(right: 10.w);
                }),
          )
        ],

      ),
    ).paddingOnly(top: 10.h);
  }
}
