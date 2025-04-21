import 'package:fpdart/fpdart.dart';
import 'package:milkride/core/failure/failure.dart';
import 'package:milkride/core/usecase/usecase.dart';
import 'package:milkride/feature/auth/domain/entity/signin_response.dart';
import 'package:milkride/feature/auth/domain/repository/auth_repository.dart';

class SignInUsecase implements Usecase<SignInResponse, SignInParam> {
   final AuthRepository authRepository;
  SignInUsecase({required this.authRepository});
  @override
  Future<Either<Failure, SignInResponse>> call(SignInParam signInParam) {
    return authRepository.getSignInResponse(signInParam: signInParam);
  }
}

class SignInParam {
  final String mobileNumber;
  SignInParam({required this.mobileNumber});
}
