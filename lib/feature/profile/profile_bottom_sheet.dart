import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:milkride/core/common/app_elevated_button.dart';
import 'package:milkride/core/common/app_text.dart';
import 'package:milkride/core/constant/app_strings.dart';
import 'package:milkride/core/routes/routes_name.dart';
import 'package:milkride/core/storage/storage_object.dart';
import 'package:milkride/feature/home/presentation/cubit/home_cubit.dart';
import 'package:milkride/feature/profile/profile_data_card.dart';
import 'package:milkride/feature/profile/profile_header.dart';
import 'package:milkride/feature/profile/refer_button_card.dart';
import 'package:milkride/service.dart/injection.dart';

class ProfileBottomSheet extends StatelessWidget {
  const ProfileBottomSheet({super.key});
  @override
  Widget build(BuildContext context) {
    final homeCubit = getIt<HomeCubit>();
    final user = homeCubit.userData;
    return SizedBox(
      height: 0.8.sh,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              IconButton(
                  onPressed: () => Get.back(),
                  icon: Icon(Icons.arrow_back, size: 15.sp)),
              AppText(
                  data: AppStrings.profileTitle,
                  fontWeight: FontWeight.w600,
                  fontSize: 14.sp)
            ],
          ),
          ProfileHeader(user: user, config: homeCubit.config)
              .paddingOnly(bottom: 10.h),
          ProfileDataCard(
              title: AppStrings.profileEmail,
              data: user?.email?.isEmpty ?? true
                  ? AppStrings.profileEmailNotFound
                  : user!.email!),
          ReferButtonCard(referCode:  user?.customerReferrerCode).paddingOnly(bottom: 10.h),
          ProfileDataCard(
            title: AppStrings.profileMobile,
            data: user?.mobileNumber?.isEmpty ?? true
                ? AppStrings.profileMobile
                : user!.mobileNumber!,
          ),
          ProfileDataCard(
              title: AppStrings.profileWallet,
              data: user?.wallet?.toString() ?? ""),
          ProfileDataCard(
              title: AppStrings.profileHub,
              data: homeCubit.config?.vendorDisplayName?.toString() ?? ""),
          CustomElevatedButton(
            onPressed: () {
              StorageObject.clearStorage();
              Get.offAllNamed(RoutesName.login);
            },
            child: AppText(data: AppStrings.profileLogout),
          ),
        ],
      ).paddingSymmetric(horizontal: 15.w, vertical: 15.h),
    );
  }
}
