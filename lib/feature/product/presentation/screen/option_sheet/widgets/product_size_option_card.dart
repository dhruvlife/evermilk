import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:milkride/core/common/app_text.dart';
import 'package:milkride/core/common/common_container.dart';
import 'package:milkride/core/common/mrp_text.dart';
import 'package:milkride/core/constant/app_colors.dart';
import 'package:milkride/core/utils/operation.dart';
import 'package:milkride/feature/product/domain/entities/product.dart';

class ProductSizeOptionCard extends StatelessWidget {
  final VoidCallback onTap;
  final Product prod;
  final bool isSlected;
  const ProductSizeOptionCard({
    super.key,
    required this.onTap,
    required this.prod,
    required this.isSlected
  });

  @override
  Widget build(BuildContext context) {
    final discount = Operation.discountRate(
        salePrice: prod.salePrice ?? "0", mrpPrice: prod.mrpPrice ?? "0");
    return GestureDetector(
      onTap: onTap,
      child: CommonContainer(
        widget: Column(
          children: [
            CommonContainer(
              color: AppColors.otionButton,
              width: double.infinity,
              height: 25.h,
              borderRadius: BorderRadius.vertical(top: Radius.circular(9.r)),
              widget: Center(
                  child: AppText(
                data: "$discount Off",
                color: AppColors.white,
                fontSize: 12.sp,
              )),
            ),
            AppText(
                data: "${prod.packageSize} ${prod.volume}",
                fontSize: 12.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.grey),
            MrpText(
                isCenter: true,
                sellPrice: "₹${prod.salePrice}",
                mrpPrice: "₹${prod.mrpPrice}",
                height: 25.h,
                width: 1.sw)
          ],
        ),
        height: 75.h,
        width: 120.w,
        borderRadius: BorderRadius.circular(10.r),
        borderColor:isSlected? AppColors.otionButton:Colors.transparent,
      ),
    ).paddingSymmetric(horizontal: 2.h, vertical: 2.h);
  }
}
