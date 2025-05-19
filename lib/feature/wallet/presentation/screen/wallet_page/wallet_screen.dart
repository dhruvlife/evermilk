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
import 'package:milkride/feature/wallet/presentation/cubit/wallet/wallet_cubit.dart';
import 'package:milkride/feature/wallet/presentation/screen/wallet_page/widget/pay_list_tile.dart';
import 'package:milkride/feature/wallet/presentation/screen/wallet_page/widget/wallet_history_section.dart';
import 'package:milkride/feature/wallet/presentation/screen/wallet_page/widget/wallet_loader.dart';
import 'package:milkride/feature/wallet/presentation/screen/wallet_page/widget/wallet_top_setion.dart';
import 'package:milkride/service/injection.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({super.key});
  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  final cubit = getIt<WalletCubit>();
  @override
  void initState() {
    fetchResponse();
    super.initState();
  }
  void fetchResponse() async{
   await context.read<WalletCubit>().getWalletResponse();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        title: AppStrings.walletTitle,
        iconPrefix: Icons.arrow_back_ios,
        showAction: false,
      ),
      body: BlocBuilder<WalletCubit, WalletState>(
        builder: (context, state) {
          if (state is WalletLoading) {
            return WalletLoader();
          } else if (state is WalletError) {
            return NetworkFailCard(messege: state.message,isButtonRequired: true,buttonText: AppStrings.retry,onButtontap:()=>context.read<WalletCubit>().getWalletResponse());
          } else if (state is WalletLoaded) {
            final walletHistory = state.walletResponse.data?.walletHistory ?? [];
            return RefreshIndicator(
              onRefresh:()=>context.read<WalletCubit>().getWalletResponse(),
              color: AppColors.white,
              backgroundColor: AppColors.success,
              child: Column(
                children: [
                  WalletPageTopSection(
                    customerWalletData: state.walletResponse.data?.customerWalletData,
                  ).paddingSymmetric(horizontal: 10.w),
                  WalletHistorySection().paddingSymmetric(vertical: 10.h),
                  CommonContainer(
                    widget: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText(
                          data: AppStrings.recentHistory,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                        ).paddingOnly(left: 15.w, top: 10.h),
                      ],
                    ),
                    height: 50.h,
                    width: 1.sw,
                  ).paddingSymmetric(),
                  Expanded(
                      child: ListView.builder(
                          itemCount: walletHistory.length,
                          itemBuilder: (context, index) {
                            return PaymentListTile(
                                walletHistory: walletHistory[index]);
                          }))
                ],
              ),
            );
          }
          return Center(child: Text(AppStrings.unExpectedError));
        },
      ).paddingSymmetric(vertical: 10.h),
    );
  }
}

