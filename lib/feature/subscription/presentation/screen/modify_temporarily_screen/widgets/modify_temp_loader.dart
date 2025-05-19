
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:milkride/core/common/load_container.dart';

class ModifyLoader extends StatelessWidget {
  const ModifyLoader({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LoadContainer(height: 150.h, width: 1.sw, radius: 10.r)
            .paddingOnly(bottom: 10.h),
        LoadContainer(height: 150.h, width: 1.sw, radius: 10.r)
            .paddingOnly(bottom: 10.h),
        LoadContainer(height: 150.h, width: 1.sw, radius: 10.r)
            .paddingOnly(bottom: 10.h),
        LoadContainer(height: 150.h, width: 1.sw, radius: 10.r)
            .paddingOnly(bottom: 10.h),
      ],
    ).paddingSymmetric(horizontal: 10.w, vertical: 15.h);
  }
}
