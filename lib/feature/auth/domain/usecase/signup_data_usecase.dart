import 'package:fpdart/fpdart.dart';
import 'package:milkride/core/failure/failure.dart';
import 'package:milkride/core/usecase/usecase.dart';
import 'package:milkride/feature/auth/domain/entity/signup_data_response.dart';
import 'package:milkride/feature/auth/domain/repository/auth_repository.dart';

class SignupDataUsecase implements Usecase<SignupDataResponse, SignupParam> {
  final AuthRepository authRepository;
  SignupDataUsecase({required this.authRepository});
  @override
  Future<Either<Failure, SignupDataResponse>> call(SignupParam signupDataParam)async {
    return await authRepository.getSignpDetail(signupDataParam: signupDataParam);
  }
}

class SignupParam {
  final String mobileNumber;
  final String userId;
  SignupParam({required this.mobileNumber,required this.userId});
}
