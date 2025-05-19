import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:milkride/core/common/app_text.dart';
import 'package:milkride/core/common/no_order_found_card.dart';
import 'package:milkride/core/common/product_card_loader.dart';
import 'package:milkride/core/constant/app_strings.dart';
import 'package:milkride/feature/order/domain/usecase/order_cancel_usecase.dart';
import 'package:milkride/feature/order/presentation/cubit/order_cubit.dart';
import 'package:milkride/feature/order/presentation/cubit/order_state.dart';
import 'package:milkride/feature/order/presentation/screen/widgets/cancel_reason_dialog.dart';
import 'package:milkride/feature/order/presentation/screen/widgets/order_product_card.dart';
import 'package:milkride/feature/order/presentation/screen/widgets/order_total_section.dart';
import 'package:milkride/service/injection.dart';

class ToBeDeliveredSection extends StatelessWidget {
  const ToBeDeliveredSection({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderCubit, OrderState>(
      builder: (context, state) {
        if (state is OrderLoading) {
          return ProductCardLoader(
            productHeight: 60.h,
            productWidth: 0.9.sw,
            padding: 5,
            count: 5,
            productRadius: 5,
          );
        } else if (state is OrderLoaded) {
          final res = state.orderResponse;
          final toBeDelivered = res.data?.toBeDelivered ?? [];
          final reasons = res.data?.orderReasons ?? [];
          if (toBeDelivered.isEmpty) {
             return CommonEmptyCard(messege:AppStrings.noOrderFound, icon:Icons.category);
          } else {
            return ListView(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
              children: [
                ListView.builder(
                  itemCount: toBeDelivered.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return OrderProductCard(
                      product: toBeDelivered[index],
                      onDelete: () {
                        final cubit = getIt<OrderCubit>();
                        final orderId = toBeDelivered[index].orderId ?? 0;
                        final packageId = toBeDelivered[index].packageId;
                        showCancelReasonDialog(
                          context: context,
                          reasons: reasons,
                          onDeleteConfirm: (reasonId) {
                            cubit.cancelOrder(
                              orderCancelParam: OrderCancelParam(
                                orderId: orderId.toString(),
                                packageId: packageId.toString(),
                                reasonId: reasonId,
                              ),
                            );
                          },
                        );
                      },
                    );
                  },
                ).paddingOnly(bottom: 10.h),
                AppText(
                  data: AppStrings.orderDetail,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                ).paddingOnly(left: 10.w),
                OrderDetailSection(
                  total: res.toBeDeliveredGrandTotal.toString(),
                ).paddingSymmetric(horizontal: 5.w, vertical: 10.h),
              ],
            );
          }
        }
        return Container();
      },
    );
  }
}
