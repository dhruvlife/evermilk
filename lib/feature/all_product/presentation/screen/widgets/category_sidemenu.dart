import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:milkride/core/common/app_network_image.dart';
import 'package:milkride/core/common/app_text.dart';
import 'package:milkride/core/constant/app_colors.dart';
import 'package:milkride/core/constant/app_strings.dart';
import 'package:milkride/core/key/app_images.dart';
import 'package:milkride/core/storage/storage_key.dart';
import 'package:milkride/core/storage/storage_object.dart';
import 'package:milkride/feature/all_product/presentation/screen/widgets/all_cat_loader.dart';
import 'package:milkride/feature/product/domain/entities/categories.dart';
import 'package:milkride/feature/product/presentation/cubit/category_all/all_category_cubit.dart';
import 'package:milkride/feature/product/presentation/cubit/category_all/all_category_state.dart';
import 'package:milkride/service/injection.dart';

class CategorySideMenu extends StatefulWidget {
  final int selectedCategoryId;
  final Function(int) onTap;
  const CategorySideMenu({
    super.key,
    required this.selectedCategoryId,
    required this.onTap,
  });
  @override
  State<CategorySideMenu> createState() => _CategorySideMenuState();
}

class _CategorySideMenuState extends State<CategorySideMenu> {
  final cubit = getIt<AllCategoryCubit>();
  @override
  void initState() {
    fetchCategories();
    super.initState();
  }

  void fetchCategories() async {
    await context.read<AllCategoryCubit>().fetchCategories(userId: int.parse(StorageObject.readData(StorageKeys.userId)));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 75.w,
      color: AppColors.light,
      child: BlocBuilder<AllCategoryCubit, CategoryState>(
        builder: (context, state) {
          if (state is CategoryLoading || state is CategoryError) {
            return AllCategoryLoad();
          } else if (state is CategoryError) {
            return AllCategoryLoad();
          } else if (state is CategoryLoaded) {
            final List<Categories> categoryList = [
              Categories(
                  id: 0, name: AppStrings.all, imageUrl: AppImages.logoUrl),
              ...(state.response.categories ?? [])];
            return ListView.builder(
              padding: EdgeInsets.symmetric(vertical: 5.h),
              itemCount: categoryList.length,
              itemBuilder: (context, index) {
                final category = categoryList[index];
                final isSelected = widget.selectedCategoryId == (category.id ?? 0);
                return GestureDetector(
                  onTap: () => widget.onTap(category.id ?? 0),
                  child: Container(
                    color: AppColors.white,
                    child: Stack(
                      children: [
                        Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 50.h,
                                width: 50.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25.r),
                                  border: Border.all(
                                    color: isSelected ? AppColors.success : AppColors.lightGrey,
                                    width: 1.5,
                                  )),
                                child: AppNetWorkImage(
                                  image: category.imageUrl ?? "",
                                  height: 45.h,
                                  width: 45.w,
                                  radius: BorderRadius.circular(25.r)).paddingAll(2.sp),
                              ).paddingOnly(bottom: 10.h),
                              AppText(
                                data: category.name.toString(),
                                fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                                color: isSelected ? AppColors.success : Colors.black,
                                fontSize: 8.sp)],
                          ).paddingSymmetric(vertical: 5.h, horizontal: 5.w),
                        ),
                        if (isSelected)
                          Positioned(
                            right: 0,
                            top: 5.h,
                            bottom: 5.h,
                            child: Container(
                              width: 4.w,
                              decoration: BoxDecoration(
                                color: AppColors.success,
                                borderRadius: BorderRadius.only(topLeft: Radius.circular(4.r),bottomLeft: Radius.circular(4.r)),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ).paddingSymmetric(vertical: 3.h).paddingOnly(right: 6.w),
                );
              },
            );
          }
          return Container();
        },
      ),
    );
  }
}

