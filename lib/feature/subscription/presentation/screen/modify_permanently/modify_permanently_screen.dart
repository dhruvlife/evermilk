import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:milkride/core/common/app_label.dart';
import 'package:milkride/core/common/common_app_bar.dart';
import 'package:milkride/core/common/load_container.dart';
import 'package:milkride/core/common/no_order_found_card.dart';
import 'package:milkride/core/constant/app_strings.dart';
import 'package:milkride/feature/subscription/domain/entity/sub_detail.dart';
import 'package:milkride/feature/subscription/presentation/cubit/modify_permenant/modify_permenant_cubit.dart';
import 'package:milkride/feature/subscription/presentation/screen/modify_temporarily_screen/widgets/sub_prod_card.dart';
import 'package:milkride/feature/subscription/presentation/screen/modify_temporarily_screen/widgets/update_sub_button.dart';

class ModifyPermanentlyScreen extends StatelessWidget {
  final SubScriptionDetail prod;
  const ModifyPermanentlyScreen({super.key, required this.prod});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        title: AppStrings.modifyPermenent,
        showAction: false,
        iconPrefix: Icons.arrow_back_ios,
        onIconPressed: () => Get.back(),
      ),
      body: BlocBuilder<ModifyPermenantCubit, ModifyPermenantState>(
        builder: (context, state) {
          if (state is ModifyPermenantLoading) {
            return const ModifyPermanentlyLoader();
          }

          if (state is ModifyPermanentError) {
            return CommonEmptyCard(messege: state.message, icon:Icons.interests);
          }

          if (state is! ModifyPermanentlyLoaded) {
            return const SizedBox.shrink();
          }

          final cubit = context.read<ModifyPermenantCubit>();
          final formattedDate = DateFormat('dd/MM/yyyy').format(DateTime.now());

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
              AppLabel(
                height: 25.h,
                width: 1.sw,
                label: "${AppStrings.modifyPermenentLabel} from $formattedDate",
                labelSize: 8,
                borderRadius: BorderRadius.circular(8.r),
              ).paddingOnly(bottom: 10.h),
              const Spacer(),
              UpdateSubButton(
                onPressed: () {
                  cubit.modifyPermanentSubscription(subscriptionId: prod.id.toString());
                },
              ),
            ],
          ).paddingSymmetric(horizontal: 15.w, vertical: 10.h);
        },
      ),
    );
  }
}

class ModifyPermanentlyLoader extends StatelessWidget {
  const ModifyPermanentlyLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LoadContainer(height: 150.h, width:1.sw,radius: 10.r).paddingSymmetric(horizontal: 10.w,vertical: 5.h),
        LoadContainer(height: 150.h, width:1.sw,radius: 10.r).paddingSymmetric(horizontal: 10.w,vertical: 5.h),
        LoadContainer(height: 150.h, width:1.sw,radius: 10.r).paddingSymmetric(horizontal: 10.w,vertical: 5.h),
        LoadContainer(height: 20.h, width:1.sw,radius: 10.r).paddingSymmetric(horizontal: 10.w,vertical: 5.h),
      ],
    );
  }
}
