import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:milkride/core/common/load_container.dart';

class CartPageLoad extends StatelessWidget {
  const CartPageLoad({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LoadContainer(height:60.h, width:1.sw,radius: 10.r).paddingSymmetric(horizontal: 10.w,vertical: 2.h),
        LoadContainer(height:60.h, width:1.sw,radius: 10.r).paddingSymmetric(horizontal: 10.w,vertical: 2.h),
        LoadContainer(height:60.h, width:1.sw,radius: 10.r).paddingSymmetric(horizontal: 10.w,vertical: 2.h),
        LoadContainer(height:20.h, width:0.4.sw,radius: 10.r).paddingSymmetric(horizontal: 10.w,vertical: 5.h),
        LoadContainer(height:120.h, width:1.sw,radius: 10.r).paddingSymmetric(horizontal: 10.w,vertical:5.h),
        LoadContainer(height:60.h, width:1.sw,radius: 10.r).paddingSymmetric(horizontal: 10.w,vertical: 5.h),
        Spacer(),
        LoadContainer(height:60.h, width:1.sw,radius: 10.r).paddingSymmetric(horizontal: 10.w,vertical: 10.h),
      ],
    );
  }
}