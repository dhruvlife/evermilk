import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:milkride/core/common/app_image.dart';
import 'package:milkride/core/common/app_text.dart';
import 'package:milkride/core/common/common_container.dart';
import 'package:milkride/core/constant/app_colors.dart';
import 'package:milkride/core/constant/app_strings.dart';
import 'package:milkride/core/key/app_images.dart';
import 'package:milkride/core/routes/routes_name.dart';
import 'package:milkride/feature/profile/presentation/cubit/profile_cubit.dart';
import 'package:milkride/feature/profile/presentation/screen/widgets/drawer_listtile.dart';
import 'package:milkride/feature/profile/presentation/screen/widgets/drawer_header.dart';
import 'package:milkride/feature/profile/presentation/screen/profile_bottom_sheet.dart';
import 'package:milkride/feature/profile/presentation/screen/widgets/drawer_switch.dart';

class ProfileDrawer extends StatefulWidget {
  final void Function(int)? onNavigateToTab;
  const ProfileDrawer({super.key,required this.onNavigateToTab});
  @override
  State<ProfileDrawer> createState() => _ProfileDrawerState();
}

class _ProfileDrawerState extends State<ProfileDrawer> {
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ProfileCubit>();
    return Drawer(
      backgroundColor: AppColors.whiteShade,
      child: SafeArea(
        child:Column(
                children: [
                  CommonContainer(
                    widget: AppDrawerHeader(),
                    height: 60.h,
                    width: double.infinity).paddingOnly(bottom: 10.h),
                  GestureDetector(
                    child: CommonContainer(
                      widget: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppText(data: AppStrings.vacationMode, fontSize: 12.sp),
                          DrawerSwitch(cubit: cubit)]).paddingSymmetric(horizontal: 10.w),
                      height: 40.h,
                      width: 1.sw,
                    )),
                  DrawerListTile(
                    icon: Icons.person_outline,
                    title: AppStrings.profileTileMyProfile,
                    onTap: () {
                      Get.back();
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(15.r))),
                        builder: (context) => ProfileBottomSheet(),
                      );
                    }),
                  DrawerDivider(),
                  DrawerListTile(icon: Icons.task_outlined,
                    title: AppStrings.profileTilePref,
                    onTap: () {}),
                  DrawerDivider(),
                  DrawerListTile(icon: Icons.shopping_bag_outlined,
                    title: AppStrings.profileTileCart,
                    onTap: ()=> Get.toNamed(RoutesName.cartPage)),
                  DrawerDivider(),
                  DrawerListTile(icon: Icons.done_outline,
                    title: AppStrings.profileTileSubscription,
                    onTap: () {
                      Get.back();
                      widget.onNavigateToTab?.call(3);
                    }),
                  DrawerDivider(),
                  DrawerListTile(icon: Icons.gif_box_outlined,
                    title: AppStrings.profileTileOrder,
                    onTap: () {
                      Get.back();
                      widget.onNavigateToTab?.call(2);
                    }),
                  DrawerDivider(),
                  DrawerListTile(icon: Icons.pages_outlined,
                    title: AppStrings.billingHistory,
                    onTap: () {
                      Get.back();
                      Get.toNamed(RoutesName.billingHistory);
                    }),
                  DrawerDivider(),
                  DrawerListTile(icon: Icons.help_outline,
                    title: AppStrings.profileTileHelp,
                    onTap: () {}),
                  DrawerDivider(),
                  Spacer(),
                  CommonContainer(
                    height: 80.h,
                    width: 80.w,
                    widget: AppImage(image: AppImages.logo, height: 50.h, width: 80.w)).paddingOnly(bottom: 5.h),
                  AppText(
                    data: AppStrings.appVersion,
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w600).paddingOnly(bottom: 20.h)])
      ),
    );
  }
}


