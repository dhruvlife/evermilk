import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:milkride/core/common/load_container.dart';

class ProfileLoader extends StatelessWidget {
  const ProfileLoader({super.key});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 0.8.sh,child: ListView(
        children: [
          LoadContainer(height:50.h, width:1.sw,radius: 10.r).paddingSymmetric(horizontal: 10.w,vertical: 5.h),
          LoadContainer(height:50.h, width:1.sw,radius: 10.r).paddingSymmetric(horizontal: 10.w,vertical: 5.h),
          LoadContainer(height:50.h, width:1.sw,radius: 10.r).paddingSymmetric(horizontal: 10.w,vertical: 5.h),
          LoadContainer(height:50.h, width:1.sw,radius: 10.r).paddingSymmetric(horizontal: 10.w,vertical: 5.h),
          LoadContainer(height:50.h, width:1.sw,radius: 10.r).paddingSymmetric(horizontal: 10.w,vertical: 5.h),
          LoadContainer(height:50.h, width:1.sw,radius: 10.r).paddingSymmetric(horizontal: 10.w,vertical: 5.h),
          LoadContainer(height:100.h, width:1.sw,radius: 10.r).paddingSymmetric(horizontal: 10.w,vertical: 5.h),
          LoadContainer(height:100.h, width:1.sw,radius: 10.r).paddingSymmetric(horizontal: 10.w,vertical: 5.h),
          LoadContainer(height:100.h, width:1.sw,radius: 10.r).paddingSymmetric(horizontal: 10.w,vertical: 5.h),
        ],
      ),
    ).paddingSymmetric(vertical: 10.h);
  }
}