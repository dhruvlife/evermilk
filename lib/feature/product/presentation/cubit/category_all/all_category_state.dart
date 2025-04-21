import 'package:equatable/equatable.dart';
import 'package:milkride/feature/product/domain/entities/category_response.dart';

abstract class CategoryState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CategoryInitial extends CategoryState {}
class CategoryLoading extends CategoryState {}

class CategoryLoaded extends CategoryState {
  final CategoryResponse response;
  CategoryLoaded({required this.response});
  @override
  List<Object?> get props => [response];
}

class CategoryError extends CategoryState {
  final String message;
  CategoryError({required this.message});
  @override
  List<Object?> get props => [message];
}
