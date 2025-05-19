import 'package:fpdart/fpdart.dart';
import 'package:milkride/core/failure/failure.dart';
import 'package:milkride/core/usecase/usecase.dart';
import 'package:milkride/feature/cart/domain/entities/common_response.dart';
import 'package:milkride/feature/subscription/domain/repository/subscription_repository.dart';

class DeleteSubscriptionUsecase implements Usecase<CommonResponse,String>{
  final SubscriptionRepository subscriptionRepository;
  DeleteSubscriptionUsecase({required this.subscriptionRepository});
  @override
  Future<Either<Failure,CommonResponse>> call(String subscriptionId)async {
    return await subscriptionRepository.getDeleteSubscriptionResponse(subscriptionId: subscriptionId);
  }
}