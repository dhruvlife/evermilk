import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:milkride/core/common/common_app_bar.dart';
import 'package:milkride/core/constant/app_strings.dart';
import 'package:milkride/core/routes/routes_name.dart';
import 'package:milkride/core/storage/storage_key.dart';
import 'package:milkride/core/storage/storage_object.dart';
import 'package:milkride/feature/all_product/presentation/cubit/all_product_cubit.dart';
import 'package:milkride/feature/all_product/presentation/screen/widgets/cat_wise_product.dart';
import 'package:milkride/feature/all_product/presentation/screen/widgets/category_sidemenu.dart';

class AllProductScreen extends StatefulWidget {
  final void Function()? onBack;
  const AllProductScreen({super.key, required this.onBack});
  @override
  State<AllProductScreen> createState() => _AllProductScreenState();
}

class _AllProductScreenState extends State<AllProductScreen> {
  late AllProductCubit cubit;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    cubit = context.read<AllProductCubit>();
    final userId = int.parse(StorageObject.readData(StorageKeys.userId));
    cubit.init(userId);
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {if (!didPop) widget.onBack?.call();},
      child: Column(
        children: [
          CommonAppBar(
            title: AppStrings.allProducts,
            onIconPressed: widget.onBack,
            onActionPressed: () => Get.toNamed(RoutesName.cartPage),
            actionIcon: Icons.shopping_cart,
            iconPrefix: Icons.arrow_back_ios,
          ),
          Expanded(
            child: Row(
              children: [
                BlocBuilder<AllProductCubit, AllProductState>(
                  builder: (context, state) {
                    return CategorySideMenu(
                      selectedCategoryId: cubit.selectedCategoryId ?? 0,
                      onTap: (categoryId) =>
                          cubit.onCategorySelected(selectedCatId: categoryId),
                    );
                  },
                ),
                Expanded(child: CategoryWiseProduct()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
