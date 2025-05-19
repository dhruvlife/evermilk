import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:milkride/core/constant/app_colors.dart';

class SerchBar extends StatelessWidget {
  const SerchBar({
    super.key,
    required this.searchController,
  });

  final TextEditingController searchController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60.h,
      child: TextField(
        controller: searchController,
        textAlign: TextAlign.start,
        style: TextStyle(fontSize: 12.sp),
        decoration: InputDecoration(
          hintText: "Search...",
          hintStyle: TextStyle(fontSize: 13.sp),
          prefixIcon: Icon(Icons.search, size: 18.sp),
          contentPadding: EdgeInsets.zero,
          isDense: true,
          filled: true,
          fillColor: AppColors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide: BorderSide(color: Colors.grey.shade300),
          ),
        ),
      ).marginAll(10.sp),
    );
  }
}
