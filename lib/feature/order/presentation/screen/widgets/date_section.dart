import 'package:get/get.dart';
import 'package:milkride/core/common/load_container.dart';
import 'package:milkride/core/common/network_fail_card.dart';
import 'package:milkride/feature/order/presentation/cubit/order_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:milkride/feature/order/presentation/cubit/order_state.dart';
import 'package:milkride/feature/order/presentation/screen/widgets/date_scroller.dart';

class DateSection extends StatelessWidget {
  const DateSection({super.key});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80.h,
      child: BlocBuilder<OrderCubit, OrderState>(
        builder: (context, state) {
          if (state is OrderLoading) {
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 6,
              itemBuilder: (context, index) {
                return LoadContainer(height: 70.h, width: 70.w,radius: 8.r).paddingSymmetric(horizontal: 5.w);
              },
            );
          } else if (state is OrderLoaded) {
            return DateScroller(
              dates: state.dates,
              selectedDate: state.selectedDate,
              onDateSelected: (date) {
                context.read<OrderCubit>().selectDate(date: date);
              },
            );
          } else if(state is OrderError){
            NetworkFailCard(messege: state.message,isButtonRequired: true,);
          }
          return Container();
        },
      ),
    );
  }
}
