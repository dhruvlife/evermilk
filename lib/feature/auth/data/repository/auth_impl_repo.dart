import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:milkride/core/failure/failure.dart';
import 'package:milkride/core/utils/exeption_handler.dart';
import 'package:milkride/feature/auth/data/repository/auth_remote_repo.dart';
import 'package:milkride/feature/auth/domain/entity/otp_response.dart';
import 'package:milkride/feature/auth/domain/entity/register_region.dart';
import 'package:milkride/feature/auth/domain/entity/register_response.dart';
import 'package:milkride/feature/auth/domain/entity/resend_otp_response.dart';
import 'package:milkride/feature/auth/domain/entity/signin_response.dart';
import 'package:milkride/feature/auth/domain/entity/signup_data_response.dart';
import 'package:milkride/feature/auth/domain/repository/auth_repository.dart';
import 'package:milkride/feature/auth/domain/usecase/otp_usecase.dart';
import 'package:milkride/feature/auth/domain/usecase/register_usecase.dart';
import 'package:milkride/feature/auth/domain/usecase/resend_otp_usecase.dart';
import 'package:milkride/feature/auth/domain/usecase/signin_usecase.dart';
import 'package:milkride/feature/auth/domain/usecase/signup_data_usecase.dart';

class AuthImplRepo implements AuthRepository {
  final AuthRemoteRepo authRemoteRepo;
  AuthImplRepo({required this.authRemoteRepo});
  @override
  Future<Either<Failure, List<Region>>> getAreaRegions({required int regionId}) async {
    try {
      final areaByRegionResponse = await authRemoteRepo.getAreaByRegionResponse(regionId: regionId);
      return right(areaByRegionResponse);
    } on DioException catch (e) {
      return left(HandleExeption.handleError(error: e));
    }
  }

  @override
  Future<Either<Failure, OtpResponse>> getOtpResponse(
      {required OtpParam otpParam}) async {
    try {
      final otpResponse = await authRemoteRepo.getOtpResponse(
        otpParam: OtpParam(
          mobileNumber: otpParam.mobileNumber,
          otp: otpParam.otp,
          userId: otpParam.userId,
        ),
      );
      return right(otpResponse);
    } on DioException catch (e) {
      return left(HandleExeption.handleError(error: e));
    }
  }

  @override
  Future<Either<Failure, RegisterResponse>> getRegisterResponse(
      {required RegisterParam registerParam}) async {
    try {
      final registerResponse = await authRemoteRepo.getRegisterResponse(
          registerParam: registerParam);
      return right(registerResponse);
    } on DioException catch (e) {
      return left(HandleExeption.handleError(error: e));
    }
  }

  @override
  Future<Either<Failure, ResendOtpResponse>> getResendOtpResponse(
      {required ResendOtpParam resendOtpParam}) async {
    try {
      final resendOtpResponse = await authRemoteRepo.getResendOtpResponse(
          resendOtpParam: resendOtpParam);
      return right(resendOtpResponse);
    } on DioException catch (e) {
      return left(HandleExeption.handleError(error: e));
    }
  }

  @override
  Future<Either<Failure, SignInResponse>> getSignInResponse(
      {required SignInParam signInParam}) async {
    try {
      final signInResponse =
          await authRemoteRepo.getSignInResponse(signInParam: signInParam);
      return right(signInResponse);
    } on DioException catch (e) {
      return left(HandleExeption.handleError(error: e));
    }
  }

  @override
  Future<Either<Failure, SignupDataResponse>> getSignpDetail(
      {required SignupParam signupDataParam}) async {
    try {
      final signupDataResponse = await authRemoteRepo.getSignupDataResponse(
          signupDataParam: signupDataParam);
      return right(signupDataResponse);
    } on DioException catch (e) {
      return left(HandleExeption.handleError(error: e));
    }
  }
}
