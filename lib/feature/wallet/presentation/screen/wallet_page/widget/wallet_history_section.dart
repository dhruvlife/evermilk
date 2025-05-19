import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:milkride/core/constant/app_strings.dart';
import 'package:milkride/core/routes/routes_name.dart';
import 'package:milkride/feature/wallet/presentation/screen/wallet_page/widget/wallet_history_button.dart';

class WalletHistorySection extends StatelessWidget {
  const WalletHistorySection({super.key});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        WalletHistoryButton(
          onPressed: () {
            Get.toNamed(RoutesName.rechargeHistory);
          },
          icon: Icons.history,
          label: AppStrings.rechargeHistory,
        ),
        WalletHistoryButton(
          onPressed: () {
            Get.toNamed(RoutesName.billingHistory);
          },
          icon: Icons.wallet_membership,
          label: AppStrings.billingHistory,
        ),
      ],
    );
  }
}