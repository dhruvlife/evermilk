import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:milkride/core/common/app_text.dart';
import 'package:milkride/core/common/common_container.dart';
import 'package:milkride/core/constant/app_colors.dart';
import 'package:milkride/core/constant/app_strings.dart';
import 'package:milkride/feature/profile/domain/entities/profile_data.dart';

class ProfileHeader extends StatelessWidget {
  final ProfileData? user;
  const ProfileHeader({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return CommonContainer(
      widget: Row(
        children: [
          CircleAvatar(
            child: AppText(
              data: user?.name?.capitalize?.substring(0, 1) ?? "User",
              fontWeight: FontWeight.w600,
              fontSize: 14.sp,
            ),
          ).paddingOnly(right: 10.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              AppText(
                  data: user?.name?.capitalize ?? "",
                  fontWeight: FontWeight.w600,
                  fontSize: 12.sp),
              Row(
                children: [
                  Icon(
                    Icons.verified,
                    color: AppColors.themeBgColor,
                    size: 15.sp,
                  ),
                  AppText(
                    data: " ${AppStrings.profileVerify + AppStrings.appName} ",
                    fontSize: 10.sp,
                    color: AppColors.lightGrey,
                  ),
                ],
              ),
            ],
          )
        ],
      ).paddingSymmetric(horizontal: 10.w),
      height: 60.h,
      width: double.infinity,
      borderRadius: BorderRadius.circular(5.r),
    );
  }
}
