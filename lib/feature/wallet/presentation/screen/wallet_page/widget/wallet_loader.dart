import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:milkride/core/common/load_container.dart';

class WalletLoader extends StatelessWidget {
  const WalletLoader({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            LoadContainer(height: 100.h, width: 0.4.sw,radius: 10.r),
            LoadContainer(height: 100.h, width: 0.4.sw,radius: 10.r),
          ],
        ).paddingSymmetric(horizontal: 20.w,vertical: 5.h),
        LoadContainer(height: 50.h, width: 1.sw,radius: 10.r).paddingSymmetric(horizontal: 20.w,vertical: 5.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            LoadContainer(height: 80.h, width: 0.4.sw,radius: 10.r),
            LoadContainer(height: 80.h, width: 0.4.sw,radius: 10.r),
          ],
        ).paddingSymmetric(horizontal: 20.w,vertical: 10.h),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LoadContainer(height: 20.h, width: 0.4.sw,radius: 5.r).paddingOnly(bottom: 10.h),
            LoadContainer(height: 40.h, width: 1.sw,radius: 10.r).paddingOnly(bottom: 10.h),
            LoadContainer(height: 40.h, width: 1.sw,radius: 10.r).paddingOnly(bottom: 10.h),
            LoadContainer(height: 40.h, width: 1.sw,radius: 10.r).paddingOnly(bottom: 10.h),
            LoadContainer(height: 40.h, width: 1.sw,radius: 10.r).paddingOnly(bottom: 10.h),
            LoadContainer(height: 40.h, width: 1.sw,radius: 10.r).paddingOnly(bottom: 10.h),
          ],
        ).paddingSymmetric(horizontal: 15.w,vertical: 10.h),
      ],
    );
  }
}

