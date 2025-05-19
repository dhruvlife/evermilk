import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:milkride/core/common/load_container.dart';

class ViewAllCatLoader extends StatelessWidget {
  const ViewAllCatLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
    padding: EdgeInsetsDirectional.symmetric(horizontal: 10.w,vertical: 10.h),
    gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,childAspectRatio: 0.8), 
    itemCount: 11,
    itemBuilder:(context,index){
      return LoadContainer(height: 140.h, width:80.w,radius: 10.r,).paddingAll(10);
    });
  }
}