import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:milkride/core/common/app_elevated_button.dart';
import 'package:milkride/core/common/app_text.dart';
import 'package:milkride/core/common/common_app_bar.dart';
import 'package:milkride/core/common/quantity_button.dart';
import 'package:milkride/core/constant/app_colors.dart';
import 'package:milkride/core/constant/app_strings.dart';
import 'package:milkride/core/storage/storage_key.dart';
import 'package:milkride/core/storage/storage_object.dart';
import 'package:milkride/feature/cart/domain/usecase/subscription_usecase.dart';
import 'package:milkride/feature/subscription/presentation/cubit/subscribe_create/subscribe_cubit.dart';
import 'package:milkride/feature/subscription/presentation/screen/subscription_create/widgets/date_picker_section.dart';
import 'package:milkride/feature/subscription/presentation/screen/subscription_create/widgets/delivery_type_section.dart';
import 'package:milkride/feature/subscription/presentation/screen/subscription_create/widgets/schedule_card.dart';
import 'package:milkride/feature/subscription/presentation/screen/subscription_create/widgets/subcription_prod_card.dart';
import 'package:milkride/feature/home/presentation/cubit/home_cubit.dart';
import 'package:milkride/feature/product/domain/entities/product.dart';
import 'package:milkride/service/injection.dart';

class SubscriptionScreen extends StatefulWidget {
  final Product product;
  const SubscriptionScreen({super.key, required this.product});
  @override
  SubscriptionScreenState createState() => SubscriptionScreenState();
}

class SubscriptionScreenState extends State<SubscriptionScreen> {
  final cubit = getIt<SubscriptionCubit>();
  void pickDate(BuildContext context, {required bool isStart}) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (picked != null) {
      if (isStart) {
        cubit.updateStartDate(picked);
      } else {
        cubit.updateEndDate(picked);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final weekdays = AppStrings.weekdays;
    return Scaffold(
      appBar: CommonAppBar(
        title: AppStrings.subscribePageTitle,
        iconPrefix: Icons.arrow_back_ios,
        showAction: false,
      ),
      body: BlocBuilder<SubscriptionCubit, SubscriptionState>(
        bloc: cubit,
        builder: (context, state) {
          if (state is SubscriptionLoaded) {
            return ListView(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              children: [
                SubcriptionProdCard(
                  product: widget.product,
                  onQuautIncrease: () =>
                      cubit.updateQuantity(state.quantity + 1),
                  onQuautreduce: () {
                    if (state.quantity > 1) {
                      cubit.updateQuantity(state.quantity - 1);
                    }
                  },
                  onTapDelete: () {},
                  quantity: state.quantity,
                ).paddingSymmetric(vertical: 10.h),
                AppText(
                    data: AppStrings.deliveryType,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w700),
                DeliveryTypeWidget(
                  isMorning: state.deliveryType == AppStrings.morning,
                  toggleIsMorning: () {
                    final newType = state.deliveryType == AppStrings.morning
                        ? AppStrings.evening
                        : AppStrings.morning;
                    cubit.updateDeliveryType(newType);
                  },
                ),
                AppText(
                    data: AppStrings.deliverySchedule,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w700),
                ScheduleCard(cubit: cubit),
                AppText(
                    data: AppStrings.chooseDate,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w700),
                Row(
                  children: [
                    DatePickerWidget(
                      label: AppStrings.startDate,
                      date: state.startDate,
                      onTap: () => pickDate(context, isStart: true),
                    ),
                    SizedBox(width: 10.w),
                    DatePickerWidget(
                      label: AppStrings.endDate,
                      date: state.endDate,
                      onTap: () => pickDate(context, isStart: false),
                    ),
                  ],
                ).paddingSymmetric(horizontal: 10.w, vertical: 10.h),
                if (state.schedule == AppStrings.dayWise)
                  Column(
                    children: List.generate(7, (index) {
                      return ListTile(
                        leading: AppText(
                          data: weekdays[index],
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                        ),
                        trailing: QuantityButton(
                          quantity: state.dayWiseQuantities[index].toString(),
                          onIncreaseQuant: () => cubit.updateDayWiseQuantity(
                              index, state.dayWiseQuantities[index] + 1),
                          onReduceQuant: () {
                            if (state.dayWiseQuantities[index] > 0) {
                              cubit.updateDayWiseQuantity(index, state.dayWiseQuantities[index] - 1);
                            }
                          },
                        ),
                      );
                    }),
                  ),
              ],
            );
          }
          return const SizedBox();
        },
      ),
      bottomNavigationBar: SafeArea(
        child: CustomElevatedButton(
          backgroundColor: AppColors.optionButton,
          onPressed: () {
            final customerId = getIt<HomeCubit>().userData?.id ?? 0;
            final userId = StorageObject.readData(StorageKeys.userId);
            final schedule = cubit.schedule ?? "";
            String frequencyValue;
            switch (schedule) {
              case AppStrings.dayWise:
              frequencyValue = "4";
                break;
              case AppStrings.every3Day:
                frequencyValue = "3";
                break;
              case AppStrings.alternateDay:
                frequencyValue = "2";
                break;
              default:
                frequencyValue = "1";
            }
            final dayWiseQty = "[${cubit.dayWiseQuantities.join(",")}]";
            cubit.subscriptionAdd(
              subScribeCartParam: SubScribeCartParam(
                customerId: customerId.toString(),
                packageId: widget.product.id.toString(),
                userId: userId,
                frequencyType: schedule,
                frequencyValue: frequencyValue,
                quantity: cubit.productQty.toString(),
                schedule: schedule,
                dayWiseQuantity: dayWiseQty,
                deliveryType: cubit.deliveryType,
                startDate: cubit.formattedStartDate ?? "",
                endDate: cubit.formattedEndDate ?? "",
                trialProduct: "0",
                noOfUsages: "0",
                productId: widget.product.productId.toString(),
              ),
            );
          },
          child: AppText(
            data: AppStrings.submit,
            color: AppColors.white,
            fontWeight: FontWeight.w600,
          ),
        ).paddingAll(5),
      ),
    );
  }
}
