import 'package:fpdart/fpdart.dart';
import 'package:milkride/core/failure/failure.dart';
import 'package:milkride/core/usecase/usecase.dart';
import 'package:milkride/feature/profile/domain/entities/profile_response.dart';
import 'package:milkride/feature/profile/domain/repository/profile_repository.dart';
import 'package:milkride/feature/subscription/domain/usecase/subscribe_view_usecase.dart';

class ProfileUsecase implements Usecase<ProfileResponse, SubscriptionViewParam> {
  final ProfileRepository profileRepository;
  ProfileUsecase({required this.profileRepository});
  @override
  Future<Either<Failure, ProfileResponse>> call(SubscriptionViewParam subscriptionViewParam) async {
    return await profileRepository.getProfileResponse(subscriptionViewParam: subscriptionViewParam);
  }
}
