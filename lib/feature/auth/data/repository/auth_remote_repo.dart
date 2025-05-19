import 'package:milkride/core/constant/app_strings.dart';
import 'package:milkride/feature/auth/data/model/otp_model.dart';
import 'package:milkride/feature/auth/data/model/register_model.dart';
import 'package:milkride/feature/auth/data/model/resend_otp_model.dart';
import 'package:milkride/feature/auth/data/model/signin_model.dart';
import 'package:milkride/feature/auth/data/model/signup_data_model.dart';
import 'package:milkride/feature/auth/domain/entity/register_region.dart';
import 'package:milkride/feature/auth/domain/usecase/otp_usecase.dart';
import 'package:milkride/feature/auth/domain/usecase/register_usecase.dart';
import 'package:milkride/feature/auth/domain/usecase/resend_otp_usecase.dart';
import 'package:milkride/feature/auth/domain/usecase/signin_usecase.dart';
import 'package:milkride/feature/auth/domain/usecase/signup_data_usecase.dart';
import 'package:milkride/service/api_service.dart';

abstract interface class AuthRemoteRepo {
  Future<OtpVerifyModel> getOtpResponse({required OtpParam otpParam});
  Future<List<Region>> getAreaByRegionResponse({required int regionId});
  Future<RegisterModel> getRegisterResponse({required RegisterParam registerParam});
  Future<ResendOtpModel> getResendOtpResponse({required ResendOtpParam resendOtpParam});
  Future<SignInModel> getSignInResponse({required SignInParam signInParam});
  Future<SignupDataModel> getSignupDataResponse({required SignupParam signupDataParam});
}

class AuthImplRemoteRepo implements AuthRemoteRepo {
  final ApiService apiService;
  AuthImplRemoteRepo({required this.apiService});
  @override
  Future<OtpVerifyModel> getOtpResponse({required OtpParam otpParam}) {
    return apiService.getOtpResponse(
        mobileNumber: otpParam.mobileNumber,
        userId: otpParam.userId,
        otp: otpParam.otp,
      );
  }

  @override
  Future<List<Region>> getAreaByRegionResponse({required int regionId}) {
    return apiService.getAreasByRegion(regionId:regionId);
  }

  @override
  Future<RegisterModel> getRegisterResponse({required RegisterParam registerParam}) async {
    return await apiService.getRegisterResponse(
      name: registerParam.name,
      email: registerParam.email ?? "",
      sourceId: registerParam.sourceId ?? "",
      areaId: registerParam.areaId,
      houseNo: registerParam.houseNo,
      floor: registerParam.floor ?? "",
      society: registerParam.society,
      landmark: registerParam.landmark,
      latitude: registerParam.latitude,
      longitude: registerParam.longitude,
      pincode: registerParam.pincode,
      regionId: registerParam.regionId,
      userId: registerParam.userId,
      customerReferrerCode: registerParam.customerReferrerCode ?? "",
      agentCode: registerParam.agentCode ?? "",
      deliveryType: registerParam.agentCode ?? "",
      gender: registerParam.gender,
      mobileNumber: registerParam.mobileNumber,
    );
  }

  @override
  Future<ResendOtpModel> getResendOtpResponse({required ResendOtpParam resendOtpParam}) async {
    return await apiService.getResendOtpResponse(mobileNumber:resendOtpParam.mobileNumber,userId: resendOtpParam.userId);
  }

  @override
  Future<SignInModel> getSignInResponse({required SignInParam signInParam}) async {
    return apiService.signIn(mobileNumber: signInParam.mobileNumber,userId: AppStrings.appPointId);
  }

  @override
  Future<SignupDataModel> getSignupDataResponse({required SignupParam signupDataParam}) async {
    return apiService.signUpData(
        mobileNumber: signupDataParam.mobileNumber,
        userId: signupDataParam.userId,
    );
  }
}
