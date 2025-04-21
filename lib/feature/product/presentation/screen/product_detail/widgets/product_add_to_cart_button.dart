import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:milkride/core/common/app_elevated_button.dart';
import 'package:milkride/core/common/app_text.dart';
import 'package:milkride/core/constant/app_colors.dart';
import 'package:milkride/core/constant/app_strings.dart';
import 'package:milkride/feature/product/domain/entities/product.dart';

class ProductAddToCartButton extends StatelessWidget {
  final Product? selected;
  final int quantity;
  final VoidCallback onTap;
  final String? salePrice;
  const ProductAddToCartButton({
    super.key,
    required this.selected,required this.quantity, required this.onTap,required this.salePrice
  });
  @override
  Widget build(BuildContext context) {
    final total = quantity * (double.tryParse(salePrice ?? '0') ?? 0);
    return SizedBox(
      width: double.infinity,
      child: CustomElevatedButton(
        backgroundColor: AppColors.otionButton,
        onPressed: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppText(
                   data: "₹ ${total.toStringAsFixed(2)}",fontSize: 12.sp,fontWeight: FontWeight.w500,color: AppColors.white),
                AppText(
                   data: AppStrings.itemTotal,fontSize: 12.sp,color: AppColors.white),
              ],
            ),
            AppText(data: AppStrings.addToCart,fontSize: 12.sp,fontWeight: FontWeight.w600,color: AppColors.white)
          ],
        ),
      ),
    );
  }
}
