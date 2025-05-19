import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:milkride/core/common/app_elevated_button.dart';
import 'package:milkride/core/common/app_label.dart';
import 'package:milkride/core/common/app_text.dart';
import 'package:milkride/core/common/common_app_bar.dart';
import 'package:milkride/core/common/common_container.dart';
import 'package:milkride/core/common/network_fail_card.dart';
import 'package:milkride/core/constant/app_colors.dart';
import 'package:milkride/core/constant/app_strings.dart';
import 'package:milkride/core/routes/routes_name.dart';
import 'package:milkride/core/storage/storage_object.dart';
import 'package:milkride/core/utils/app_functional_components.dart';
import 'package:milkride/feature/home/presentation/cubit/home_cubit.dart';
import 'package:milkride/feature/home/presentation/screen/widgets/banner_cards.dart';
import 'package:milkride/feature/home/presentation/screen/widgets/best_seller_section.dart';
import 'package:milkride/feature/home/presentation/screen/widgets/category_section.dart';
import 'package:milkride/feature/home/presentation/screen/widgets/home_load_screen.dart';
import 'package:milkride/feature/home/presentation/screen/widgets/new_arival_section.dart';
import 'package:milkride/feature/home/presentation/screen/widgets/seasonal_section.dart';
import 'package:milkride/feature/profile/presentation/cubit/profile_cubit.dart';

class HomeScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState>? scaffoldKey;
  const HomeScreen({super.key, this.scaffoldKey});
  @override
  Widget build(BuildContext context) {
    final homeCubit = context.read<HomeCubit>();
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: CommonAppBar(
              title: AppStrings.appName,
              isActionWidget: true,
              action: GestureDetector(
                  onTap: () => Get.toNamed(RoutesName.wallet),
                  child: SizedBox(
                      width: 55.w,
                      child: Stack(alignment: Alignment.topRight, children: [
                        Icon(Icons.wallet_outlined,size: 25.sp, color: AppColors.optionButtonShade),
                        if (homeCubit.userData?.wallet != null)
                          Positioned(top: 1.h,right: 1.w,
                              child: AppLabel(
                                  label: "₹ ${homeCubit.userData?.wallet.toString().substring(0, homeCubit.userData?.wallet.length - 3)}",
                                  labelSize: 6.sp,
                                  labelFontWeight: FontWeight.w600,
                                  height: 12.h,
                                  width: 35.w,
                                  borderRadius: BorderRadius.circular(10.r)))
                      ]))),
              onIconPressed: () {
                if (homeCubit.userData?.id != null) {
                  scaffoldKey?.currentState?.openDrawer();
                } else {
                  AppFunctionalComponents.showActionDialog(
                      context: context,
                      title: AppStrings.logOutTitle,
                      subtitle: "",
                      titleIcon: Icons.logout,
                      actions: SizedBox(
                        height: 100.h,
                        child: Center(child: CustomElevatedButton(
                          onPressed: (){
                            StorageObject.clearStorage();
                            Get.toNamed(RoutesName.login);
                          },
                          width: 100.w,
                          child: AppText(data: AppStrings.logOut,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600,
                              color: AppColors.white)))));
                }
              })),
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state is HomeLoading) {
            return const HomeLoader();
          } else if (state is HomeError) {
            return NetworkFailCard(
                messege: state.errorMessage,
                isButtonRequired: true,
                onButtontap: homeCubit.fetchUserDeviceData,
                buttonText: AppStrings.retry);
          } else if (state is HomeLoaded) {
            final homeData = homeCubit.homeData;
            return RefreshIndicator(
              backgroundColor: AppColors.success,
              color: AppColors.white,
              onRefresh: homeCubit.fetchUserDeviceData,
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                children: [
                  if (homeData?.isVacation == 1)
                    CommonContainer(
                            borderRadius: BorderRadius.circular(10.r),
                            widget: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(children: [
                                  Icon(Icons.notifications_active,size: 15.sp, color: AppColors.warning).paddingOnly(right: 5.w),
                                  AppText(data: AppStrings.vacNotify,
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.w500)]),
                                IconButton(
                                    onPressed: () {
                                      final cubit = context.read<ProfileCubit>();
                                      final isVac =cubit.profile?.isVacation == 1? true: false;
                                      AppFunctionalComponents.showActionDialog(
                                        context: context,
                                        title: AppStrings.areYouSure,
                                        subtitle:
                                            "All your orders will ${isVac ? AppStrings.pause : AppStrings.resume} once you ${isVac ? "enable" : "disable"} vacation mode.",
                                        titleIcon: Icons.info,
                                        actions: SizedBox(
                                          height: 30.h,
                                          child: Row(mainAxisAlignment:MainAxisAlignment.spaceEvenly,
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
                                                  await cubit.toggleProfileMode( isOn: false);
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
                                    icon: Icon(Icons.edit,size: 15.sp,color: AppColors.activeIconColor))
                              ],
                            ).paddingSymmetric(horizontal: 15.w),
                            height: 40.h,
                            width: 1.sw,
                            color: AppColors.whiteShade).paddingSymmetric(horizontal: 15.w),
                  if (homeData?.headerBanners?.isNotEmpty ?? false)
                  BannerCards(banners: homeData?.headerBanners ?? []).paddingOnly(top: 10.h),
                  CategorySection(categories: homeCubit.categories ?? []),
                  if (homeData?.middleBanners?.isNotEmpty ?? false)
                  BannerCards(banners: homeData?.middleBanners ?? []),
                  NewArivalSection(newArrivalProds: homeCubit.newArrival ?? []),
                  BestSellerSection(bestSellerProds: homeCubit.bestSeller ?? []),
                  SeasonalSection(seasonalProds: homeCubit.seasonal ?? []),
                  if (homeData?.footerBanners?.isNotEmpty ?? false)
                  BannerCards(banners: homeData?.footerBanners ?? []),
                  SizedBox(height: 100.h),
                ],
              ),
            );
          }
          return SizedBox.shrink();
        },
      ),
    );
  }
}
