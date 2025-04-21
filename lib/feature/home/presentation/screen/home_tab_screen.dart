
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:milkride/core/common/common_app_bar.dart';
import 'package:milkride/core/common/network_fail_card.dart';
import 'package:milkride/core/constant/app_strings.dart';
import 'package:milkride/core/routes/routes_name.dart';
import 'package:milkride/core/storage/storage_object.dart';
import 'package:milkride/feature/home/presentation/cubit/home_cubit.dart';
import 'package:milkride/feature/home/presentation/screen/widgets/banner_cards.dart';
import 'package:milkride/feature/home/presentation/screen/widgets/best_seller_section.dart';
import 'package:milkride/feature/home/presentation/screen/widgets/category_section.dart';
import 'package:milkride/feature/home/presentation/screen/widgets/home_load_screen.dart';
import 'package:milkride/feature/home/presentation/screen/widgets/new_arival_section.dart';
import 'package:milkride/feature/home/presentation/screen/widgets/seasonal_section.dart';
import 'package:milkride/service.dart/injection.dart';

class HomeTabScreen extends StatelessWidget {
  const HomeTabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final homeCubit = getIt<HomeCubit>();
    return Scaffold(
      appBar: CommonAppBar(
        title: AppStrings.appName,
        onActionPressed: () {
          StorageObject.clearStorage();
          Get.toNamed(RoutesName.login);
        },
        showAction: true,
      ),
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state is HomeLoading) {
            return HomeLoader();
          } else if (state is HomeLoaded) {
            return ListView(
              children: [
                if (!(homeCubit.homeData?.headerBanners?.isEmpty ?? true))
                  BannerCards(banners: homeCubit.homeData?.headerBanners ?? []),
                CategorySection(categories: homeCubit.categories ?? []),
                if (!(homeCubit.homeData?.middleBanners?.isEmpty ?? true))
                  BannerCards(banners: homeCubit.homeData?.middleBanners ?? []),
                NewArivalSection(newArrivalProds: homeCubit.newArrival ?? []),
                BestSellerSection(bestSellerProds: homeCubit.bestSeller ?? []),
                SeasonalSection(seasonalProds: homeCubit.seasonal ?? []),
                if (!(homeCubit.homeData?.footerBanners?.isEmpty ?? true))
                  BannerCards(banners: homeCubit.homeData?.footerBanners ?? []),
                SizedBox(height: 100.h)
              ],
            ).paddingSymmetric(horizontal: 10.w, vertical: 10.h);
          } else if (state is HomeError) {
            return NetworkFailCard(messege: state.errorMessage);
          }
          return Container();
        },
      ),
    );
  }
}
