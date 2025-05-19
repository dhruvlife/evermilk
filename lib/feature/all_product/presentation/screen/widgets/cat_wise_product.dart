import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:milkride/core/common/network_fail_card.dart';
import 'package:milkride/core/constant/app_colors.dart';
import 'package:milkride/core/constant/app_strings.dart';
import 'package:milkride/core/routes/routes_name.dart';
import 'package:milkride/core/storage/storage_key.dart';
import 'package:milkride/core/storage/storage_object.dart';
import 'package:milkride/core/utils/app_functional_components.dart';
import 'package:milkride/feature/all_product/presentation/cubit/all_product_cubit.dart';
import 'package:milkride/feature/all_product/presentation/screen/widgets/all_product_loader.dart';
import 'package:milkride/feature/all_product/presentation/screen/widgets/search_bar.dart';
import 'package:milkride/feature/home/presentation/screen/widgets/product_card_vertical.dart';
import 'package:milkride/feature/product/domain/entities/product.dart';
import 'package:milkride/feature/product/domain/usecase/product_usecase.dart';
import 'package:milkride/feature/product/presentation/cubit/category_all/all_category_cubit.dart';
import 'package:milkride/feature/product/presentation/screen/option_sheet/product_option_sheet.dart';
import 'package:milkride/service/injection.dart';

class CategoryWiseProduct extends StatelessWidget {
  const CategoryWiseProduct({super.key});
  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<AllProductCubit>();
    return BlocBuilder<AllProductCubit, AllProductState>(
      builder: (context, state) {
        List<Product> productList;
        if (state is AllProductLoading) {
          return const AllProductLoader();
        } else if (state is AllProductError) {
          return NetworkFailCard(
            messege: state.message,
            isButtonRequired: true,
            buttonText: AppStrings.retry,
            onButtontap: () {
              cubit.init(int.parse(StorageObject.readData(StorageKeys.userId)));
              context.read<AllCategoryCubit>().fetchCategories(userId: int.parse(StorageObject.readData(StorageKeys.userId)));
            },
          );
        } else {
          productList =
              cubit.isSearching ? cubit.searchProducts : cubit.products;
          return Column(
            children: [
              if (cubit.selectedCategoryId == 0)
                SerchBar(searchController: cubit.searchController),
              Expanded(
                child: productList.isEmpty
                    ? Center(child: Text(AppStrings.noProdFound))
                    : RefreshIndicator(
                      backgroundColor: AppColors.success,
                      color: AppColors.white,
                        onRefresh: () async {
                          cubit.fetchAllProducts();
                          getIt<AllCategoryCubit>().fetchCategories(userId:StorageObject.readData(StorageKeys.userId));
                        },
                        child: GridView.builder(
                          controller: cubit.scrollController,
                          padding: EdgeInsets.all(10),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            childAspectRatio: 0.7,
                          ),
                          itemCount: productList.length,
                          itemBuilder: (context, index) {
                            final product = productList[index];
                            return ProductCardVertical(
                              onAdd: () {
                                FocusScope.of(context).unfocus();
                                final customerId = cubit.customerId;
                                AppFunctionalComponents.showSheet(
                                  builder: (context) => ProductOptionSheet(
                                    prodDetailParam: ProdDetailParam(
                                      productId: product.productId.toString(),
                                      customerId: customerId.toString())));},
                              prod: product,
                              onTapProd: () {
                                FocusScope.of(context).unfocus();
                                Get.toNamed(
                                  RoutesName.productDetail,
                                  arguments: ProdDetailParam(
                                    productId: product.productId.toString(),
                                    customerId: cubit.customerId,
                                  ),
                                );
                              },
                              imageHeight: 120,
                            );
                          },
                        ),
                      ),
              ),
            ],
          );
        }
      },
    );
  }
}
