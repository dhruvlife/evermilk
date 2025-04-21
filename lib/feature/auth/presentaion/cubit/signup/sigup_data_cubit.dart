import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:milkride/core/failure/failure.dart';
import 'package:milkride/core/utils/app_functional_components.dart';
import 'package:milkride/feature/auth/domain/entity/signup_data_response.dart';
import 'package:milkride/feature/auth/domain/usecase/signup_data_usecase.dart';
part 'sigup_data_state.dart';

class SignupDataCubit extends Cubit<SigupDataState> {
  final SignupDataUsecase signupDataUsecase;
  SignupDataCubit({required this.signupDataUsecase})
      : super(SigupDataInitial());

  void getSignupDetail({required SignupParam signupParam}) async {
    emit(SignupDataLoading());
    final Either<Failure, SignupDataResponse> result =
        await signupDataUsecase.call(SignupParam(
      mobileNumber: signupParam.mobileNumber,
      userId: signupParam.userId,
    ));
    result.fold((failure) {
      AppFunctionalComponents.showSnackBar(message: failure.messege);
      emit(SignupDataError(failure.messege));
    }, (signupDataResponse) {
      emit(SignupDataLoaded(signupDataResponse: signupDataResponse));
    });
  }
}
