import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:milkride/core/common/load_container.dart';

class AllCategoryLoad extends StatelessWidget {
  const AllCategoryLoad({super.key});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: EdgeInsets.all(2),
        itemCount: 12,
        itemBuilder: (context, index) {
          return LoadContainer(height: 80.h, width: 60.w, radius: 5.r).paddingSymmetric(horizontal: 10.w, vertical: 5.h);
        });
  }
}
