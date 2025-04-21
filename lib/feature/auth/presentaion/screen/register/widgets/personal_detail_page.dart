import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:milkride/core/common/app_elevated_button.dart';
import 'package:milkride/core/common/app_text.dart';
import 'package:milkride/core/common/app_textfield.dart';
import 'package:milkride/core/common/required_lable.dart';
import 'package:milkride/core/constant/app_strings.dart';
import 'package:milkride/core/utils/app_functional_components.dart';
import 'package:milkride/feature/auth/presentaion/screen/register/widgets/gender_option.dart';

class PersonDetailPage extends StatefulWidget {
  final TextEditingController nameController;
  final TextEditingController emailController;
  final VoidCallback onNext;
  final VoidCallback onPrev;
  final ValueChanged<String> onGenderSelected;
  String selectedGender;
  PersonDetailPage(
      {super.key,
      required this.emailController,
      required this.nameController,
      required this.selectedGender,
      required this.onNext,
      required this.onGenderSelected,
      required this.onPrev});
  @override
  State<PersonDetailPage> createState() => _PersonDetailPageState();
}

class _PersonDetailPageState extends State<PersonDetailPage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
        key: formKey,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Center(
            child: AppText(
                data: AppStrings.personDetailTitle,
                fontWeight: FontWeight.w700,
                fontSize: 14.sp),
          ).paddingOnly(bottom: 20.h),
          AppTextField(
            controller: widget.nameController,
            hintText: AppStrings.personNameHint,
            fieldTopText: AppStrings.personNameLable,
            isRequired: true,
          ),
          AppTextField(
            controller: widget.emailController,
            hintText: AppStrings.personEmailHint,
            fieldTopText: AppStrings.personEmailLable,
          ).paddingOnly(bottom: 10.h),
          RequiredLabel(
            text: AppStrings.personGender,
            isRequired: true,
          ).paddingOnly(bottom: 10.h),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            GenderOption(
                icon: Icons.male,
                label: AppStrings.personGenderMale,
                isSelected:
                    widget.selectedGender == AppStrings.personGenderMale,
                onTap: () => selectGender(AppStrings.personGenderMale)),
            GenderOption(
                icon: Icons.female,
                label: AppStrings.personGenderFemale,
                isSelected:
                    widget.selectedGender == AppStrings.personGenderFemale,
                onTap: () => selectGender(AppStrings.personGenderFemale)),
            GenderOption(
                icon: Icons.person,
                label: AppStrings.personGenderOther,
                isSelected:
                    widget.selectedGender == AppStrings.personGenderOther,
                onTap: () => selectGender(AppStrings.personGenderOther))
          ]),
          Spacer(),
          CustomElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      if (widget.selectedGender == "") {
                        AppFunctionalComponents.showSnackBar(
                            message: AppStrings.personSelectGender);
                      } else {
                        widget.onNext();
                      }
                    }
                  },
                  child: AppText(data: AppStrings.nextButtonText))
              .paddingOnly(bottom: 40.h),
        ]));
  }

  void selectGender(String gender) {
    widget.onGenderSelected(gender);
    setState(() {});
  }
}
