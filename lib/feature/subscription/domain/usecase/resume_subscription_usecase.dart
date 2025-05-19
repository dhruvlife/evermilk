import 'package:fpdart/fpdart.dart';
import 'package:milkride/core/failure/failure.dart';
import 'package:milkride/core/usecase/usecase.dart';
import 'package:milkride/feature/cart/domain/entities/common_response.dart';
import 'package:milkride/feature/subscription/domain/repository/subscription_repository.dart';

class ResumeSubscriptionUsecase implements Usecase<CommonResponse,ResumeSubscriptionParam >{
  final SubscriptionRepository subscriptionRepository;
  ResumeSubscriptionUsecase({required this.subscriptionRepository});
  @override
  Future<Either<Failure,CommonResponse>> call(ResumeSubscriptionParam resumeSubscriptionParam)async {
    return await subscriptionRepository.getResumeSubscriptionResponse(resumeSubscriptionParam: resumeSubscriptionParam);
  }
}

class ResumeSubscriptionParam {
  final String subscriptionId;
  final String customerId;
  ResumeSubscriptionParam({
    required this.subscriptionId,
    required this.customerId,
  });
}