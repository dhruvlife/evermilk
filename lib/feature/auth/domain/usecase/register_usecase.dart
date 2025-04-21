import 'package:fpdart/fpdart.dart';
import 'package:milkride/core/failure/failure.dart';
import 'package:milkride/core/usecase/usecase.dart';
import 'package:milkride/feature/auth/domain/entity/register_response.dart';
import 'package:milkride/feature/auth/domain/repository/auth_repository.dart';

class RegisterUsecase implements Usecase<RegisterResponse, RegisterParam> {
  final AuthRepository authRepository;
  RegisterUsecase({required this.authRepository});
  @override
  Future<Either<Failure, RegisterResponse>> call(RegisterParam registerParam) {
    return authRepository.getRegisterResponse(registerParam: registerParam);
  }
}

class RegisterParam {
  final String name;
  final String? email;
  final String? sourceId;
  final String areaId;
  final String houseNo;
  final String? floor;
  final String society;
  final String landmark;
  final String latitude;
  final String longitude;
  final String pincode;
  final String regionId;
  final String userId;
  final String? customerReferrerCode;
  final String? agentCode;
  final String deliveryType;
  final String gender;
  final String mobileNumber;
  RegisterParam({
    required this.mobileNumber, 
    required this.name,
    this.email,
    this.sourceId,
    required this.areaId,
    required this.houseNo,
    this.floor,
    required this.society,
    required this.landmark,
    required this.latitude,
    required this.longitude,
    required this.pincode,
    required this.regionId,
    required this.userId,
    this.customerReferrerCode,
    this.agentCode,
    required this.deliveryType,
    required this.gender,
  });
}
