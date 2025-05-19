import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:milkride/core/common/app_text.dart';
import 'package:milkride/core/common/common_container.dart';
import 'package:milkride/core/common/no_order_found_card.dart';
import 'package:milkride/core/constant/app_colors.dart';
import 'package:milkride/core/constant/app_strings.dart';
import 'package:milkride/feature/wallet/domain/entities/recharge.dart';
import 'package:milkride/feature/wallet/presentation/cubit/recharge_history/recharge_history_cubit.dart';
import 'package:milkride/feature/wallet/presentation/screen/recharge_history/widgets/day_wise_recharge_card.dart';
import 'package:milkride/feature/wallet/presentation/screen/recharge_history/widgets/recharge_history_loader.dart';
import 'package:milkride/service/injection.dart';

class RechargeHistory extends StatefulWidget {
  const RechargeHistory({super.key});
  @override
  State<RechargeHistory> createState() => _RechargeHistoryState();
}
class _RechargeHistoryState extends State<RechargeHistory> {
  late final RechargeHistoryCubit cubit;
  @override
  void initState() {
    super.initState();
    cubit = getIt<RechargeHistoryCubit>();
    cubit.fetchRechargeHistory();
  }
  Future<void> selectDate() async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2023),
      lastDate: DateTime.now());
    if (pickedDate != null) {
      cubit.filterRechargeHistoryByDate(pickedDate);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocBuilder<RechargeHistoryCubit, RechargeHistoryState>(
            bloc: cubit,
            builder: (context, state) {
              if (state is RechargeHistoryLoading) {
                return RechargeHistoryLoader();
              }
              String? selectedFilter;
              List<Recharge>? recharges;
              String? errorMessage;
              if (state is RechargeHistoryLoaded) {
                selectedFilter = state.selectedFilter;
                recharges = state.recharges;
              } else if (state is RechargeHistoryError) {
                errorMessage = state.message;
              }
              return Column(children: [
                CommonContainer(
                    height: 90.h,
                    width: 1.sw,
                    widget: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(children: [
                            IconButton(
                                onPressed: () => Get.back(),
                                icon: Icon(Icons.arrow_back_ios, size: 15.sp)),
                            AppText(
                                data: AppStrings.rechargeHistory,
                                fontWeight: FontWeight.w500)]),
                          Row(children: [
                            IconButton(
                                    onPressed: () => cubit.fetchRechargeHistory(),
                                    icon: Icon(Icons.refresh, size: 20.sp)).paddingOnly(right: 2.w),
                            InkWell(
                                onTap: selectDate,
                                child: Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(color: AppColors.inactiveIconColor),
                                        borderRadius:BorderRadius.circular(8.r)),
                                    child: Row(children: [
                                      Icon(Icons.calendar_today, size: 10.sp),
                                      SizedBox(width: 8.w),
                                      AppText(
                                          data: selectedFilter ?? AppStrings.selectDate,
                                          fontSize: 8.sp,
                                          fontWeight: FontWeight.w600)
                                    ]).paddingSymmetric(horizontal: 12.w, vertical: 8.h)))
                          ])
                        ]).paddingSymmetric(horizontal: 10.w)),
                Expanded(
                    child: errorMessage != null
                        ? Center(
                            child: CommonEmptyCard(
                                messege: errorMessage, icon: Icons.wallet))
                        : (recharges == null || recharges.isEmpty)
                            ? Center(child: Text(AppStrings.noRechargeFound))
                            : ListView.builder(
                                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
                                itemCount: recharges.length,
                                itemBuilder: (context, index) {
                                  return DayWiseRechargeCard(recharge: recharges![index]);
                                }))
              ]);
            }));
  }
}
