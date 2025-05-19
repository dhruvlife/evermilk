import 'dart:core';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:milkride/core/constant/app_strings.dart';
import 'package:milkride/core/storage/storage_key.dart';
import 'package:milkride/core/storage/storage_object.dart';
import 'package:milkride/core/utils/app_functional_components.dart';
import 'package:milkride/feature/subscription/domain/entity/sub_detail.dart';
import 'package:milkride/feature/subscription/domain/usecase/delete_subscription_usecase.dart';
import 'package:milkride/feature/subscription/domain/usecase/pause_subscription_usecase.dart';
import 'package:milkride/feature/subscription/domain/usecase/resume_subscription_usecase.dart';
import 'package:milkride/feature/subscription/domain/usecase/subscribe_view_usecase.dart';
part 'subscribe_view_state.dart';

class SubscribeViewCubit extends Cubit<SubscribeViewState> {
  final SubscriptionViewUsecase subscriptionViewUsecase;
  final DeleteSubscriptionUsecase deleteSubscriptionUsecase;
  final PauseSubscriptionUsecase pauseSubscriptionUsecase;
  final ResumeSubscriptionUsecase resumeSubscriptionUsecase;
  SubscribeViewCubit({
    required this.subscriptionViewUsecase,
    required this.deleteSubscriptionUsecase,
    required this.pauseSubscriptionUsecase,
    required this.resumeSubscriptionUsecase,
  }) : super(SubscribeViewInitial());

  final TextEditingController startDateController = TextEditingController(text:DateFormat('yyyy-MM-dd').format(DateTime.now()));
  final TextEditingController endDateController = TextEditingController();
  final int customerId = StorageObject.readData(StorageKeys.customerId);
  final userId = StorageObject.readData(StorageKeys.userId);

  Future<void> fetchSubscribeView() async {
    emit(SubscribeViewLoading());
    final result = await subscriptionViewUsecase(SubscriptionViewParam(customerId: customerId.toString(), userId: userId));
    result.fold(
      (failure) {
        emit(SubscribeViewError(message: failure.messege));
        AppFunctionalComponents.showSnackBar(message: failure.messege);
      },
      (subViewData) {
        if (subViewData.status == AppStrings.success){
          final subscribeResponse = subViewData.data;
          emit(SubscribeViewLoaded(subscribeResponse: subscribeResponse));
        } else {
          AppFunctionalComponents.showSnackBar(message: AppStrings.unExpectedError);
        }
      },
    );
  }

  Future<void> pickDate({
    required BuildContext context,
    required TextEditingController controller,
    required String fromDate,
    required String toDate,
  }) async {
    if (!context.mounted) return;
    final DateTime firstDate = DateFormat('yyyy-MM-dd').parse(fromDate);
    final DateTime lastDate = DateFormat('yyyy-MM-dd').parse(toDate);
    final picked = await showDatePicker(
      context: context,
      firstDate: firstDate,
      lastDate: lastDate,
      initialDate:firstDate.isAfter(DateTime.now()) ? firstDate : DateTime.now(),
    );
    if (picked != null) {
      controller.text = DateFormat('yyyy-MM-dd').format(picked);
    }
  }

  Future<void> deleteSubscription({required String subcriptionId}) async {
    Get.context?.loaderOverlay.show();
    final result = await deleteSubscriptionUsecase.call(subcriptionId);
    result.fold(
      (failure) {
        emit(SubscribeViewError(message: failure.messege));
        AppFunctionalComponents.showSnackBar(message: failure.messege);
      },
      (deleteSub) {
        if (deleteSub.status == AppStrings.success) {
          AppFunctionalComponents.showSnackBar(message: AppStrings.deleteSubSuccess);
          fetchSubscribeView();
        } else {
          AppFunctionalComponents.showSnackBar(message: AppStrings.unExpectedError);
        }
      },
    );
    Get.context?.loaderOverlay.hide();
  }

  Future<void> resumeSubscription({required String subcriptionId}) async {
    Get.context?.loaderOverlay.show();
    final result = await resumeSubscriptionUsecase.call(ResumeSubscriptionParam(subscriptionId: subcriptionId, customerId: customerId.toString()));
    result.fold(
      (failure) {
        emit(SubscribeViewError(message: failure.messege));
        AppFunctionalComponents.showSnackBar(message: failure.messege);
      },
      (resumeSub) {
        if (resumeSub.status == AppStrings.success) {
          AppFunctionalComponents.showSnackBar(message: AppStrings.resumeSubSuccess);
          fetchSubscribeView();
        } else {
          AppFunctionalComponents.showSnackBar(message: AppStrings.unExpectedError);
        }
      },
    );
    Get.context?.loaderOverlay.hide();
  }

  Future<void> pauseSubscription({required String subcriptionId}) async {
    if (startDateController.text.isEmpty || endDateController.text.isEmpty) {
      AppFunctionalComponents.showSnackBar(message: "Please select both dates");
    } else {
      Get.context?.loaderOverlay.show();
      final result = await pauseSubscriptionUsecase.call(PauseSubscriptionParam(
        pauseEndDate: endDateController.text.trim(),
        subscriptionId: subcriptionId,
        pauseStartDate: startDateController.text.trim(),
      ));
      result.fold(
        (failure) {
          emit(SubscribeViewError(message: failure.messege));
          AppFunctionalComponents.showSnackBar(message: failure.messege);
        },
        (pauseSub) {
          if (pauseSub.status == AppStrings.success) {
            AppFunctionalComponents.showSnackBar(message: AppStrings.pauseSubscriptionSuccess);
            fetchSubscribeView();
          } else {
            AppFunctionalComponents.showSnackBar(message: AppStrings.unExpectedError);
          }
        },
      );
    }
    Get.context?.loaderOverlay.hide();
  }
  void clear() {
    startDateController.clear();
    endDateController.clear();
  }
}
