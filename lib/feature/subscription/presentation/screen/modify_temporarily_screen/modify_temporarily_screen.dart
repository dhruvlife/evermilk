import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:milkride/core/common/app_text.dart';
import 'package:milkride/core/common/app_textfield.dart';
import 'package:milkride/core/common/common_app_bar.dart';
import 'package:milkride/core/constant/app_colors.dart';
import 'package:milkride/core/constant/app_strings.dart';
import 'package:milkride/core/utils/app_functional_components.dart';
import 'package:milkride/feature/product/presentation/screen/option_sheet/widgets/delivery_button.dart';
import 'package:milkride/feature/subscription/domain/entity/sub_detail.dart';
import 'package:milkride/feature/subscription/presentation/cubit/modify_temp/modify_temp_cubit.dart';
import 'package:milkride/feature/subscription/presentation/screen/modify_temporarily_screen/widgets/modify_qty_label.dart';
import 'package:milkride/feature/subscription/presentation/screen/modify_temporarily_screen/widgets/modify_temp_loader.dart';
import 'package:milkride/feature/subscription/presentation/screen/modify_temporarily_screen/widgets/sub_prod_card.dart';
import 'package:milkride/feature/subscription/presentation/screen/modify_temporarily_screen/widgets/update_sub_button.dart';

class ModifyTemporarilyScreen extends StatelessWidget {
  final SubScriptionDetail prod;
  const ModifyTemporarilyScreen({super.key, required this.prod});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        title: AppStrings.modifyTemp,
        showAction: false,
        iconPrefix: Icons.arrow_back_ios,
        onIconPressed: () {
          Get.back();
        },
      ),
      body: BlocBuilder<ModifyTempCubit, ModifyTempState>(
        builder: (context, state) {
          final cubit = context.read<ModifyTempCubit>();
          if (state is ModifyTempLoading) {
            return ModifyLoader();
          }
          if (state is ModifyTempError) {
            return Center(
              child: AppText(
                data:state.message,
                color: AppColors.error,
              ),
            );
          }
          if (state is ModifyTemporarilyState) {
            final startDateController = TextEditingController(text: AppFunctionalComponents.formatDate(date: state.selectedDate));
            final endDateController = TextEditingController(text: AppFunctionalComponents.formatDate(date: state.toDate));
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SubProdCard(
                  imageUrl: prod.imageUrl ?? "",
                  tag: prod.deliveryType ?? "",
                  productName: prod.productName ?? "",
                  quantity: state.quantity,
                  price: '₹${prod.salePrice}',
                  oldPrice: '₹${prod.mrpPrice}',
                  onIncreaseQuant: cubit.increaseQuantity,
                  onReduceQuant: cubit.decreaseQuantity,
                ).paddingOnly(bottom: 15.h),
                AppText(
                  data: AppStrings.pickType,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ).paddingOnly(bottom: 5.h),
                Row(
                  children: [
                    SelectedButton(
                      onPressed: () => cubit.toggleDayType(value: true, prod: prod),
                      data: AppStrings.singleDay,
                      isSlected: state.isSingleDay,
                      btnWidth: 0.3 * MediaQuery.of(context).size.width,
                    ),
                    SizedBox(width: 10),
                    SelectedButton(
                      onPressed: () => cubit.toggleDayType(value: false, prod: prod),
                      data: AppStrings.multipleDay,
                      isSlected: !state.isSingleDay,
                      btnWidth: 0.3 * MediaQuery.of(context).size.width,
                    ),
                  ],
                ).paddingOnly(bottom: 10.h),
                AppText(
                  data:"Choose ${state.isSingleDay ? AppStrings.date : AppStrings.startAndEndDate}",
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ).paddingOnly(bottom: 5.h),
                Row(
                  children: [
                    Expanded(
                      child: AppTextField(
                        suffixIcon: Icon(Icons.calendar_month, size: 20),
                        needBorder: false,
                        hintText: AppStrings.startDate,
                        isReadonly: true,
                        controller: startDateController,
                        ontap: () => cubit.selectModifyDate(
                          context: context,
                          isStart: true,
                          fromDate: prod.startDate ?? '',
                          toDate: prod.endDate ?? '',
                        ),
                      ),
                    ),
                    if (!state.isSingleDay) ...[
                      SizedBox(width: 12),
                      Expanded(
                        child: AppTextField(
                          suffixIcon: Icon(Icons.calendar_month, size: 20),
                          needBorder: false,
                          hintText: AppStrings.endDate,
                          isReadonly: true,
                          controller: endDateController,
                          ontap: () => cubit.selectModifyDate(
                            context: context,
                            isStart: false,
                            fromDate: prod.startDate ?? '',
                            toDate: prod.endDate ?? '',
                          ),
                        ),
                      ),
                    ],
                  ],
                ).paddingOnly(bottom: 5.h),
                ModifyQtyLabel(
                  isSingleDay: state.isSingleDay,
                  qty: state.quantity,
                  fromDate: state.selectedDate,
                  toDate: state.toDate),
                Spacer(),
                UpdateSubButton(onPressed: () => cubit.modifyTempSubscription(subscriptionId: prod.id.toString())),
              ],
            ).paddingAll(10);
          }
          return ModifyLoader();
        },
      ),
    );
  }
}
