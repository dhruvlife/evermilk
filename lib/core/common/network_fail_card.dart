import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:milkride/core/common/app_image.dart';
import 'package:milkride/core/common/app_text.dart';
import 'package:milkride/core/key/app_images.dart';

class NetworkFailCard extends StatelessWidget {
  final String messege;
  const NetworkFailCard({super.key,required this.messege});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        AppImage(image: AppImages.networkFail, height: 60.h, width: 60.w),
        AppText(data: messege,fontSize: 10.sp,fontWeight: FontWeight.w500)
      ]),
    );
  }
}
