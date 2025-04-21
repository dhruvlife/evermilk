import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:milkride/core/failure/failure.dart';
import 'package:milkride/core/utils/exeption_handler.dart';
import 'package:milkride/feature/home/data/repository/home_remote_repo.dart';
import 'package:milkride/feature/home/domain/entities/home_response.dart';
import 'package:milkride/feature/home/domain/repository/home_repository.dart';
import 'package:milkride/feature/home/domain/usecase/home_usecase.dart';

class HomeImplRepo implements HomeRepository {
  final HomeRemoteRepo homeRemoteRepo;
  HomeImplRepo({required this.homeRemoteRepo});
  
  @override
  Future<Either<Failure, HomeResponse>> getHomeResponse({required HomeParam homeParam}) async {
    try {
      final homeResponse = await homeRemoteRepo.getHomeResponse(homeParam: homeParam);
      return right(homeResponse);
    } on DioException catch (e) {
      return left(HandleExeption.handleError(error:e));
    }
  }
}