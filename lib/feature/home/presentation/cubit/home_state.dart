part of 'home_cubit.dart';

abstract class HomeState extends Equatable {
  @override
  List<Object?> get props => [];
}

class HomeInitial extends HomeState {}
class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final HomeResponse homeResponse;
  HomeLoaded({required this.homeResponse});
  @override
  List<Object?> get props => [homeResponse];
}

class HomeError extends HomeState {
  final String errorMessage;
  HomeError({required this.errorMessage});
  @override
  List<Object?> get props => [errorMessage];
}
