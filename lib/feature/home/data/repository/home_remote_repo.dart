import 'package:milkride/feature/home/data/model/home_model.dart';
import 'package:milkride/feature/home/domain/usecase/home_usecase.dart';
import 'package:milkride/service.dart/api_service.dart';

abstract interface class HomeRemoteRepo {
  Future<HomeDataModel> getHomeResponse({required HomeParam homeParam});
}

class HomeImplRemoteRepo implements HomeRemoteRepo {
  final ApiService apiService;
  HomeImplRemoteRepo({required this.apiService});
  @override
  Future<HomeDataModel> getHomeResponse({required HomeParam homeParam}) async {
    return await apiService.getHomeResponse(
      mobileNumber: homeParam.mobileNumber,
      userId: homeParam.userId,
      type: homeParam.type,
      deliveryType: homeParam.deviceType,
      deviceModel: homeParam.deviceModel,
      version: homeParam.version,
      deviceId: homeParam.deviceId,
    );
  }
}
