import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:milkride/core/common/common_app_bar.dart';
import 'package:milkride/core/constant/app_strings.dart';
import 'package:milkride/feature/order/presentation/cubit/order_cubit.dart';
import 'package:milkride/feature/order/presentation/screen/widgets/date_section.dart';
import 'package:milkride/feature/order/presentation/screen/widgets/delivered_section.dart';
import 'package:milkride/feature/order/presentation/screen/widgets/order_filter_button.dart';
import 'package:milkride/feature/order/presentation/screen/widgets/refund_section.dart';
import 'package:milkride/feature/order/presentation/screen/widgets/to_be_delivered_section.dart';

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
    return Scaffold(
      appBar: CommonAppBar(
        title: AppStrings.orderPageTitle,
        iconPrefix: Icons.arrow_back_ios,
        onIconPressed: widget.onBack,
        actionIcon: Icons.date_range,
        onActionPressed: () async {
          final cubit = context.read<OrderCubit>();
          final picked = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime.now().subtract(Duration(days: 1000)),
            lastDate: DateTime.now(),
          );
          cubit.selectDate(date: picked ?? DateTime.now());
        },
      ),
      body: Column(
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
      ).paddingSymmetric(horizontal: 10.w, vertical: 10.h),
    );
  }
}
