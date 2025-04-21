import 'package:fpdart/fpdart.dart';
import 'package:milkride/core/failure/failure.dart';
import 'package:milkride/core/usecase/usecase.dart';
import 'package:milkride/feature/auth/domain/entity/resend_otp_response.dart';
import 'package:milkride/feature/auth/domain/repository/auth_repository.dart';

class ResendOtpUsecase implements Usecase<ResendOtpResponse, ResendOtpParam> {
   final AuthRepository authRepository;
  ResendOtpUsecase({required this.authRepository});
  @override
  Future<Either<Failure, ResendOtpResponse>> call(ResendOtpParam resendOtpParam) {
    return authRepository.getResendOtpResponse(resendOtpParam: resendOtpParam);
  }
}

class ResendOtpParam {
  final String mobileNumber;
  final String userId;
  ResendOtpParam({required this.mobileNumber,required this.userId});
}
