import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:milkride/core/common/common_container.dart';
import 'package:milkride/core/constant/app_strings.dart';
import 'package:milkride/feature/subscription/presentation/cubit/subscribe_create/subscribe_cubit.dart';
import 'package:milkride/feature/subscription/presentation/screen/subscription_create/widgets/schedule_option_widget.dart';

class ScheduleCard extends StatelessWidget {
  final SubscriptionCubit cubit;
  const ScheduleCard({
    super.key,
    required this.cubit,
  });

  @override
  Widget build(BuildContext context) {
    return CommonContainer(
      widget: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ScheduleOptionWidget(
            label: AppStrings.everyDayCap,
            isSelectedSchedule: cubit.schedule == AppStrings.everyDay,
            onTap: () => cubit.updateSchedule(AppStrings.everyDay),
          ),
          ScheduleOptionWidget(
            label: AppStrings.alternateDayCap,
            isSelectedSchedule: cubit.schedule == AppStrings.alternateDay,
            onTap: () => cubit.updateSchedule(AppStrings.alternateDay),
          ),
          ScheduleOptionWidget(
            label: AppStrings.every3DayCap,
            isSelectedSchedule: cubit.schedule == AppStrings.every3Day,
            onTap: () => cubit.updateSchedule(AppStrings.every3Day),
          ),
          ScheduleOptionWidget(
              label: AppStrings.dayWiseCap,
              isSelectedSchedule: cubit.schedule == AppStrings.dayWise,
              onTap: () {
                cubit.updateSchedule(AppStrings.dayWise);
              },
          ),
        ],
      ).paddingSymmetric(horizontal: 10.w),
      height: 60.h,
      width: 1.sw,
    );
  }
}
