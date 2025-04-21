import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:milkride/core/constant/app_strings.dart';
import 'package:milkride/core/failure/failure.dart';
import 'package:milkride/core/routes/routes_name.dart';
import 'package:milkride/core/storage/storage_key.dart';
import 'package:milkride/core/storage/storage_object.dart';
import 'package:milkride/core/utils/app_functional_components.dart';
import 'package:milkride/feature/auth/domain/entity/otp_response.dart';
import 'package:milkride/feature/auth/domain/entity/register_response.dart';
import 'package:milkride/feature/auth/domain/entity/resend_otp_response.dart';
import 'package:milkride/feature/auth/domain/entity/signin_response.dart';
import 'package:milkride/feature/auth/domain/usecase/otp_usecase.dart';
import 'package:milkride/feature/auth/domain/usecase/register_usecase.dart';
import 'package:milkride/feature/auth/domain/usecase/resend_otp_usecase.dart';
import 'package:milkride/feature/auth/domain/usecase/signin_usecase.dart';
import 'package:milkride/feature/auth/domain/usecase/signup_data_usecase.dart';
import 'package:milkride/feature/auth/presentaion/screen/otp/otp_screen.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final SignInUsecase signInUsecase;
  final OtpUsecase otpUsecase;
  final ResendOtpUsecase resendOtpUsecase;
  final RegisterUsecase registerUsecase;
  AuthCubit({
    required this.signInUsecase,
    required this.otpUsecase,
    required this.resendOtpUsecase,
    required this.registerUsecase,
  }) : super(AuthInitial());

  void getSignInResponse({required SignInParam signInParam}) async {
    if (signInParam.mobileNumber.length != 10) {
      AppFunctionalComponents.showSnackBar(
        message: AppStrings.mobileNoLenth,
      );
      return;
    }
  
    Get.context?.loaderOverlay.show();
    final Either<Failure, SignInResponse> result =
        await signInUsecase.call(signInParam);
    result.fold((failure) {
      AppFunctionalComponents.showSnackBar(message: failure.messege);
    }, (signInResponse) {
      if (signInResponse.message == AppStrings.signInResponseSuccess) {
        AppFunctionalComponents.showSnackBar(
            title: signInResponse.data.toString(),
            message: AppStrings.signInResponseSuccess);
        Get.toNamed(RoutesName.otpCheck,
            arguments: OtpArguments(
                mobileNumber: signInParam.mobileNumber,
                userId: signInResponse.userId.toString()));
      } else if (signInResponse.status == AppStrings.signInResponseError) {
        AppFunctionalComponents.showSnackBar(
            message: AppStrings.signInResponseError);
      }
    });
    Get.context?.loaderOverlay.hide();
  }

  void getResendOtpResponse({required ResendOtpParam resendOtpParam}) async {
    Get.context?.loaderOverlay.show();
    final Either<Failure, ResendOtpResponse> result =
        await resendOtpUsecase.call(resendOtpParam);
    result.fold((failure) {
      AppFunctionalComponents.showSnackBar(message: failure.messege);
    }, (resendOtpResponse) {
      if (resendOtpResponse.message == AppStrings.resendResponseSuccess) {
        AppFunctionalComponents.showSnackBar(
            title: resendOtpResponse.data.toString(),
            message: AppStrings.resendResponseSuccess);
      } else if (resendOtpResponse.message == AppStrings.resendResponseError) {
        AppFunctionalComponents.showSnackBar(
            message: AppStrings.resendResponseError);
      }
    });
    Get.context?.loaderOverlay.hide();
  }

  void getOtpResponse({required OtpParam otpParam}) async {
    if (otpParam.otp.length < 4) {
      AppFunctionalComponents.showSnackBar(message: AppStrings.otpLenth);
      return;
    }
    Get.context?.loaderOverlay.show();

    final Either<Failure, OtpResponse> result = await otpUsecase.call(OtpParam(
      otp: otpParam.otp,
      mobileNumber: otpParam.mobileNumber,
      userId: otpParam.userId,
    ));
    result.fold((failure) {
      AppFunctionalComponents.showSnackBar(message: failure.messege);
      Get.context?.loaderOverlay.hide();
    }, (otpResponse) {
      if (otpResponse.message == AppStrings.invalidOtp) {
        AppFunctionalComponents.showSnackBar(message: AppStrings.invalidOtp);
      } else if (otpResponse.message == AppStrings.loginSuccess) {
        StorageObject.saveData( key:StorageKeys.authToken,value:  otpResponse.appToken);
        StorageObject.saveData( key:StorageKeys.mobileNumber,value:  otpParam.mobileNumber);
        StorageObject.saveData( key:StorageKeys.userId,value:  otpParam.userId);
        AppFunctionalComponents.showSnackBar(message: AppStrings.loginSuccess);
        Get.offAllNamed(RoutesName.home);
      } else if (otpResponse.message == AppStrings.notRegistered) {
        Get.offAllNamed(RoutesName.register,arguments: SignupParam
        (mobileNumber: otpParam.mobileNumber, userId: otpParam.userId));
      }
      Get.context?.loaderOverlay.hide();
    });
  }

  void registerUser({required RegisterParam registerParam}) async {
    Get.context?.loaderOverlay.show(); 
    try {
      final Either<Failure, RegisterResponse> result =
          await registerUsecase.call(registerParam);
      result.fold((failure) {
        AppFunctionalComponents.showSnackBar(message: failure.messege);
      }, (registerResponse) {
        if (registerResponse.message == AppStrings.selectedAreaIssue) {
          AppFunctionalComponents.showSnackBar(message: AppStrings.selectedAreaIssue);
        } else if (registerResponse.message == AppStrings.registerAccountCreatedSuccess) {
          StorageObject.saveData(key:StorageKeys.authToken, value: registerResponse.appToken);
          StorageObject.saveData( key:StorageKeys.mobileNumber,value: registerParam.mobileNumber);
          StorageObject.saveData( key:StorageKeys.userId,value: registerParam.userId);
          AppFunctionalComponents.showSnackBar(message: AppStrings.registerAccountCreatedSuccess);
          Get.offAllNamed(RoutesName.home, );
        } else if (registerResponse.message == AppStrings.registerAccountCreatedAlready) {
          StorageObject.saveData(key:  StorageKeys.authToken,value:  registerResponse.appToken);
          StorageObject.saveData( key:StorageKeys.mobileNumber,value: registerParam.mobileNumber);
          StorageObject.saveData( key:StorageKeys.userId,value: registerParam.userId);
          AppFunctionalComponents.showSnackBar(message: AppStrings.registerAccountCreatedAlready);
          Get.offAllNamed(RoutesName.home);
        }
      });
    } catch (e) {
      AppFunctionalComponents.showSnackBar(message: "${AppStrings.unExpectedError}${e.toString()}");
    } finally {
      Get.context?.loaderOverlay.hide();
    }
  }
  
  void checkUserState() async {
    await Future.delayed(const Duration(seconds: 2));
    final String? authToken = await StorageObject.readData(StorageKeys.authToken) ?? "";
    if (authToken == "") {
      Get.offAllNamed(RoutesName.login);
    } else {
      Get.offNamed(RoutesName.home);
    }
  }

  void resetState() {
    emit(AuthInitial());
  }
}
