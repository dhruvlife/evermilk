import 'package:dio/dio.dart';
import 'package:fpdart/src/either.dart';
import 'package:milkride/core/failure/failure.dart';
import 'package:milkride/core/utils/exeption_handler.dart';
import 'package:milkride/feature/cart/domain/entities/common_response.dart';
import 'package:milkride/feature/profile/data/repository/profile_remote_repo.dart';
import 'package:milkride/feature/profile/domain/entities/profile_response.dart';
import 'package:milkride/feature/profile/domain/repository/profile_repository.dart';
import 'package:milkride/feature/profile/domain/usecase/vacation_usecase.dart';
import 'package:milkride/feature/subscription/domain/usecase/subscribe_view_usecase.dart';

class ProfileImplRepo implements ProfileRepository {
  final ProfileRemoteRepository profileRemoteRepository;
  ProfileImplRepo({required this.profileRemoteRepository});

  @override
  Future<Either<Failure, CommonResponse>> getVacationResponse({required VacationParam vacationParam}) async {
    try {
      final vacationResponse = await profileRemoteRepository.getVacationResponse(vacationParam: vacationParam);
      return right(vacationResponse);
    } on DioException catch (e) {
      return left(HandleExeption.handleError(error:e));
    }
  }

  @override
  Future<Either<Failure, ProfileResponse>> getProfileResponse({required SubscriptionViewParam subscriptionViewParam}) async {
    try {
      final profileResponse = await profileRemoteRepository.getProfileResponse(subscriptionViewParam: subscriptionViewParam);
      return right(profileResponse);
    } on DioException catch (e) {
      return left(HandleExeption.handleError(error:e));
    }
  }
}