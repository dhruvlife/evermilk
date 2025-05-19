import 'package:milkride/feature/cart/data/model/common_data_model.dart';
import 'package:milkride/feature/subscription/data/model/subscription_view_model.dart';
import 'package:milkride/feature/subscription/domain/usecase/pause_subscription_usecase.dart';
import 'package:milkride/feature/subscription/domain/usecase/resume_subscription_usecase.dart';
import 'package:milkride/feature/subscription/domain/usecase/subscribe_view_usecase.dart';
import 'package:milkride/feature/subscription/domain/usecase/temp_change_usecase.dart';
import 'package:milkride/feature/subscription/domain/usecase/update_quantity_sub_usecase.dart';
import 'package:milkride/service/api_service.dart';

abstract interface class SubscriptionRemoteRepo {
  Future<SubscriptionViewModel> getSubscribeResponse({required SubscriptionViewParam subscriptionViewParam});
  Future<CommonDataModel> getTemporaryChangeResponse({required TemporaryChangeParam temporaryChangeParam});
  Future<CommonDataModel> getPauseSubscriptionResponse({required PauseSubscriptionParam pauseSubscriptionParam});
  Future<CommonDataModel> getResumeSubscriptionResponse({required ResumeSubscriptionParam resumeSubscriptionParam});
  Future<CommonDataModel> getUpdateQuantityResponse({required UpdateQuantityParam updateQuantityParam});
  Future<CommonDataModel> getDeleteSubscriptionResponse({required String subscriptionId});
}

class SubscriptionImplRemoteRepo implements SubscriptionRemoteRepo {
  final ApiService apiService;
  SubscriptionImplRemoteRepo({required this.apiService});
  @override
  Future<SubscriptionViewModel> getSubscribeResponse({required SubscriptionViewParam subscriptionViewParam}) async {
    return await apiService.getSubscribeResponse(
      customerId: subscriptionViewParam.customerId.toString(),
      userId: subscriptionViewParam.userId,
    );
  }

  @override
  Future<CommonDataModel> getDeleteSubscriptionResponse({required String subscriptionId}) async {
    return await apiService.getDeleteSubscriptionResponse(
      subscriptionId: subscriptionId,
    );
  }

  @override
  Future<CommonDataModel> getPauseSubscriptionResponse({required PauseSubscriptionParam pauseSubscriptionParam}) async {
    return await apiService.getPauseSubscriptionResponse(
      subscriptionId: pauseSubscriptionParam.subscriptionId,
      pauseStartDate: pauseSubscriptionParam.pauseStartDate,
      pauseEndDate: pauseSubscriptionParam.pauseEndDate,
    );
  }

  @override
  Future<CommonDataModel> getResumeSubscriptionResponse({required ResumeSubscriptionParam resumeSubscriptionParam}) async {
    return await apiService.getResumeSubscriptionResponse(
        subscriptionId: resumeSubscriptionParam.subscriptionId,
        customerId: resumeSubscriptionParam.customerId,
    );
  }

  @override
  Future<CommonDataModel> getTemporaryChangeResponse({required TemporaryChangeParam temporaryChangeParam}) async {
    return await apiService.getTemporaryChangeResponse(
      subscriptionId: temporaryChangeParam.subscriptionId,
      tempStartDate: temporaryChangeParam.tempStartDate,
      tempEndDate: temporaryChangeParam.tempEndDate,
      tempQty: temporaryChangeParam.tempQty,
    );
  }

  @override
  Future<CommonDataModel> getUpdateQuantityResponse({required UpdateQuantityParam updateQuantityParam}) async {
    return await apiService.getUpdateQuantityResponse(
      subscriptionId: updateQuantityParam.subscriptionId,
      frequencyType: updateQuantityParam.frequencyType,
      quantity: updateQuantityParam.quantity,
    );
  }
}
