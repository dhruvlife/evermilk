

import 'package:fpdart/fpdart.dart';
import 'package:milkride/core/failure/failure.dart';
import 'package:milkride/core/usecase/usecase.dart';
import 'package:milkride/feature/cart/domain/entities/common_response.dart';
import 'package:milkride/feature/subscription/domain/repository/subscription_repository.dart';

class TemporaryChangeUsecase implements Usecase<CommonResponse,TemporaryChangeParam>{
  final SubscriptionRepository subscriptionRepository;
  TemporaryChangeUsecase({required this.subscriptionRepository});
  @override
  Future<Either<Failure,CommonResponse>> call(TemporaryChangeParam temporaryChangeParam)async {
    return await subscriptionRepository.getTemporaryChangeResponse(temporaryChangeParam: temporaryChangeParam);
  }
}

class TemporaryChangeParam {
  final String subscriptionId;
  final String tempStartDate;
  final String tempEndDate;
  final String tempQty;
  TemporaryChangeParam({
    required this.subscriptionId,
    required this.tempEndDate,
    required this.tempQty,
    required this.tempStartDate,
  });
}
