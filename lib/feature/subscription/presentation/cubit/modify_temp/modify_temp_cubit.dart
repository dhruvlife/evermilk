import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:milkride/core/constant/app_strings.dart';
import 'package:milkride/core/utils/app_functional_components.dart';
import 'package:milkride/feature/subscription/domain/entity/sub_detail.dart';
import 'package:milkride/feature/subscription/domain/usecase/temp_change_usecase.dart';
part 'modify_temp_state.dart';

class ModifyTempCubit extends Cubit<ModifyTempState> {
  final TemporaryChangeUsecase temporaryChangeUsecase;

  ModifyTempCubit({
    required this.temporaryChangeUsecase,
    String? selectedDate,
    String? toDate,
  }) : super(
          ModifyTemporarilyState(
            quantity: 1,
            isSingleDay: true,
            selectedDate: selectedDate ?? "",
            toDate: toDate ?? "",
          ),
        );

  Future<void> modifyTempSubscription({required String subscriptionId}) async {
    final modifyTempState = state as ModifyTemporarilyState;
    final selectedDate = modifyTempState.selectedDate ;
    emit(ModifyTempLoading());
    final result = await temporaryChangeUsecase.call(
      TemporaryChangeParam(
        subscriptionId: subscriptionId,
        tempStartDate: selectedDate,
        tempEndDate: modifyTempState.toDate,
        tempQty: modifyTempState.quantity.toString()));
    result.fold(
      (failure) {
        AppFunctionalComponents.showSnackBar(message: failure.messege);
        emit(ModifyTempError(message: failure.messege));
        resetState();
      },
      (response) {
        if (response.status == AppStrings.success) {
          Get.back();
          AppFunctionalComponents.showSnackBar(message: AppStrings.modifyTempSubSuccess);
        } else {
          AppFunctionalComponents.showSnackBar(message: response.message ?? AppStrings.unExpectedError);
          emit(ModifyTempError(message: response.message ?? AppStrings.unExpectedError));
        }
        resetState();
      },
    );
  }

  void increaseQuantity() {
    final current = state as ModifyTemporarilyState;
    emit(current.copyWith(quantity: current.quantity + 1));
  }

  void decreaseQuantity() {
    final current = state as ModifyTemporarilyState;
    if (current.quantity > 1) {
      emit(current.copyWith(quantity: current.quantity - 1));
    }
  }

  DateTime safeParse(String dateStr, {required DateTime fallback}) {
    try {
      return DateFormat('yyyy-MM-dd').parse(dateStr);
    } catch (_) {
      return fallback;
    }
  }

  Future<void> selectModifyDate({
    required BuildContext context,
    required bool isStart,
    required String fromDate,
    required String toDate,
  }) async {
    final current = state as ModifyTemporarilyState;

    DateTime startDate = safeParse(fromDate, fallback: DateTime.now());
    DateTime endDate = safeParse(toDate, fallback: DateTime.now().add(const Duration(days: 30)));

    if (endDate.isBefore(startDate)) {
      final temp = startDate;
      startDate = endDate;
      endDate = temp;
    }

    final pickedDate = await showDatePicker(
      context: context,
      initialDate: isStart ? startDate : endDate,
      firstDate: startDate,
      lastDate: endDate,
    );

    if (pickedDate != null) {
      final formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
      if (isStart) {
        emit(current.copyWith(selectedDate: formattedDate));
      } else {
        emit(current.copyWith(toDate: formattedDate));
      }
    }
  }

  void toggleDayType({required bool value, required SubScriptionDetail prod}) {
    final current = state as ModifyTemporarilyState;
    if (value) {
      emit(current.copyWith(
        isSingleDay: true,
        selectedDate: prod.startDate ?? "",
        toDate: prod.startDate ?? "",
      ));
    } else {
      emit(current.copyWith(
        isSingleDay: false,
        selectedDate: prod.startDate ?? "",
        toDate: prod.endDate ?? "",
      ));
    }
  }

  void resetState() {
    emit(
      ModifyTemporarilyState(
        quantity: 1,
        selectedDate: "",
        toDate: "",
        isSingleDay: true,
      ),
    );
  }
}
