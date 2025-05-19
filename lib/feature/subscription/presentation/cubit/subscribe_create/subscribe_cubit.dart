import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:milkride/core/constant/app_strings.dart';
import 'package:milkride/core/routes/routes_name.dart';
import 'package:milkride/core/utils/app_functional_components.dart';
import 'package:milkride/feature/cart/domain/usecase/subscription_usecase.dart';
part 'subscribe_state.dart';

class SubscriptionCubit extends Cubit<SubscriptionState> {
  final SubscriptionUsecase subscriptionUsecase;

  SubscriptionCubit({required this.subscriptionUsecase}) : super(SubscriptionInitial()) {
    emitUpdatedState();
  }

  int productQty = 1;
  String deliveryType = AppStrings.morning;
  String? schedule;
  DateTime? startDate;
  DateTime? endDate;
  List<int> dayWiseQuantities = [0, 0, 0, 0, 0, 0, 0];

  String? get formattedStartDate =>
      startDate != null ? DateFormat('yyyy-MM-dd').format(startDate!) : null;

  String? get formattedEndDate =>
      endDate != null ? DateFormat('yyyy-MM-dd').format(endDate!) : null;

  void updateQuantity(int quantity) {
    productQty = quantity;
    emitUpdatedState();
  }

  void updateDeliveryType(String value) {
    deliveryType = value;
    emitUpdatedState();
  }

  void updateSchedule(String value) {
    schedule = value;
    emitUpdatedState();
  }

  void updateStartDate(DateTime value) {
    startDate = value;
    emitUpdatedState();
  }

  void updateEndDate(DateTime value) {
    endDate = value;
    emitUpdatedState();
  }

  void updateDayWiseQuantity(int index, int quantity) {
    final updatedList = List<int>.from(dayWiseQuantities);
    updatedList[index] = quantity;
    dayWiseQuantities = updatedList;
    emitUpdatedState();
  }

  void updateDayWiseQuantities(List<int> quantities) {
    dayWiseQuantities = quantities;
    emitUpdatedState();
  }

  void emitUpdatedState() {
    emit(SubscriptionLoaded(
      quantity: productQty,
      deliveryType: deliveryType,
      schedule: schedule,
      startDate: startDate,
      endDate: endDate,
      dayWiseQuantities: dayWiseQuantities,
    ));
  }

  Future<void> subscriptionAdd({required SubScribeCartParam subScribeCartParam}) async {
    final current = state as SubscriptionLoaded;
    if (schedule == AppStrings.dayWise &&
        dayWiseQuantities.every((q) => q == 0)) {
      AppFunctionalComponents.showSnackBar(message: AppStrings.atLeastOne);
      return;
    }
    if (schedule == null) {
      AppFunctionalComponents.showSnackBar(message: AppStrings.selectSchedule);
      return;
    }
    if (startDate == null || endDate == null) {
      AppFunctionalComponents.showSnackBar(message: AppStrings.selectBothDate);
      return;
    }
    Get.context?.loaderOverlay.show();
    final result = await subscriptionUsecase.call(subScribeCartParam);
    result.fold(
      (failure) {
        emit(SubscriptionError(failure.messege));
        AppFunctionalComponents.showSnackBar(message: failure.messege);
        emit(current);
      },
      (response) {
        if (response.status == AppStrings.success) {
          AppFunctionalComponents.showSnackBar(message: AppStrings.subscriptionSuccess);
          Get.toNamed(RoutesName.home);
          resetSubscription();
        } else {
          emit(SubscriptionError(AppStrings.subscriptionFail));
          AppFunctionalComponents.showSnackBar(message: AppStrings.subscriptionFail);
        }
      },
    );
    Get.context?.loaderOverlay.hide();
  }

  void resetSubscription() {
    productQty = 1;
    deliveryType = AppStrings.morning;
    schedule = null;
    startDate = null;
    endDate = null;
    dayWiseQuantities = [0, 0, 0, 0, 0, 0, 0];
    emit(SubscriptionInitial());
    emitUpdatedState();
  }
}
