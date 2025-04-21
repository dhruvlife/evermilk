import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:milkride/core/common/app_elevated_button.dart';
import 'package:milkride/core/common/app_text.dart';
import 'package:milkride/core/constant/app_strings.dart';
import 'package:milkride/feature/auth/domain/usecase/resend_otp_usecase.dart';
import 'package:milkride/feature/auth/presentaion/cubit/auth/auth_cubit.dart';

class ResendOtpWidget extends StatelessWidget {
  final String mobileNumber;
  final String userId;

  const ResendOtpWidget({
    super.key,
    required this.mobileNumber,
    required this.userId,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        return CustomElevatedButton(
          onPressed: () {
            FocusScope.of(context).unfocus();
            context.read<AuthCubit>().getResendOtpResponse(
                  resendOtpParam: ResendOtpParam(
                    mobileNumber: mobileNumber,
                    userId: userId,
                  ),
                );
          },
          child: AppText(
            data: AppStrings.resendOtpButtonText,
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        );
      },
    );
  }
}
