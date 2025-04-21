part of 'area_cubit.dart';

abstract class AreaState extends Equatable {
  const AreaState();
  @override
  List<Object> get props => [];
}

class AreaInitial extends AreaState {}
class AreaLoading extends AreaState {}

class AreaLoaded extends AreaState {
  final List<Region> area;
  const AreaLoaded({required this.area});
  @override
  List<Object> get props => [area];
}

class AreaError extends AreaState {
  final String message;
  const AreaError(this.message);
  @override
  List<Object> get props => [message];
}
