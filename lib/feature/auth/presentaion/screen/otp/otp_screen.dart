import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:milkride/core/common/app_elevated_button.dart';
import 'package:milkride/core/common/app_text.dart';
import 'package:milkride/core/constant/app_colors.dart';
import 'package:milkride/core/constant/app_strings.dart';
import 'package:milkride/feature/auth/domain/usecase/otp_usecase.dart';
import 'package:milkride/feature/auth/presentaion/cubit/auth/auth_cubit.dart';
import 'package:milkride/feature/auth/presentaion/screen/otp/widget/pinput.dart';
import 'package:milkride/feature/auth/presentaion/screen/resend/resend_otp_screen.dart';

class OtpCheckScreen extends StatelessWidget {
  final OtpArguments otpArguments;
  const OtpCheckScreen({super.key, required this.otpArguments});

  @override
  Widget build(BuildContext context) {
    final TextEditingController otpController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppText(
                  data: AppStrings.otpButtonText,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ).paddingOnly(bottom: 5.h),
                AppText(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                  data: "${AppStrings.otpShared}${otpArguments.mobileNumber}",
                ),
                OtpPut(
                  otpController: otpController,
                ).paddingSymmetric(vertical: 40.h),
                CustomElevatedButton(
                        onPressed: () => context
                            .read<AuthCubit>()
                            .getOtpResponse(
                                otpParam: OtpParam(
                                    otp: otpController.text.trim(),
                                    mobileNumber: otpArguments.mobileNumber,
                                    userId: otpArguments.userId)),
                        child: AppText(
                            data: AppStrings.otpVerifyButtonText,
                            color: AppColors.white,
                            fontWeight: FontWeight.w500))
                    .paddingOnly(bottom: 10.h),
                ResendOtpWidget(
                  mobileNumber: otpArguments.mobileNumber,
                  userId: otpArguments.userId,
                )
              ]).paddingAll(16.sp);
        },
      ),
    );
  }
}

class OtpArguments {
  final String mobileNumber;
  final String userId;
  OtpArguments({
    required this.mobileNumber,
    required this.userId,
  });
}
