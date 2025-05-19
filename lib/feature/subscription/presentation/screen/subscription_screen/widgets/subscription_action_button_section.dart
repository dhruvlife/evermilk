import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:milkride/core/common/app_elevated_button.dart';
import 'package:milkride/core/common/app_text.dart';
import 'package:milkride/core/common/app_textfield.dart';
import 'package:milkride/core/constant/app_colors.dart';
import 'package:milkride/core/constant/app_strings.dart';
import 'package:milkride/core/routes/routes_name.dart';
import 'package:milkride/feature/product/presentation/screen/option_sheet/widgets/delivery_button.dart';
import 'package:milkride/feature/subscription/domain/entity/sub_detail.dart';
import 'package:milkride/feature/subscription/presentation/cubit/scuscribe_view/subscribe_view_cubit.dart';
import 'package:milkride/feature/subscription/presentation/screen/subscription_screen/widgets/subscription_action_button.dart';
import 'package:milkride/service/injection.dart';

class SubscriptionActionButtonSection extends StatefulWidget {
  final SubScriptionDetail prod;
  const SubscriptionActionButtonSection({super.key, required this.prod});
  @override
  State<SubscriptionActionButtonSection> createState() => _SubscriptionActionButtonSectionState();
}

class _SubscriptionActionButtonSectionState extends State<SubscriptionActionButtonSection> {
  @override
  Widget build(BuildContext context) {
    final isResume = widget.prod.isPauseSubscription ?? false;
      final cubit = getIt<SubscribeViewCubit>();
    return BlocBuilder<SubscribeViewCubit, SubscribeViewState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SubscriptionActionButton(
              icon: Icons.delete,
              label: AppStrings.delete,
              title: AppStrings.deleteSubscription,
              description: AppStrings.deleteSubscriptionDescription,
              widget: Row(
                children: [
                  Expanded(
                    child: CustomElevatedButton(
                      backgroundColor: AppColors.white,
                      onPressed: () => Get.back(),
                      child: AppText(data: AppStrings.cancel, fontSize: 12.sp),
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Expanded(
                    child: CustomElevatedButton(
                      backgroundColor: AppColors.white,
                      onPressed: () {
                        cubit.deleteSubscription(subcriptionId: widget.prod.id.toString());
                        Get.back();
                      },
                      child: AppText(data: AppStrings.delete, fontSize: 12.sp),
                    ),
                  ),
                ],
              ).paddingOnly(top: 10.h),
            ).paddingOnly(right: 5.w),
         isResume ? SizedBox.shrink():  SubscriptionActionButton(
              icon: Icons.calendar_month,
              label: AppStrings.modify,
              title: AppStrings.modifySubscription,
              description: AppStrings.modifySubscriptionDescription,
              widget: Column(
                children: [
                  SelectedButton(
                    btnHeight: 40.h,
                    btnWidth: double.infinity,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                    onPressed: () {
                      Get.back();
                      Get.toNamed(RoutesName.modifyTemp,arguments:widget.prod);
                    },
                    data: AppStrings.modifyTemporarily,
                    isSlected: true,
                  ).paddingOnly(bottom: 10.h),
                  SelectedButton(
                    btnHeight: 40.h,
                    btnWidth: double.infinity,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                    onPressed: () {
                      Get.back();
                      Get.toNamed(RoutesName.modifyPermenent,arguments: widget.prod);
                    },
                    data: AppStrings.updatePermanently,
                    isSlected: false,
                  ).paddingOnly(bottom: 10.h),
                ],
              ).paddingOnly(top: 20.h),
            ).paddingOnly(right: 5.w),
            widget.prod.isPauseSubscription == false ? SubscriptionActionButton(
              icon: Icons.pause,
              label: AppStrings.pause,
              title: AppStrings.pauseSubscription,
              description: AppStrings.pauseSubscriptionDescription,
              widget: Column(
                children: [
                  AppTextField(
                    needBorder: false,
                    hintText: AppStrings.fromDate,
                    controller: cubit.startDateController,
                    isReadonly: true,
                    ontap: () {      
                      cubit.pickDate(
                        toDate: widget.prod.endDate.toString(),
                        fromDate:widget.prod.startDate.toString(),
                          context: context,
                          controller: cubit.startDateController);
                    }
                  ),
                  AppTextField(
                    needBorder: false,
                    hintText: AppStrings.toDate,
                    controller: cubit.endDateController,
                    isReadonly: true,
                    ontap: () {
                      cubit.pickDate(
                        toDate: widget.prod.endDate.toString(),
                        fromDate:widget.prod.startDate.toString(),
                          context: context,
                          controller: cubit.endDateController);
                    },
                  ),
                  CustomElevatedButton(
                    onPressed: () {
                      Get.back();
                      cubit.pauseSubscription(subcriptionId: widget.prod.id.toString());
                    },
                    backgroundColor: AppColors.optionButton,
                    child:
                        AppText(data: AppStrings.pause, color: AppColors.white),
                  ),
                ],
              ).paddingOnly(top: 20.h),
            ).paddingOnly(right: 5.w):
             SubscriptionActionButton(
              icon: Icons.play_arrow,
              label: AppStrings.subResume,
              title: AppStrings.resumeSubscription,
              description: AppStrings.resumeSubscriptionDescription,
              widget: Column(
                children: [                
                  CustomElevatedButton(
                    onPressed: () {
                      Get.back();
                      cubit.resumeSubscription(subcriptionId: widget.prod.id.toString());
                    },
                    backgroundColor: AppColors.optionButton,
                    child:AppText(data: AppStrings.subResume, color: AppColors.white),
                  ),
                ],
              ).paddingOnly(top: 20.h),
            ).paddingOnly(right: 5.w),
          ],
        );
      },
    );
  }
}
