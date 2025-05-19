import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:milkride/core/constant/app_strings.dart';
import 'package:milkride/core/utils/app_functional_components.dart';
import 'package:milkride/feature/subscription/domain/usecase/update_quantity_sub_usecase.dart';
part 'modify_permenant_state.dart';

class ModifyPermenantCubit extends Cubit<ModifyPermenantState> {
  final UpdateQuantityUsecase updateQuantityUsecase;

  ModifyPermenantCubit({required this.updateQuantityUsecase})
      : super(const ModifyPermanentlyLoaded(quantity: 1, frequencyType: AppStrings.everyDay));

  void increaseQuantity() {
    if (state is ModifyPermanentlyLoaded) {
      final current = state as ModifyPermanentlyLoaded;
      emit(current.copyWith(quantity: current.quantity + 1));
    }
  }

  void decreaseQuantity() {
    if (state is ModifyPermanentlyLoaded) {
      final current = state as ModifyPermanentlyLoaded;
      if (current.quantity > 1) {
        emit(current.copyWith(quantity: current.quantity - 1));
      }
    }
  }

  void updateFrequencyType(String frequencyType) {
    if (state is ModifyPermanentlyLoaded) {
      final current = state as ModifyPermanentlyLoaded;
      emit(current.copyWith(frequencyType: frequencyType));
    }
  }

  Future<void> modifyPermanentSubscription({required String subscriptionId}) async {
    final currentState = state;
    if (currentState is! ModifyPermanentlyLoaded) return;

    if (currentState.frequencyType.isEmpty) {
      AppFunctionalComponents.showSnackBar(message: AppStrings.selectFrequencyType);
      return;
    }

    emit(ModifyPermenantLoading());

    final result = await updateQuantityUsecase.call(
      UpdateQuantityParam(
        subscriptionId: subscriptionId,
        frequencyType: currentState.frequencyType,
        quantity: currentState.quantity.toString(),
      ),
    );

    result.fold(
      (failure) {
        AppFunctionalComponents.showSnackBar(message: failure.messege);
        emit(ModifyPermanentError(message: failure.messege));
        resetState();
      },
      (response) {
        if (response.status == AppStrings.success) {
          Get.back();
          AppFunctionalComponents.showSnackBar(message: AppStrings.modifyPermSubSuccess);
        } else {
          final msg = response.message ?? AppStrings.unExpectedError;
          AppFunctionalComponents.showSnackBar(message: msg);
          emit(ModifyPermanentError(message: msg));
        }
        resetState();
      },
    );
  }

  void resetState() {
    emit(const ModifyPermanentlyLoaded(quantity: 1, frequencyType: AppStrings.everyDay));
  }
}
