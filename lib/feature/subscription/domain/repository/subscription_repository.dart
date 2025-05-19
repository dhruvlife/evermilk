import 'package:fpdart/fpdart.dart';
import 'package:milkride/core/failure/failure.dart';
import 'package:milkride/feature/cart/domain/entities/common_response.dart';
import 'package:milkride/feature/subscription/domain/entity/sub_view_response.dart';
import 'package:milkride/feature/subscription/domain/usecase/pause_subscription_usecase.dart';
import 'package:milkride/feature/subscription/domain/usecase/resume_subscription_usecase.dart';
import 'package:milkride/feature/subscription/domain/usecase/subscribe_view_usecase.dart';
import 'package:milkride/feature/subscription/domain/usecase/temp_change_usecase.dart';
import 'package:milkride/feature/subscription/domain/usecase/update_quantity_sub_usecase.dart';

abstract interface class SubscriptionRepository {
  Future<Either<Failure, SubscriptionViewResponse>> getSubscribeResponse({required SubscriptionViewParam subscriptionViewParam});
  Future<Either<Failure, CommonResponse>> getTemporaryChangeResponse({required TemporaryChangeParam temporaryChangeParam });
  Future<Either<Failure, CommonResponse>> getPauseSubscriptionResponse({required PauseSubscriptionParam pauseSubscriptionParam});
  Future<Either<Failure, CommonResponse>> getResumeSubscriptionResponse({required ResumeSubscriptionParam resumeSubscriptionParam});
  Future<Either<Failure, CommonResponse>> getUpdateQuantityResponse({required UpdateQuantityParam updateQuantityParam });
  Future<Either<Failure, CommonResponse>> getDeleteSubscriptionResponse({required String subscriptionId});
}





