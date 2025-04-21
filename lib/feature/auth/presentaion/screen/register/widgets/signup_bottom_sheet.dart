import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:milkride/core/common/app_text.dart';
import 'package:milkride/core/constant/app_colors.dart';
import 'package:milkride/core/constant/app_strings.dart';
import 'package:milkride/feature/auth/domain/entity/register_region.dart';
import 'package:milkride/feature/auth/domain/entity/signup_data_response.dart';

class CityBottomSheet extends StatefulWidget {
  final Region selectedCity;
  final SignupDataResponse signupDataResponse;
  final Function(Region) onCitySelected;
  const CityBottomSheet({
    super.key,
    required this.selectedCity,
    required this.signupDataResponse,
    required this.onCitySelected,
  });
  @override
  State<CityBottomSheet> createState() => _CityBottomSheetState();
}
class _CityBottomSheetState extends State<CityBottomSheet> {
  late Region selectedCity;
  @override
  void initState() {
    super.initState();
    selectedCity = widget.selectedCity;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 0.6.sh,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.themeIconColor,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: BoxDecoration(
              color: AppColors.themeBgColor,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
            ),
            height: 50.h,
            width: double.infinity,
            child: Center(
              child: AppText(
                data: AppStrings.addessCityBottomSheetTitle,
                color: AppColors.themeIconColor,
                fontSize: 14.sp,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: widget.signupDataResponse.data!.regions!.length,
              itemBuilder: (context, index) {
                Region city = widget.signupDataResponse.data!.regions![index];
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedCity = city;
                    });
                    widget.onCitySelected(city);
                    Get.back();
                  },
                  child: ListTile(
                    title: AppText(data: city.name!),                    
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
