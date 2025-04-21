import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:milkride/core/common/app_text.dart';
import 'package:milkride/core/common/loding_indicator.dart';
import 'package:milkride/core/common/network_fail_card.dart';
import 'package:milkride/core/constant/app_strings.dart';
import 'package:milkride/core/routes/routes_name.dart';
import 'package:milkride/core/storage/storage_key.dart';
import 'package:milkride/core/storage/storage_object.dart';
import 'package:milkride/feature/home/presentation/screen/widgets/categories_product_card.dart';
import 'package:milkride/feature/product/presentation/cubit/category_all/all_category_cubit.dart';
import 'package:milkride/feature/product/presentation/cubit/category_all/all_category_state.dart';

class AllCategoryPage extends StatefulWidget {
  const AllCategoryPage({super.key});
  @override
  State<AllCategoryPage> createState() => _AllCategoryPageState();
}

class _AllCategoryPageState extends State<AllCategoryPage> {
  @override
  void initState() {
    getAllCategories();
    super.initState();
  }
  void getAllCategories() async {
    final userId = StorageObject.readData(StorageKeys.userId);
    await context
        .read<AllCategoryCubit>()
        .fetchCategories(userId: int.parse(userId));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: AppText(
            data: AppStrings.categoryPageTitle,
            fontWeight: FontWeight.w700,
          ),
          centerTitle: true),
      body: BlocBuilder<AllCategoryCubit, CategoryState>(
        builder: (context, state) {
          if (state is CategoryLoading) {
            return LodingIndicator();
          } else if (state is CategoryError) {
            NetworkFailCard(messege:state.message);
          } else if (state is CategoryLoaded) {
            final category = state.response.categories;
            return Column(
              children: [
                Expanded(
                    child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            mainAxisSpacing: 10.h, crossAxisCount: 3),
                        itemCount: category?.length,
                        itemBuilder: (context, index) {
                          return CategoriesProductCard(
                              height: 100.h,
                              width: 100.w,
                              categoryProd: category![index],
                              onTapCategory: () {
                                Get.toNamed(RoutesName.categoeyProds,arguments: category[index]);
                              });
                        }))
              ],
            );
          }
          return NetworkFailCard(messege:AppStrings.error);
        },
      ),
    );
  }
}
