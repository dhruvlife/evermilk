import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:milkride/core/common/load_container.dart';

class OptionSheetLoader extends StatelessWidget {
  const OptionSheetLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            LoadContainer(height: 25.h, width: 100.w, radius: 5.r)
                .paddingAll(5),
            LoadContainer(height: 25.h, width: 30.w, radius: 5.r).paddingAll(5),
          ],
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              LoadContainer(height: 75.h, width: 130.w, radius: 5.r).paddingAll(5),
              LoadContainer(height: 75.h, width: 130.w, radius: 5.r).paddingAll(5),
              LoadContainer(height: 75.h, width: 130.w, radius: 5.r).paddingAll(5),
              LoadContainer(height: 75.h, width: 130.w, radius: 5.r).paddingAll(5),
            ],
          ),
        ),
        LoadContainer(height: 200.h, width: 1.sw, radius: 5.r).paddingAll(5),
      ],
    ).paddingSymmetric(vertical: 5.h, horizontal: 10.w);
  }
}
