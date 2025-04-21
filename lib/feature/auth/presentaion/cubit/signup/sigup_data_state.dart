part of 'sigup_data_cubit.dart';

abstract class SigupDataState extends Equatable {
  const SigupDataState();

  @override
  List<Object> get props => [];
}

class SigupDataInitial extends SigupDataState {}
class SignupDataLoading extends SigupDataState{}

class SignupDataLoaded extends SigupDataState {
  final SignupDataResponse signupDataResponse;
  const SignupDataLoaded({required this.signupDataResponse});
  @override
  List<Object> get props => [signupDataResponse];
}

class SignupDataError extends SigupDataState {
  final String message;
  const SignupDataError(this.message);
  @override
  List<Object> get props => [message];
}
