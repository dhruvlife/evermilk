import 'package:fpdart/fpdart.dart';
import 'package:milkride/core/failure/failure.dart';
import 'package:milkride/feature/cart/domain/entities/common_response.dart';
import 'package:milkride/feature/profile/domain/entities/profile_response.dart';
import 'package:milkride/feature/profile/domain/usecase/vacation_usecase.dart';
import 'package:milkride/feature/subscription/domain/usecase/subscribe_view_usecase.dart';


abstract interface class ProfileRepository {
  Future<Either<Failure, CommonResponse>> getVacationResponse({required VacationParam vacationParam});
  Future<Either<Failure, ProfileResponse>> getProfileResponse({required SubscriptionViewParam subscriptionViewParam});
}

