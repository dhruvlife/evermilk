import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:milkride/core/common/app_label.dart';
import 'package:milkride/core/common/app_network_image.dart';
import 'package:milkride/core/constant/app_colors.dart';
import 'package:milkride/feature/product/domain/entities/categories.dart';

class CategoriesProductCard extends StatelessWidget {
  final Categories categoryProd;
  final VoidCallback onTapCategory;
  final double? height;
  final double? width;
  const CategoriesProductCard(
      {super.key,
      required this.categoryProd,
      required this.onTapCategory,
      this.height,
      this.width});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapCategory,
      child: SizedBox(
        height: height ?? 100.h,
        width: width ?? 100.w,
        child: Column(
          children: [
            AppNetWorkImage(
              borderRadius: 5.r,
              image: categoryProd.imageUrl!,
              fit: BoxFit.fill,
              height: height ?? 100.h,
              width: width ?? 100.w,
            ),
            AppLabel(
              height: 25.h,
              width: width ?? 100.w,
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(5.r)),
              colors: [AppColors.white, AppColors.inactiveIconColor],
              label: categoryProd.name ?? "",
              labelSize: 10.sp,
              labelColor: AppColors.black,
            )
          ],
        ),
      ),
    );
  }
}
