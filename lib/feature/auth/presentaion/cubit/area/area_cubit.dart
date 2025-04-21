import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:milkride/core/failure/failure.dart';
import 'package:milkride/core/utils/app_functional_components.dart';
import 'package:milkride/feature/auth/domain/entity/register_region.dart';
import 'package:milkride/feature/auth/domain/usecase/area_by_region_usecase.dart';

part 'area_state.dart';

class AreaCubit extends Cubit<AreaState> {
  final AreaByRegionUsecase areaByRegionUsecase;
  AreaCubit({required this.areaByRegionUsecase}) : super(AreaInitial());

  void getAreasByRegion({required int regionId}) async {
    emit(AreaLoading());
    final Either<Failure, List<Region>> result =await areaByRegionUsecase.call(regionId);
    result.fold((failure) {
      emit(AreaError(failure.messege));
      AppFunctionalComponents.showSnackBar(message: failure.messege);
    }, (areaResponse) {
      
      emit(AreaLoaded(area: areaResponse));
    });
  }
}
