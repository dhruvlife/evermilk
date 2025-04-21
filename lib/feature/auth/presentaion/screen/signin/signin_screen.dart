import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:milkride/core/common/app_elevated_button.dart';
import 'package:milkride/core/common/app_text.dart';
import 'package:milkride/core/common/app_textfield.dart';
import 'package:milkride/core/constant/app_strings.dart';
import 'package:milkride/core/key/app_images.dart';
import 'package:milkride/feature/auth/domain/usecase/signin_usecase.dart';
import 'package:milkride/feature/auth/presentaion/cubit/auth/auth_cubit.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController mobileController = TextEditingController();
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    return Scaffold(
      body: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                AppImages.logo,
                width: double.infinity,
                height: 150.h,
                fit: BoxFit.cover,
              ).paddingOnly(bottom: 20.h),
              AppText(
                data: AppStrings.signInTitle,
                fontWeight: FontWeight.w800,
                fontSize: 16,
              ).paddingOnly(bottom: 10.h),
              AppText(
                data: AppStrings.signInSubTitle,
                fontWeight: FontWeight.w600,
                fontSize: 12,
              ).paddingOnly(bottom: 10.h),
              Form(
                key: formKey,
                child: AppTextField(
                  isRequired: true,
                  controller: mobileController,
                  hintText: AppStrings.mobileNum,
                  keyboardType: TextInputType.phone,
                  maxLength: 10,
                ),
              ),
              CustomElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    FocusScope.of(context).unfocus();
                    context.read<AuthCubit>().getSignInResponse(
                        signInParam: SignInParam(
                            mobileNumber: mobileController.text.trim()));
                  }
                },
                child: AppText(
                  data: AppStrings.login,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ).paddingSymmetric(horizontal: 15.w);
        },
      ),
    );
  }
}
