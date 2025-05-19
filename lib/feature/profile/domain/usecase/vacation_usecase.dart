import 'package:fpdart/fpdart.dart';
import 'package:milkride/core/failure/failure.dart';
import 'package:milkride/core/usecase/usecase.dart';
import 'package:milkride/feature/cart/domain/entities/common_response.dart';
import 'package:milkride/feature/profile/domain/repository/profile_repository.dart';

class VacationUsecase implements Usecase<CommonResponse, VacationParam> {
  final ProfileRepository profileRepository;
  VacationUsecase({required this.profileRepository});
  @override
  Future<Either<Failure, CommonResponse>> call(VacationParam vacationParam) async {
    return await profileRepository.getVacationResponse(vacationParam: vacationParam);
  }
}

class VacationParam {
  final String customerId;
  final String status;
  VacationParam({required this.customerId, required this.status});
}