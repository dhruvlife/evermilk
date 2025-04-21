import 'package:fpdart/fpdart.dart';
import 'package:milkride/core/failure/failure.dart';
import 'package:milkride/core/usecase/usecase.dart';
import 'package:milkride/feature/home/domain/entities/home_response.dart';
import 'package:milkride/feature/home/domain/repository/home_repository.dart';

class HomeUsecase implements Usecase<HomeResponse,HomeParam>{
  final HomeRepository homeRepository;
  HomeUsecase({required this.homeRepository});

  @override
  Future<Either<Failure, HomeResponse>> call(HomeParam homeParam)async {
    return await homeRepository.getHomeResponse(homeParam: homeParam);
  }
}

class HomeParam {
  final String mobileNumber;
  final String userId;
  final String type;
  final String deviceType;
  final String deviceModel;
  final String deviceId;
  final String version;
  HomeParam({
    required this.mobileNumber,
    required this.userId,
    required this.type,
    required this.deviceType,
    required this.deviceModel,
    required this.deviceId,
    required this.version,
  });
}
