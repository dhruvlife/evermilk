import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:milkride/core/common/app_elevated_button.dart';
import 'package:milkride/core/common/app_text.dart';
import 'package:milkride/core/common/app_textfield.dart';
import 'package:milkride/core/constant/app_strings.dart';
import 'package:milkride/core/utils/app_functional_components.dart';
import 'package:milkride/feature/auth/domain/entity/register_region.dart';
import 'package:milkride/feature/auth/domain/entity/signup_data_response.dart';
import 'package:milkride/feature/auth/presentaion/screen/register/widgets/area_bottom_sheet.dart';
import 'package:milkride/feature/auth/presentaion/screen/register/widgets/signup_bottom_sheet.dart';

class AddressDetailPage extends StatefulWidget {
  final SignupDataResponse signupDataResponse;
  final TextEditingController houseNoController;
  final TextEditingController floorController;
  final TextEditingController societyController;
  final TextEditingController landmarkController;
  final TextEditingController pincodeController;
  final VoidCallback onNext;
  final ValueChanged<Region> onCityChanged;
  final ValueChanged<Region> onAreaChanged;
  Region city;
  Region area;

  AddressDetailPage(
      {super.key,
      required this.onNext,
      required this.signupDataResponse,
      required this.houseNoController,
      required this.floorController,
      required this.societyController,
      required this.landmarkController,
      required this.pincodeController,
      required this.onCityChanged,
      required this.onAreaChanged,
      required this.city,
      required this.area});

  @override
  State<AddressDetailPage> createState() => _AddressDetailPageState();
}

class _AddressDetailPageState extends State<AddressDetailPage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: formKey,
        child: ListView(children: [
          Center(
                  child: AppText(
                      data: AppStrings.addessTitle,
                      fontWeight: FontWeight.w700,
                      fontSize: 14.sp))
              .paddingOnly(bottom: 20.h),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            SizedBox(
                width: 0.4.sw,
                child: AppTextField(
                    controller: widget.houseNoController,
                    hintText: AppStrings.addessHouseHint,
                    fieldTopText: AppStrings.addessHouselabel,
                    isRequired: true)),
            SizedBox(
                width: 0.4.sw,
                child: AppTextField(
                    controller: widget.floorController,
                    hintText: AppStrings.addessFloorHint,
                    fieldTopText: AppStrings.addessFloorlabel))
          ]).paddingOnly(bottom: 10.h),
          AppTextField(
            controller: widget.societyController,
            hintText: AppStrings.addessSocietyHint,
            fieldTopText: AppStrings.addessSocietylabel,
            isRequired: true,
          ),
          AppTextField(
              controller: widget.landmarkController,
              hintText: AppStrings.addessLandmarkHint,
              fieldTopText: AppStrings.addessLandmarklabel,
              isRequired: true),
          AppTextField(
              controller: TextEditingController(text: widget.city.name ?? ""),
              hintText: widget.city.name ?? AppStrings.addessCityHint,
              fieldTopText: AppStrings.addessCitylabel,
              isRequired: true,
              isReadonly: true,
              ontap: () {
                Get.bottomSheet(
                    isScrollControlled: true,
                    CityBottomSheet(
                        signupDataResponse: widget.signupDataResponse,
                        selectedCity: widget.city,
                        onCitySelected: (Region selectedCity) {
                          widget.onCityChanged(selectedCity);
                          setState(() {});
                        }));
              }),
          AppTextField(
              controller: TextEditingController(text: widget.area.name ?? ""),
              hintText: widget.area.name ?? AppStrings.addessAreaHint,
              fieldTopText: AppStrings.addessArealabel,
              isRequired: true,
              isReadonly: true,
              ontap: () {
                if (widget.city.name?.isEmpty ?? true) {
                  AppFunctionalComponents.showSnackBar(
                      message: AppStrings.addessPickCityFirst);
                } else {
                  Get.bottomSheet(
                      AreaBottomSheet(
                          id: widget.city.id!,
                          selectedArea: widget.area,
                          onAreaSelected: (Region selectedArea) {
                            widget.onAreaChanged(selectedArea);
                            setState(() {});
                            Get.back();
                          }),
                      isScrollControlled: true);
                }
              }),
          AppTextField(
              controller: widget.pincodeController,
              hintText: AppStrings.addessPinCodeHint,
              fieldTopText: AppStrings.addessPinCodelabel,
              keyboardType: TextInputType.number,
              maxLength: 6,
              isRequired: true),
          CustomElevatedButton(
                  width: 0.4.sw,
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      widget.onNext();
                    }
                  },
                  child: AppText(data: AppStrings.nextButtonText))
              .paddingOnly(bottom: 40.h),
        ]));
  }
}
