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
    context.read<ProdDetailCubit>().fetchProductDetail(
          prodDetailParam: widget.prodDetailParam,
        );
  }

  @override
  Widget build(BuildContext context) {
    final addCartCubit = context.read<CartPageCubit>();
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {
                  Get.toNamed(RoutesName.cartPage);
                },
                icon: Icon(Icons.shopping_cart, size: 18.sp))
          ],
          title: AppText(
              data: AppStrings.prodDetailTitle, fontWeight: FontWeight.w700)),
      body: BlocBuilder<ProdDetailCubit, ProdDetailState>(
        builder: (context, state) {
          if (state is ProdDetailLoading) {
            return LodingIndicator();
          } else if (state is ProdDetailError) {
            return Center(child: Text(state.message));
          } else if (state is ProdDetailLoaded) {
            final cubit = context.read<ProdDetailCubit>();
            final variantList = state.response.data?.filteredPackages ?? [];
            final selected = state.selectedVariant;
            if (selected == null) {
              return const Center(child: Text(AppStrings.packNotExist));
            }
            return SizedBox(
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
                      String customerId =
                          context.read<HomeCubit>().userData?.id.toString() ??
                              "";
                      String userId =
                          StorageObject.readData(StorageKeys.userId);
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
            );
          }
          return NetworkFailCard(messege: AppStrings.unExpectedError);
        },
      ),
    );
  }
}
