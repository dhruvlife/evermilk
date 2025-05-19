import 'package:fpdart/fpdart.dart';
import 'package:milkride/core/failure/failure.dart';
import 'package:milkride/core/usecase/usecase.dart';
import 'package:milkride/feature/cart/domain/entities/common_response.dart';
import 'package:milkride/feature/subscription/domain/repository/subscription_repository.dart';

class UpdateQuantityUsecase implements Usecase<CommonResponse,UpdateQuantityParam>{
  final SubscriptionRepository subscriptionRepository;
  UpdateQuantityUsecase({required this.subscriptionRepository});
  @override
  Future<Either<Failure,CommonResponse>> call(UpdateQuantityParam updateQuantityParam)async {
    return await subscriptionRepository.getUpdateQuantityResponse(updateQuantityParam: updateQuantityParam);
  }
}

class UpdateQuantityParam {
  final String subscriptionId;
  final String frequencyType;
  final String quantity;
  UpdateQuantityParam({
    required this.subscriptionId,
    required this.frequencyType,
    required this.quantity,
  });
}