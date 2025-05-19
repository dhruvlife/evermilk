import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:milkride/core/common/common_app_bar.dart';
import 'package:milkride/core/common/network_fail_card.dart';
import 'package:milkride/core/common/no_order_found_card.dart';
import 'package:milkride/core/constant/app_colors.dart';
import 'package:milkride/core/constant/app_strings.dart';
import 'package:milkride/core/storage/storage_key.dart';
import 'package:milkride/core/storage/storage_object.dart';
import 'package:milkride/feature/subscription/presentation/cubit/scuscribe_view/subscribe_view_cubit.dart';
import 'package:milkride/feature/subscription/presentation/screen/subscription_screen/widgets/subscription_view_product_cart.dart';
import 'package:milkride/feature/subscription/presentation/screen/subscription_screen/widgets/subsription_screen_loader.dart';
import 'package:milkride/service/injection.dart';

class SubscriptionViewScreen extends StatefulWidget {
  final void Function()? onIconPressed;
  const SubscriptionViewScreen({super.key, required this.onIconPressed});
  @override
  State<SubscriptionViewScreen> createState() => _SubscriptionViewScreenState();
}

class _SubscriptionViewScreenState extends State<SubscriptionViewScreen> {
  final subCubit = getIt<SubscribeViewCubit>();
  final customerId = StorageObject.readData(StorageKeys.customerId);
  final userId = StorageObject.readData(StorageKeys.userId);
  @override
  void initState() {
    subCubit.fetchSubscribeView();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
          title: AppStrings.subscribePageAppBarTitle,
          showAction: false,
          iconPrefix: Icons.arrow_back_ios,
          onIconPressed: widget.onIconPressed),
      body: PopScope(
      canPop: false,
      onPopInvoked: (didPop) {if (!didPop) widget.onIconPressed?.call();},
        child: BlocBuilder<SubscribeViewCubit, SubscribeViewState>(
          builder: (context, state) {
            if (state is SubscribeViewLoading) {
              return SubViewLoader();
            } else if (state is SubscribeViewError) {
              return NetworkFailCard(
                  messege: state.message,
                  isButtonRequired: true,
                  buttonText: AppStrings.retry,
                  onButtontap: () => context.read<SubscribeViewCubit>().fetchSubscribeView());
            } else if (state is SubscribeViewLoaded) {
              final res = state.subscribeResponse ?? [];
              return RefreshIndicator(
                backgroundColor: AppColors.success,
                color: AppColors.white,
                onRefresh: () => context.read<SubscribeViewCubit>().fetchSubscribeView(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    res.isEmpty
                        ? CommonEmptyCard(
                            messege: AppStrings.noSubscriptionFound,
                            icon: Icons.shopping_cart)
                        : Expanded(
                            child: ListView.builder(
                              itemCount: res.length,
                              itemBuilder: (context, index) {
                                return SubscriptionViewProductCard(prod: res[index]);
                              },
                            ),
                          ),
                  ],
                ),
              );
            }
            return SizedBox();
          },
        ).paddingSymmetric(horizontal: 15.w, vertical: 10.h),
      ),
    );
  }
}
