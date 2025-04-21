import 'package:fpdart/fpdart.dart';
import 'package:milkride/core/failure/failure.dart';
import 'package:milkride/core/usecase/usecase.dart';
import 'package:milkride/feature/cart/domain/entities/common_response.dart';
import 'package:milkride/feature/cart/domain/repository/cart_repository.dart';

class SubscriptionUsecase implements Usecase<CommonResponse,SubScribeCartParam>{
  final CartRepository cartRepository;
  SubscriptionUsecase({required this.cartRepository});
  
  @override
  Future<Either<Failure,CommonResponse>> call(subScribeCartParam)async {
    return await cartRepository.getSubcribeResponse(subScribeCartParam: subScribeCartParam);
  }
}

class SubScribeCartParam {
  final String customerId;
  final String packageId;
  final String userId;
  final String frequencyType;
  final String frequencyValue;
  final String quantity;
  final String schedule;
  final String dayWiseQuantity;
  final String deliveryType;
  final String startDate;
  final String endDate;
  final String trialProduct;
  final String noOfUsages;
  final String productId;

  SubScribeCartParam({
   required this.customerId,
   required this.packageId,
   required this.userId,
   required this.frequencyType,
   required this.frequencyValue,
   required this.quantity,
   required this.schedule,
   required this.dayWiseQuantity,
   required this.deliveryType,
   required this.startDate,
   required this.endDate,
   required this.trialProduct,
   required this.noOfUsages,
   required this.productId,
  });
}
