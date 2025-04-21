import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:milkride/core/common/app_network_image.dart';
import 'package:milkride/core/constant/app_colors.dart';
import 'package:milkride/feature/home/domain/entities/header_banner.dart';
import 'package:milkride/feature/home/presentation/cubit/home_cubit.dart';
import 'package:milkride/service.dart/injection.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';

class BannerCards extends StatefulWidget {
  final List<Banners> banners;
  const BannerCards({super.key, required this.banners, });

  @override
  BannerCardsState createState() => BannerCardsState();
}

class BannerCardsState extends State<BannerCards> {
  final homeCubit = getIt<HomeCubit>();
  int _currentIndex = 0;
  CarouselSliderController carouselController = CarouselSliderController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
          carouselController: carouselController,
          itemCount: widget.banners.length,
          options: CarouselOptions(
            height: 120.h,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 3),
            viewportFraction: 1,
            enlargeCenterPage: true,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
          itemBuilder: (context, index, realIndex) {
            final banner = widget.banners[index];
            return AppNetWorkImage(
              image: banner.imageUrl ?? "",
              height: 120.h,
              width: 1.sw,
              fit: BoxFit.fill,
            );
          },
        ).paddingOnly(bottom: 10.h),
        SmoothPageIndicator(
          controller: PageController(initialPage: _currentIndex),
          count: widget.banners.length,
          effect: WormEffect(
            dotHeight: 6.h,
            dotWidth: 6.w,
            dotColor: AppColors.inactiveIconColor,
            activeDotColor: Colors.blue,
          ),
        )
      ],
    );
  }
}
