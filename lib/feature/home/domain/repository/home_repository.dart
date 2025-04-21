import 'package:fpdart/fpdart.dart';
import 'package:milkride/core/failure/failure.dart';
import 'package:milkride/feature/home/domain/entities/home_response.dart';
import 'package:milkride/feature/home/domain/usecase/home_usecase.dart';

abstract interface class HomeRepository{
  Future<Either<Failure,HomeResponse>> getHomeResponse({required HomeParam homeParam});
}