import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:milkride/core/common/app_label.dart';
import 'package:milkride/core/common/app_network_image.dart';
import 'package:milkride/core/common/app_text.dart';
import 'package:milkride/core/common/mrp_text.dart';
import 'package:milkride/core/common/quantity_button.dart';
import 'package:milkride/core/constant/app_strings.dart';

class SubProdCard extends StatelessWidget {
  final String imageUrl;
  final String tag;
  final String productName;
  final int quantity;
  final String price;
  final String oldPrice;
  final void Function() onIncreaseQuant;
  final void Function() onReduceQuant;

   const SubProdCard({
    super.key,
    required this.imageUrl,
    required this.tag,
    required this.productName,
    required this.quantity,
    required this.price,
    required this.oldPrice,
    required this.onIncreaseQuant,
    required this.onReduceQuant,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          AppNetWorkImage(image:imageUrl, height: 70, width: 70).paddingOnly(right: 10.w),          
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppLabel(height: 20.h, width:80.w, label: AppStrings.morning,labelSize: 10.sp,borderRadius: BorderRadius.circular(10.r)).paddingOnly(bottom:5.h),
              AppText(data:productName,fontWeight: FontWeight.bold,fontSize: 10.sp).paddingOnly(bottom:2.h),
              AppText(data:"400 ml",color: Colors.grey,fontSize: 10.sp).paddingOnly(bottom:2.h),
              MrpText(sellPrice: price,mrpPrice: oldPrice, height:20.h, width:100.w)
            ],
          ),
          Spacer(),
          QuantityButton(quantity: quantity.toString(), onIncreaseQuant:onIncreaseQuant, onReduceQuant:onReduceQuant)                
        ],
      ).paddingAll(10),
    );
  }
}
