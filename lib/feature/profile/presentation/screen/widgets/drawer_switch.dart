import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:milkride/core/common/app_elevated_button.dart';
import 'package:milkride/core/common/app_text.dart';
import 'package:milkride/core/constant/app_colors.dart';
import 'package:milkride/core/constant/app_strings.dart';
import 'package:milkride/core/utils/app_functional_components.dart';
import 'package:milkride/feature/home/presentation/cubit/home_cubit.dart';
import 'package:milkride/feature/profile/presentation/cubit/profile_cubit.dart';

class DrawerSwitch extends StatelessWidget {
  final ProfileCubit cubit;
  const DrawerSwitch({
    super.key,
    required this.cubit,
  });
  @override
  Widget build(BuildContext context) {
    final vac = context.read<HomeCubit>().homeData?.isVacation == 1 ? true : false;
    return Switch(
      value:vac,
      onChanged: (value) {
        AppFunctionalComponents.showActionDialog(
          context: context,
          title: AppStrings.areYouSure,
          subtitle: "All your orders will ${vac ? AppStrings.resume:AppStrings.pause} once you ${vac ? "enable" : "disable"} vacation mode.",
          titleIcon: Icons.info,
          actions: SizedBox(
            height: 30.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomElevatedButton(
                  onPressed: () => Get.back(),
                  width: 80.w,
                  backgroundColor: AppColors.white,
                  child: AppText(
                    data: AppStrings.cancel,
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.activeIconColor,
                  ),
                ),
                CustomElevatedButton(
                  onPressed: () async {
                    Get.back();
                    Get.back();
                    await cubit.toggleProfileMode(isOn: value);
                    await cubit.getProfileResponse();
                  },
                  width: 80.w,
                  child: AppText(
                    data: AppStrings.yes,
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.white,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
