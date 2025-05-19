import 'package:fpdart/fpdart.dart';
import 'package:milkride/core/failure/failure.dart';
import 'package:milkride/core/usecase/usecase.dart';
import 'package:milkride/feature/cart/domain/entities/common_response.dart';
import 'package:milkride/feature/subscription/domain/repository/subscription_repository.dart';

class PauseSubscriptionUsecase implements Usecase<CommonResponse,PauseSubscriptionParam>{
  final SubscriptionRepository subscriptionRepository;
  PauseSubscriptionUsecase({required this.subscriptionRepository});
  @override
  Future<Either<Failure,CommonResponse>> call(PauseSubscriptionParam pauseSubscriptionParam)async {
    return await subscriptionRepository.getPauseSubscriptionResponse(pauseSubscriptionParam: pauseSubscriptionParam);
  }
}

class PauseSubscriptionParam {
  final String subscriptionId;
  final String pauseStartDate;
  final String pauseEndDate;
  PauseSubscriptionParam({
    required this.subscriptionId,
    required this.pauseEndDate,
    required this.pauseStartDate,
  });
}