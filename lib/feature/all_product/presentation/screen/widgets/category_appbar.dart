import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:milkride/core/common/app_text.dart';
import 'package:milkride/core/common/common_container.dart';
import 'package:milkride/core/constant/app_strings.dart';
import 'package:milkride/core/routes/routes_name.dart';

class CategoryAppbar extends StatelessWidget {
  const CategoryAppbar({super.key});
  @override
  Widget build(BuildContext context) {
    return CommonContainer(
      height: 90.h,
      width: 1.sw,
      widget: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            children: [
              IconButton(
                onPressed: () => Get.back(),
                icon: Icon(Icons.arrow_back_ios),
              ),
              AppText(data: AppStrings.allProducts),
            ],
          ),
          IconButton(
            onPressed: () => Get.toNamed(RoutesName.cartPage),
            icon: Icon(Icons.shopping_cart),
          ),
        ],
      ).paddingSymmetric(horizontal: 10.w),
    );
  }
}
