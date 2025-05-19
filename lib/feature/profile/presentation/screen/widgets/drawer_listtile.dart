import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:milkride/core/common/app_text.dart';

class DrawerListTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback? onTap;
  const DrawerListTile({super.key,required this.icon,required this.title,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: 40.h,
        child: ListTile(
          leading: Icon(icon,size: 20.sp,),
          title: AppText(data: title,fontSize: 12.sp,fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}

class DrawerDivider extends StatelessWidget {
  const DrawerDivider({super.key});
  @override
  Widget build(BuildContext context) {
    return Divider(
      indent: 50.w,
      endIndent: 10.w,
    );
  }
}