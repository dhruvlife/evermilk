import 'package:fpdart/fpdart.dart';
import 'package:milkride/core/failure/failure.dart';
import 'package:milkride/core/usecase/usecase.dart';
import 'package:milkride/feature/auth/domain/entity/otp_response.dart';
import 'package:milkride/feature/auth/domain/repository/auth_repository.dart';

class OtpUsecase implements Usecase<OtpResponse, OtpParam> {
   final AuthRepository authRepository;
  OtpUsecase({required this.authRepository});
  @override
  Future<Either<Failure, OtpResponse>> call(OtpParam otpParam) {
    return authRepository.getOtpResponse(otpParam: otpParam);
  }
}

class OtpParam {
  final String mobileNumber;
  final String userId;
  final String otp;
  OtpParam({required this.mobileNumber,required this.otp,required this.userId});
}

