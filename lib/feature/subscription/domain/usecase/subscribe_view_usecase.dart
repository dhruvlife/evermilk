
import 'package:fpdart/fpdart.dart';
import 'package:milkride/core/failure/failure.dart';
import 'package:milkride/core/usecase/usecase.dart';
import 'package:milkride/feature/subscription/domain/entity/sub_view_response.dart';
import 'package:milkride/feature/subscription/domain/repository/subscription_repository.dart';

class SubscriptionViewUsecase implements Usecase<SubscriptionViewResponse,SubscriptionViewParam>{
  final SubscriptionRepository subscriptionRepository;
  SubscriptionViewUsecase({required this.subscriptionRepository});
  @override
  Future<Either<Failure, SubscriptionViewResponse>> call(SubscriptionViewParam subscriptionViewParam)async {
    return await subscriptionRepository.getSubscribeResponse(subscriptionViewParam: subscriptionViewParam);
  }
}

class SubscriptionViewParam {
  final String customerId;
  final String userId;
  SubscriptionViewParam({
    required this.customerId,
    required this.userId,
  });
}
