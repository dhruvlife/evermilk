import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:milkride/core/common/load_container.dart';

class OrderLoader extends StatelessWidget {
  const OrderLoader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 80.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (context, index) {
              return LoadContainer(
                height: 80.h,
                width: 80.w,
                radius: 5.r,
              ).paddingAll(2);
            },
          ),
        ),
        Row(
          children: [
            Expanded(child: LoadContainer(height: 35.h, width: 1.sw, radius: 5.r)),
            SizedBox(width: 10.w),
            Expanded(child: LoadContainer(height: 35.h, width: 1.sw, radius: 5.r)),
            SizedBox(width: 10.w),
            Expanded(child: LoadContainer(height: 35.h, width: 1.sw, radius: 5.r))
          ],
        ).paddingAll(10),
        LoadContainer(height: 100.h, width: 1.sw, radius: 5.r).paddingAll(5),
        LoadContainer(height: 100.h, width: 1.sw, radius: 5.r).paddingAll(5),
        LoadContainer(height: 100.h, width: 1.sw, radius: 5.r).paddingAll(5),
      ],
    );
  }
}
