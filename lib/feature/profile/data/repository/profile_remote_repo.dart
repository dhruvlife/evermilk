import 'package:milkride/feature/cart/data/model/common_data_model.dart';
import 'package:milkride/feature/profile/data/model/profile_model.dart';
import 'package:milkride/feature/profile/domain/usecase/vacation_usecase.dart';
import 'package:milkride/feature/subscription/domain/usecase/subscribe_view_usecase.dart';
import 'package:milkride/service/api_service.dart';

abstract interface class ProfileRemoteRepository {
  Future<CommonDataModel> getVacationResponse({required VacationParam vacationParam});
  Future<ProfileModel> getProfileResponse({required SubscriptionViewParam subscriptionViewParam});
}

class ProfileImplRemoteRepo implements ProfileRemoteRepository {
  final ApiService apiService;
  ProfileImplRemoteRepo({required this.apiService});
  @override
  Future<CommonDataModel> getVacationResponse({required VacationParam vacationParam}) async {
    return apiService.getVacationResponse(
      customerId: vacationParam.customerId,
     status : vacationParam.status,
    );
  }
  
  @override
  Future<ProfileModel> getProfileResponse({required SubscriptionViewParam subscriptionViewParam}) {
    return apiService.getProfileResponse(
      customerId: subscriptionViewParam.customerId,
      userId : subscriptionViewParam.userId,
    );
  }
}