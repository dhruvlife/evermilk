import 'package:fpdart/fpdart.dart';
import 'package:milkride/core/failure/failure.dart';
import 'package:milkride/core/usecase/usecase.dart';
import 'package:milkride/feature/auth/domain/entity/register_region.dart';
import 'package:milkride/feature/auth/domain/repository/auth_repository.dart';

class AreaByRegionUsecase implements Usecase<List<Region>, int> {
  final AuthRepository authRepository;
  AreaByRegionUsecase({required this.authRepository});

  @override
  Future<Either<Failure,List<Region>>> call(int regionId){
    return authRepository.getAreaRegions(regionId: regionId);
  }
}
