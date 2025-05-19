import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:milkride/core/common/app_elevated_button.dart';
import 'package:milkride/core/common/app_text.dart';
import 'package:milkride/core/common/network_fail_card.dart';
import 'package:milkride/core/constant/app_colors.dart';
import 'package:milkride/core/constant/app_strings.dart';
import 'package:milkride/core/routes/routes_name.dart';
import 'package:milkride/core/storage/storage_object.dart';
import 'package:milkride/feature/profile/presentation/cubit/profile_cubit.dart';
import 'package:milkride/feature/profile/presentation/screen/widgets/profile_data_card.dart';
import 'package:milkride/feature/profile/presentation/screen/widgets/profile_header.dart';
import 'package:milkride/feature/profile/presentation/screen/widgets/profile_loader.dart';
import 'package:milkride/feature/profile/presentation/screen/widgets/refer_button_card.dart';

class ProfileBottomSheet extends StatefulWidget {
  const ProfileBottomSheet({super.key});
  @override
  State<ProfileBottomSheet> createState() => _ProfileBottomSheetState();
}

class _ProfileBottomSheetState extends State<ProfileBottomSheet> {
  @override
  void initState() {
    super.initState();
    context.read<ProfileCubit>().getProfileResponse();
  }
  
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        if(state is ProfileLoading){
          return ProfileLoader();
        } else if(state is ProfileError){
          return NetworkFailCard(messege: state.messege, isButtonRequired: true,buttonText: AppStrings.retry,onButtontap: () => context.read<ProfileCubit>().getProfileResponse());
        } else if (state is ProfileLoaded){
          final user = state.profile;
          return SizedBox(
          height: 0.8.sh,
          width: double.infinity,
          child: ListView(
            children: [
              Row(
                children: [
                  IconButton(
                      onPressed: () => Get.back(),
                      icon: Icon(Icons.arrow_back, size: 15.sp)),
                  AppText(
                      data: AppStrings.profileTitle,
                      fontWeight: FontWeight.w600,
                      fontSize: 14.sp)]),
              ProfileHeader(user: user).paddingOnly(bottom: 10.h),
              ProfileDataCard(
                  title: AppStrings.profileEmail,
                  data: user.email?.isEmpty ?? true
                      ? AppStrings.profileEmailNotFound
                      : user.email ?? ""),
              ReferButtonCard(referCode:  user.customerReferrerCode).paddingOnly(bottom: 10.h),
              ProfileDataCard(
                title: AppStrings.profileMobile,
                data: user.mobileNumber?.isEmpty ?? true
                    ? AppStrings.profileMobile
                    : user.mobileNumber ??"",
              ),
              ProfileDataCard(
                title: AppStrings.profileAddress,
                data: user.address ?? ""
              ),
              ProfileDataCard(
                  title: AppStrings.profileArea,
                  data:user.area ?? ""),
              ProfileDataCard(
                  title: AppStrings.profileWallet,
                  data: user.latestWallet.toString()),
              ProfileDataCard(
                  title: AppStrings.profileAmount,
                  data:user.creditLimit ?? ""),
              ProfileDataCard(
                  title: AppStrings.profileHub,
                  data: AppStrings.appName),
              ProfileDataCard(
                  title: AppStrings.profileDelivery,
                  data: user.deliveryBoyName?.capitalize ?? ""),  
              CustomElevatedButton(
                onPressed: () {
                  StorageObject.clearStorage();
                  Get.offAllNamed(RoutesName.login);
                },
                child: AppText(data: AppStrings.profileLogout,color: AppColors.white),
              ),
            ],
          ).paddingSymmetric(horizontal: 15.w, vertical: 15.h),
        );
        }
        return SizedBox();
      },
    );
  }
}

