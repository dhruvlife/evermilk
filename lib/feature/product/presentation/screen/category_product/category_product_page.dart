import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:milkride/core/common/app_text.dart';
import 'package:milkride/core/common/network_fail_card.dart';
import 'package:milkride/core/constant/app_strings.dart';
import 'package:milkride/core/routes/routes_name.dart';
import 'package:milkride/core/utils/operation.dart';
import 'package:milkride/feature/home/presentation/cubit/home_cubit.dart';
import 'package:milkride/feature/product/domain/entities/categories.dart';
import 'package:milkride/feature/product/presentation/cubit/category_product/category_product_cubit.dart';
import 'package:milkride/feature/product/presentation/cubit/category_product/category_product_state.dart';
import 'package:milkride/feature/product/presentation/screen/category_product/widgets/category_page_loader.dart';
import 'package:milkride/feature/product/presentation/screen/category_product/widgets/product_categoy_card.dart';

class CategoryProductPage extends StatefulWidget {
  final Categories? category;
  const CategoryProductPage({super.key, this.category});
  @override
  State<CategoryProductPage> createState() => _CategoryProductPageState();
}

class _CategoryProductPageState extends State<CategoryProductPage> {
  @override
  void initState() {
    getCatProds();
    super.initState();
  }
  void getCatProds() async {
    final customerId = context.read<HomeCubit>().userData?.id;
    await context.read<CategoryProductsCubit>().fetchCategoryProducts(
        categoryId: widget.category?.id.toString() ?? "",
        customerId: customerId?.toString() ?? "");
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: AppText(
            data: widget.category?.name ?? AppStrings.categoryPageTitle,
            fontWeight: FontWeight.w700,
          ),
          actions: [
            IconButton(
                onPressed: () {
                  Get.toNamed(RoutesName.cartPage);
                },
                icon: Icon(Icons.shopping_cart, size: 18.sp))
          ],
          centerTitle: true),
      body: BlocBuilder<CategoryProductsCubit, CategoryProductsState>(
        builder: (context, state) {
          if (state is CategoryProductsLoading) {
            return CategoryProductPageLoad();
          } else if (state is CategoryProductsLoaded) {
            final catProds = state.response.prodData;
            final uniqueProds = Operation.getUniqueProductsByProductId(
                products: catProds ?? []);
            return Column(
              children: [
                Expanded(
                    child: ListView.builder(
                        itemCount: uniqueProds.length,
                        itemBuilder: (context, index) {
                          return ProductCategoryCard(
                            product: uniqueProds[index],
                          );
                        }))
              ],
            ).paddingSymmetric(horizontal: 15.w);
          } else if (state is CategoryProductsError) {
            return NetworkFailCard(
              messege: state.message,isButtonRequired: true,
            );
          }
          return Container();
        },
      ),
    );
  }
}


