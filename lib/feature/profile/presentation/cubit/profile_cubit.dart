import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:milkride/core/constant/app_strings.dart';
import 'package:milkride/core/storage/storage_key.dart';
import 'package:milkride/core/storage/storage_object.dart';
import 'package:milkride/core/utils/app_functional_components.dart';
import 'package:milkride/feature/home/presentation/cubit/home_cubit.dart';
import 'package:milkride/feature/profile/domain/entities/profile_data.dart';
import 'package:milkride/feature/profile/domain/usecase/profile_usecase.dart';
import 'package:milkride/feature/profile/domain/usecase/vacation_usecase.dart';
import 'package:milkride/feature/subscription/domain/usecase/subscribe_view_usecase.dart';
import 'package:milkride/service/injection.dart';
part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final VacationUsecase vacationUsecase;
  final ProfileUsecase profileUsecase;

  ProfileCubit({
    required this.vacationUsecase,
    required this.profileUsecase,
  }) : super(ProfileInitial());

  ProfileData? profile;

  Future<void> toggleProfileMode({required bool isOn}) async {
    Get.context?.loaderOverlay.show();
    final status = isOn ? "1" : "0";
    final result = await vacationUsecase.call(
      VacationParam(
        customerId: StorageObject.readData(StorageKeys.customerId).toString(),
        status: status,
      ),
    );
    result.fold(
      (failure) {
        AppFunctionalComponents.showSnackBar(message: failure.messege);
      },
      (response) {
        AppFunctionalComponents.showSnackBar(message: response.message ?? "");
        getIt<HomeCubit>().fetchUserDeviceData();
      },
    );
    Get.context?.loaderOverlay.hide();
  }

  Future<void> getProfileResponse() async {
    emit(ProfileLoading());
    final result = await profileUsecase.call(
      SubscriptionViewParam(
        customerId: StorageObject.readData(StorageKeys.customerId).toString(),
        userId: StorageObject.readData(StorageKeys.userId).toString(),
      ),
    );
    result.fold(
      (failure) {
        AppFunctionalComponents.showSnackBar(message: failure.messege);
        emit(ProfileError(messege: failure.messege));
      },
      (response) {
        if (response.status == AppStrings.success) {
          profile = response.data;
          emit(ProfileLoaded(profile!));
        } else {
          emit(ProfileError(messege: response.message ?? ""));
          AppFunctionalComponents.showSnackBar(message: AppStrings.unExpectedError);
        }
      },
    );
  }
}
