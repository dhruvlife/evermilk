import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:milkride/core/common/app_text.dart';
import 'package:milkride/core/common/load_container.dart';
import 'package:milkride/core/common/network_fail_card.dart';
import 'package:milkride/core/constant/app_colors.dart';
import 'package:milkride/core/constant/app_strings.dart';
import 'package:milkride/core/routes/routes_name.dart';
import 'package:milkride/core/storage/storage_key.dart';
import 'package:milkride/core/storage/storage_object.dart';
import 'package:milkride/feature/cart/domain/usecase/subscription_usecase.dart';
import 'package:milkride/feature/cart/presentation/cubit/cart/cart_cubit.dart';
import 'package:milkride/feature/home/presentation/cubit/home_cubit.dart';
import 'package:milkride/feature/product/domain/usecase/product_usecase.dart';
import 'package:milkride/feature/product/presentation/cubit/product_detail/prod_detail_cubit.dart';
import 'package:milkride/feature/product/presentation/cubit/product_detail/prod_detail_state.dart';
import 'package:milkride/feature/product/presentation/screen/product_detail/widgets/prod_detail_page_section.dart';
import 'package:milkride/feature/product/presentation/screen/product_detail/widgets/product_add_to_cart_button.dart';

class ProductDetailPage extends StatefulWidget {
  final ProdDetailParam prodDetailParam;
  const ProductDetailPage({super.key, required this.prodDetailParam});
  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  @override
  void initState() {
    super.initState();
    context.read<ProdDetailCubit>().fetchProductDetail(prodDetailParam: widget.prodDetailParam);
  }

  @override
  Widget build(BuildContext context) {
    final addCartCubit = context.read<CartPageCubit>();
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () => Get.toNamed(RoutesName.cartPage),
                icon: Icon(Icons.shopping_cart, size: 18.sp))],
          title: AppText(data: AppStrings.prodDetailTitle, fontWeight: FontWeight.w700)),
      body: BlocBuilder<ProdDetailCubit, ProdDetailState>(
        builder: (context, state) {
          if (state is ProdDetailLoading) {
            return ProductDetailPageLoad();
          } else if (state is ProdDetailError) {
            return NetworkFailCard(messege: state.message, isButtonRequired:true,buttonText: AppStrings.retry,onButtontap: () => context.read<ProdDetailCubit>().fetchProductDetail(prodDetailParam: widget.prodDetailParam));
          } else if (state is ProdDetailLoaded) {
            final cubit = context.read<ProdDetailCubit>();
            final variantList = state.response.data?.filteredPackages ?? [];
            final selected = state.selectedVariant;
            if (selected == null) {
              return const Center(child: Text(AppStrings.packNotExist));
            }
            return RefreshIndicator(
              color: AppColors.white,
              backgroundColor: AppColors.success,
              onRefresh: () => context.read<ProdDetailCubit>().fetchProductDetail(prodDetailParam: widget.prodDetailParam),
              child: SizedBox(
                height: 1.sh,
                child: Stack(
                  alignment: AlignmentDirectional.bottomEnd,
                  children: [
                    ProdDetailPageSection(
                            selected: selected,
                            variantList: variantList,
                            cubit: cubit,
                            label: state.response.data?.morningCutoff ?? "",
                            quantity: state.quantity.toString(),
                            deliveryType: state.deliveryType)
                        .paddingSymmetric(horizontal: 10.w, vertical: 10.h),
                    ProductAddToCartButton(
                      selected: selected,
                      salePrice: selected.salePrice,
                      quantity: state.quantity,
                      onTap: () async {
                        String customerId = context.read<HomeCubit>().userData?.id.toString() ?? "";
                        String userId = StorageObject.readData(StorageKeys.userId);
                        await addCartCubit.addToCart(
                            subScribeCartParam: SubScribeCartParam(
                                customerId: customerId,
                                packageId: selected.id.toString(),
                                productId: selected.productId.toString(),
                                userId: userId,
                                frequencyType: 'one_time',
                                frequencyValue: '',
                                quantity: state.quantity.toString(),
                                schedule: '',
                                dayWiseQuantity: '',
                                deliveryType: state.deliveryType,
                                startDate: '',
                                endDate: '',
                                trialProduct: "0",
                                noOfUsages: "0"));
                      },
                    ).paddingSymmetric(horizontal: 10.w, vertical: 10.h),
                  ],
                ),
              ),
            );
          }
          return NetworkFailCard(messege: AppStrings.unExpectedError,isButtonRequired: true,);
        },
      ),
    );
  }
}


class ProductDetailPageLoad extends StatelessWidget {
  const ProductDetailPageLoad({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LoadContainer(height:250.h, width:1.sw,radius: 10.r).paddingSymmetric(horizontal: 10.w,vertical: 5.h),
        LoadContainer(height:10.h, width:1.sw,radius: 10.r).paddingSymmetric(horizontal: 10.w,vertical: 2.h),
        LoadContainer(height:15.h, width:0.4.sw,radius: 10.r).paddingSymmetric(horizontal: 10.w,vertical: 2.h),
        LoadContainer(height:15.h, width:0.4.sw,radius: 10.r).paddingSymmetric(horizontal: 10.w,vertical: 2.h),
        Row(
          children: [
            LoadContainer(height:80.h, width:0.3.sw,radius: 10.r).paddingSymmetric(horizontal: 5.w),
            LoadContainer(height:80.h, width:0.3.sw,radius: 10.r).paddingSymmetric(horizontal: 5.w),
          ],
        ).paddingSymmetric(vertical: 10.h),
        LoadContainer(height:30.h, width:0.3.sw,radius: 10.r).paddingSymmetric(horizontal: 10.w,vertical: 2.h),
        LoadContainer(height:60.h, width:1.sw,radius: 10.r).paddingSymmetric(horizontal: 10.w,vertical: 10.h),
        LoadContainer(height:30.h, width:0.3.sw,radius: 10.r).paddingSymmetric(horizontal: 10.w,vertical: 2.h),
        LoadContainer(height:30.h, width:0.3.sw,radius: 10.r).paddingSymmetric(horizontal: 10.w,vertical: 2.h),
      ],
    );
  }
}