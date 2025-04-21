import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:milkride/core/common/load_container.dart';

class HomeLoader extends StatelessWidget {
  const HomeLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LoadContainer(height: 150.h, width: double.infinity).paddingOnly(bottom: 10.h),
        HomeCategoryLoader().paddingSymmetric(vertical: 10.h),
        LoadContainer(height: 150.h, width: double.infinity).paddingOnly(bottom: 10.h),
        HomeCategoryLoader().paddingSymmetric(vertical: 10.h),
      ],
    );
  }
}

class HomeCategoryLoader extends StatelessWidget {
  const HomeCategoryLoader({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 6,
        itemBuilder: (context, index) {
          return LoadContainer(height: 120.h, width: 100.w).paddingAll(5);
        },
      ),
    );
  }
}
