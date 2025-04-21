import 'package:fpdart/fpdart.dart';
import 'package:milkride/core/failure/failure.dart';
import 'package:milkride/feature/auth/domain/entity/otp_response.dart';
import 'package:milkride/feature/auth/domain/entity/register_region.dart';
import 'package:milkride/feature/auth/domain/entity/register_response.dart';
import 'package:milkride/feature/auth/domain/entity/signup_data_response.dart';
import 'package:milkride/feature/auth/domain/entity/resend_otp_response.dart';
import 'package:milkride/feature/auth/domain/entity/signin_response.dart';
import 'package:milkride/feature/auth/domain/usecase/otp_usecase.dart';
import 'package:milkride/feature/auth/domain/usecase/register_usecase.dart';
import 'package:milkride/feature/auth/domain/usecase/resend_otp_usecase.dart';
import 'package:milkride/feature/auth/domain/usecase/signin_usecase.dart';
import 'package:milkride/feature/auth/domain/usecase/signup_data_usecase.dart';

abstract interface class AuthRepository {
  Future<Either<Failure, SignInResponse>> getSignInResponse({required SignInParam signInParam});
  Future<Either<Failure, OtpResponse>> getOtpResponse({required OtpParam otpParam});
  Future<Either<Failure, ResendOtpResponse>> getResendOtpResponse({required ResendOtpParam resendOtpParam});
  Future<Either<Failure, RegisterResponse>> getRegisterResponse({required RegisterParam registerParam});
  Future<Either<Failure, SignupDataResponse>> getSignpDetail({required SignupParam signupDataParam});
  Future<Either<Failure, List<Region>>> getAreaRegions({required int regionId});
}

