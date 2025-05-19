import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:milkride/core/common/load_container.dart';

class RechargeHistoryLoader extends StatelessWidget {
  const RechargeHistoryLoader({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LoadContainer(height: 80.h, width: 1.sw,radius: 10.r).paddingOnly(bottom: 10.h),
        LoadContainer(height: 20.h, width: 0.6.sw,radius: 5.r).paddingSymmetric(horizontal: 10.w,vertical: 2.h),
        LoadContainer(height: 50.h, width: 1.sw,radius: 10.r).paddingSymmetric(horizontal: 10.w,vertical: 2.h),
        LoadContainer(height: 50.h, width: 1.sw,radius: 10.r).paddingSymmetric(horizontal: 10.w,vertical: 2.h).paddingOnly(bottom: 10.h),
        LoadContainer(height: 20.h, width: 0.6.sw,radius: 5.r).paddingSymmetric(horizontal: 10.w,vertical: 2.h),
        LoadContainer(height: 50.h, width: 1.sw,radius: 10.r).paddingSymmetric(horizontal: 10.w,vertical: 2.h),
        LoadContainer(height: 50.h, width: 1.sw,radius: 10.r).paddingSymmetric(horizontal: 10.w,vertical: 2.h).paddingOnly(bottom: 10.h),
        LoadContainer(height: 20.h, width: 0.6.sw,radius: 5.r).paddingSymmetric(horizontal: 10.w,vertical: 2.h),
        LoadContainer(height: 50.h, width: 1.sw,radius: 10.r).paddingSymmetric(horizontal: 10.w,vertical: 2.h),
        LoadContainer(height: 50.h, width: 1.sw,radius: 10.r).paddingSymmetric(horizontal: 10.w,vertical: 2.h).paddingOnly(bottom: 10.h),
        LoadContainer(height: 20.h, width: 0.6.sw,radius: 5.r).paddingSymmetric(horizontal: 10.w,vertical: 2.h),
        LoadContainer(height: 50.h, width: 1.sw,radius: 10.r).paddingSymmetric(horizontal: 10.w,vertical: 2.h),
        LoadContainer(height: 50.h, width: 1.sw,radius: 10.r).paddingSymmetric(horizontal: 10.w,vertical: 2.h).paddingOnly(bottom: 10.h),
      ],
    );
  }
} 
