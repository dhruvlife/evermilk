import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:milkride/core/common/load_container.dart';

class CategoryProductPageLoad extends StatelessWidget {
  const CategoryProductPageLoad({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LoadContainer(height: 90.h, width: 1.sw, radius: 5.r).paddingSymmetric(horizontal: 10.w,vertical: 5.h),
        LoadContainer(height: 90.h, width: 1.sw, radius: 5.r).paddingSymmetric(horizontal: 10.w,vertical: 5.h),
        LoadContainer(height: 90.h, width: 1.sw, radius: 5.r).paddingSymmetric(horizontal: 10.w,vertical: 5.h),
        LoadContainer(height: 90.h, width: 1.sw, radius: 5.r).paddingSymmetric(horizontal: 10.w,vertical: 5.h),
      ],
    );
  }
}