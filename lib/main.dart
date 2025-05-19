import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:milkride/core/common/loding_indicator.dart';
import 'package:milkride/core/constant/app_strings.dart';
import 'package:milkride/core/routes/app_routes.dart';
import 'package:milkride/core/routes/routes_name.dart';
import 'package:milkride/feature/all_product/presentation/cubit/all_product_cubit.dart';
import 'package:milkride/feature/auth/presentaion/cubit/area/area_cubit.dart';
import 'package:milkride/feature/auth/presentaion/cubit/auth/auth_cubit.dart';
import 'package:milkride/feature/auth/presentaion/cubit/signup/sigup_data_cubit.dart';
import 'package:milkride/feature/cart/presentation/cubit/cart/cart_cubit.dart';
import 'package:milkride/feature/profile/presentation/cubit/profile_cubit.dart';
import 'package:milkride/feature/subscription/presentation/cubit/modify_permenant/modify_permenant_cubit.dart';
import 'package:milkride/feature/subscription/presentation/cubit/modify_temp/modify_temp_cubit.dart';
import 'package:milkride/feature/subscription/presentation/cubit/scuscribe_view/subscribe_view_cubit.dart';
import 'package:milkride/feature/subscription/presentation/cubit/subscribe_create/subscribe_cubit.dart';
import 'package:milkride/feature/home/presentation/cubit/home_cubit.dart';
import 'package:milkride/feature/order/presentation/cubit/order_cubit.dart';
import 'package:milkride/feature/product/presentation/cubit/category_all/all_category_cubit.dart';
import 'package:milkride/feature/product/presentation/cubit/category_product/category_product_cubit.dart';
import 'package:milkride/feature/product/presentation/cubit/product_detail/prod_detail_cubit.dart';
import 'package:milkride/feature/product/presentation/cubit/product_variants/product_variant_cubit.dart';
import 'package:milkride/feature/wallet/presentation/cubit/billing_history/billing_history_cubit.dart';
import 'package:milkride/feature/wallet/presentation/cubit/payment/payment_cubit.dart';
import 'package:milkride/feature/wallet/presentation/cubit/recharge_history/recharge_history_cubit.dart';
import 'package:milkride/feature/wallet/presentation/cubit/wallet/wallet_cubit.dart';
import 'package:milkride/service/injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<AuthCubit>()),
        BlocProvider(create: (context) => getIt<AreaCubit>()),
        BlocProvider(create: (context) => getIt<SignupDataCubit>()),
        BlocProvider(create: (context) => getIt<HomeCubit>()),
        BlocProvider(create: (context) => getIt<AllCategoryCubit>()),
        BlocProvider(create: (context) => getIt<CategoryProductsCubit>()),
        BlocProvider(create: (context) => getIt<ProdDetailCubit>()),
        BlocProvider(create: (context) => getIt<ProductVariantCubit>()),
        BlocProvider(create: (context) => getIt<CartPageCubit>()),
        BlocProvider(create: (context) => getIt<OrderCubit>()),
        BlocProvider(create: (context) => getIt<SubscriptionCubit>()),
        BlocProvider(create: (context) => getIt<SubscribeViewCubit>()),
        BlocProvider(create: (context) => getIt<ModifyTempCubit>()),
        BlocProvider(create: (context) => getIt<ModifyPermenantCubit>()),
        BlocProvider(create: (context) => getIt<WalletCubit>()),
        BlocProvider(create: (context) => getIt<RechargeHistoryCubit>()),
        BlocProvider(create: (context) => getIt<BillingHistoryCubit>()),
        BlocProvider(create: (context) => getIt<PaymentCubit>()),
        BlocProvider(create: (context) => getIt<AllProductCubit>()),
        BlocProvider(create: (context) => getIt<ProfileCubit>()),
      ],
      child: ScreenUtilInit(
        designSize: Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        child: GlobalLoaderOverlay(
          overlayWidgetBuilder: (_) {
            return LodingIndicator();
          },
          child: GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: AppStrings.appName,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
              useMaterial3: true,
            ),
            initialRoute: RoutesName.splash,
            getPages: AppRoutes.pages,
          ),
        ),
      ),
    );
  }
}
