import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:milkride/core/common/app_text.dart';
import 'package:milkride/core/common/common_app_bar.dart';
import 'package:milkride/core/common/common_container.dart';
import 'package:milkride/core/common/network_fail_card.dart';
import 'package:milkride/core/constant/app_colors.dart';
import 'package:milkride/core/constant/app_strings.dart';
import 'package:milkride/feature/order/presentation/cubit/order_cubit.dart';
import 'package:milkride/feature/order/presentation/cubit/order_state.dart';
import 'package:milkride/feature/order/presentation/screen/widgets/date_section.dart';
import 'package:milkride/feature/order/presentation/screen/widgets/delivered_section.dart';
import 'package:milkride/feature/order/presentation/screen/widgets/order_filter_button.dart';
import 'package:milkride/feature/order/presentation/screen/widgets/order_loader.dart';
import 'package:milkride/feature/order/presentation/screen/widgets/refund_section.dart';
import 'package:milkride/feature/order/presentation/screen/widgets/to_be_delivered_section.dart';
import 'package:intl/intl.dart';

class OrderScreen extends StatefulWidget {
  final VoidCallback onBack;
  const OrderScreen({super.key, required this.onBack});
  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<OrderCubit>();
    final state = context.watch<OrderCubit>().state;
    String dateText = "";
    if (state is OrderLoaded) {
      dateText = DateFormat('dd MMM').format(state.selectedDate);
    }
    return Scaffold(
      appBar: CommonAppBar(
        title: AppStrings.orderPageTitle,
        iconPrefix: Icons.arrow_back_ios,
        onIconPressed: widget.onBack,
        isActionWidget: true,
        action: GestureDetector(
          onTap: () async {
            final picked = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime.now().subtract(const Duration(days: 1000)),
              lastDate: DateTime.now(),
            );
            if (picked != null) cubit.selectDate(date: picked);
          },
          child: CommonContainer(
              height: 25.h,
              width: 60.w,
              color: AppColors.optionButton,
              borderRadius: BorderRadius.circular(5.r),
              widget: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppText(
                      data: dateText,
                      fontSize: 8.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.white),
                  Icon(Icons.arrow_drop_down,size: 15.sp, color: AppColors.white)
                ],
              )),
        ),
      ),
      body: PopScope(
        canPop: false,
        onPopInvoked: (didPop) {
          if (!didPop) widget.onBack.call();
        },
        child: BlocBuilder<OrderCubit, OrderState>(
          builder: (context, state) {
            if (state is OrderLoading) {
              return OrderLoader();
            } else if (state is OrderError) {
              return NetworkFailCard(
                messege: state.message,
                isButtonRequired: true,
                buttonText: AppStrings.retry,
                onButtontap: () async {
                  cubit.fetchOrdersForDate(DateTime.now());
                },
              );
            } else if (state is OrderLoaded) {
              return RefreshIndicator(
                backgroundColor: AppColors.success,
                color: AppColors.white,
                onRefresh: () async {
                  cubit.fetchOrdersForDate(DateTime.now());
                },
                child: Column(
                  children: [
                    DateSection().paddingOnly(bottom: 20.h),
                    OrderFilterButtons(
                      selectedIndex: selectedIndex,
                      onSelected: (index) {
                        setState(() => selectedIndex = index);
                      },
                    ).paddingOnly(bottom: 10.h),
                    Expanded(
                      child: selectedIndex == 0
                          ? ToBeDeliveredSection()
                          : selectedIndex == 1
                              ? DeliveredSection()
                              : RefundSection(),
                    ),
                  ],
                ),
              );
            }
            return const SizedBox();
          },
        ).paddingSymmetric(horizontal: 10.w, vertical: 10.h),
      ),
    );
  }
}
