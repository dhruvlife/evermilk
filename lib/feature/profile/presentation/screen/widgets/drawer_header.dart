import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:milkride/core/common/app_label.dart';
import 'package:milkride/core/common/app_text.dart';
import 'package:milkride/core/common/common_container.dart';
import 'package:milkride/core/constant/app_colors.dart';
import 'package:milkride/core/constant/app_strings.dart';
import 'package:milkride/feature/home/presentation/cubit/home_cubit.dart';

class AppDrawerHeader extends StatelessWidget {
  const AppDrawerHeader({super.key,});
  @override
  Widget build(BuildContext context) {
    final user = context.read<HomeCubit>().userData;
    return Row(
      children: [
        CommonContainer(
                color: AppColors.borderColor,
                widget: Icon(
                  Icons.person,
                  size: 20.sp,
                  color: AppColors.white,
                ).paddingAll(10.sp),
                height: 40.sp,
                width: 40.sp,
                borderRadius: BorderRadius.circular(40.r))
            .paddingOnly(left: 10.w),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppText(
              data: user?.name?.capitalize ?? "user",
              fontSize: 12.sp,
              fontWeight: FontWeight.w600,
            ),
            AppLabel(
              height: 20.h,
              width: 60.w,
              label: user?.isPostpaid == 1
                  ? AppStrings.profilePostpaid
                  : AppStrings.profilePrepaid,
              borderRadius: BorderRadius.circular(5.r),
            ),
          ],
        ).paddingOnly(left: 10.w),
      ],
    );
  }
}
