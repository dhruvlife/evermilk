
import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:milkride/core/failure/failure.dart';
import 'package:milkride/core/utils/exeption_handler.dart';
import 'package:milkride/feature/cart/domain/entities/common_response.dart';
import 'package:milkride/feature/subscription/data/repository/subscription_remote_repo.dart';
import 'package:milkride/feature/subscription/domain/entity/sub_view_response.dart';
import 'package:milkride/feature/subscription/domain/repository/subscription_repository.dart';
import 'package:milkride/feature/subscription/domain/usecase/pause_subscription_usecase.dart';
import 'package:milkride/feature/subscription/domain/usecase/resume_subscription_usecase.dart';
import 'package:milkride/feature/subscription/domain/usecase/subscribe_view_usecase.dart';
import 'package:milkride/feature/subscription/domain/usecase/temp_change_usecase.dart';
import 'package:milkride/feature/subscription/domain/usecase/update_quantity_sub_usecase.dart';

class SubscribeImplRepo implements SubscriptionRepository  {
  final SubscriptionRemoteRepo subscriptionRemoteRepo;
  SubscribeImplRepo({required this.subscriptionRemoteRepo});

  @override
  Future<Either<Failure, CommonResponse>> getDeleteSubscriptionResponse({required String subscriptionId}) async {
    try {
      final deleteSubscriptionResponse = await subscriptionRemoteRepo.getDeleteSubscriptionResponse(subscriptionId: subscriptionId);
      return right(deleteSubscriptionResponse);
    } on DioException catch (e) {
      return left(HandleExeption.handleError(error:e));
    }
  }

  @override
  Future<Either<Failure, CommonResponse>> getPauseSubscriptionResponse({required PauseSubscriptionParam pauseSubscriptionParam}) async {
    try {
      final pauseSubscriptionResponse = await subscriptionRemoteRepo.getPauseSubscriptionResponse(pauseSubscriptionParam: pauseSubscriptionParam);
      return right(pauseSubscriptionResponse);
    } on DioException catch (e) {
      return left(HandleExeption.handleError(error:e));
    }
  }

  @override
  Future<Either<Failure, CommonResponse>> getResumeSubscriptionResponse({required ResumeSubscriptionParam resumeSubscriptionParam}) async {
    try {
      final resumeSubscriptionResponse = await subscriptionRemoteRepo.getResumeSubscriptionResponse(resumeSubscriptionParam: resumeSubscriptionParam);
      return right(resumeSubscriptionResponse);
    } on DioException catch (e) {
      return left(HandleExeption.handleError(error:e));
    }
  }

  @override
  Future<Either<Failure, SubscriptionViewResponse>> getSubscribeResponse({required SubscriptionViewParam subscriptionViewParam}) async {
    try {
      final subscribeResponse = await subscriptionRemoteRepo.getSubscribeResponse(subscriptionViewParam: subscriptionViewParam);
      return right(subscribeResponse);
    } on DioException catch (e) {
      return left(HandleExeption.handleError(error:e));
    }
  }

  @override
  Future<Either<Failure, CommonResponse>> getTemporaryChangeResponse({required TemporaryChangeParam temporaryChangeParam}) async {
    try {
      final temporaryChangeResponse = await subscriptionRemoteRepo.getTemporaryChangeResponse(temporaryChangeParam: temporaryChangeParam);
      return right(temporaryChangeResponse);
    } on DioException catch (e) {
      return left(HandleExeption.handleError(error:e));
    }
  }

  @override
  Future<Either<Failure, CommonResponse>> getUpdateQuantityResponse({required UpdateQuantityParam updateQuantityParam}) async {
    try {
      final updateQuantityResponse = await subscriptionRemoteRepo.getUpdateQuantityResponse(updateQuantityParam: updateQuantityParam);
      return right(updateQuantityResponse);
    } on DioException catch (e) {
      return left(HandleExeption.handleError(error:e));
    }
  }
}