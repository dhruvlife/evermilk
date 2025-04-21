import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:milkride/feature/auth/data/repository/auth_impl_repo.dart';
import 'package:milkride/feature/auth/data/repository/auth_remote_repo.dart';
import 'package:milkride/feature/auth/domain/repository/auth_repository.dart';
import 'package:milkride/feature/auth/domain/usecase/area_by_region_usecase.dart';
import 'package:milkride/feature/auth/domain/usecase/otp_usecase.dart';
import 'package:milkride/feature/auth/domain/usecase/register_usecase.dart';
import 'package:milkride/feature/auth/domain/usecase/resend_otp_usecase.dart';
import 'package:milkride/feature/auth/domain/usecase/signin_usecase.dart';
import 'package:milkride/feature/auth/domain/usecase/signup_data_usecase.dart';
import 'package:milkride/feature/auth/presentaion/cubit/area/area_cubit.dart';
import 'package:milkride/feature/auth/presentaion/cubit/auth/auth_cubit.dart';
import 'package:milkride/feature/auth/presentaion/cubit/signup/sigup_data_cubit.dart';
import 'package:milkride/feature/cart/data/repository/cart_impl_repo.dart';
import 'package:milkride/feature/cart/data/repository/cart_remote_repo.dart';
import 'package:milkride/feature/cart/domain/repository/cart_repository.dart';
import 'package:milkride/feature/cart/domain/usecase/cart_page_usecase.dart';
import 'package:milkride/feature/cart/domain/usecase/cart_qty_update_usecase.dart';
import 'package:milkride/feature/cart/domain/usecase/remove_item_cart_usecase.dart';
import 'package:milkride/feature/cart/domain/usecase/subscription_usecase.dart';
import 'package:milkride/feature/cart/presentation/cubit/cart/cart_cubit.dart';
import 'package:milkride/feature/cart/presentation/cubit/subscribe/subscribe_cubit.dart';
import 'package:milkride/feature/home/data/repository/home_impl_repo.dart';
import 'package:milkride/feature/home/data/repository/home_remote_repo.dart';
import 'package:milkride/feature/home/domain/repository/home_repository.dart';
import 'package:milkride/feature/home/domain/usecase/home_usecase.dart';
import 'package:milkride/feature/home/presentation/cubit/home_cubit.dart';
import 'package:milkride/feature/order/data/repository/order_impl_repo.dart';
import 'package:milkride/feature/order/data/repository/order_remote_repo.dart';
import 'package:milkride/feature/order/domain/repository/order_repository.dart';
import 'package:milkride/feature/order/domain/usecase/order_cancel_usecase.dart';
import 'package:milkride/feature/order/domain/usecase/order_get_usecase.dart';
import 'package:milkride/feature/order/domain/usecase/order_place_usecase.dart';
import 'package:milkride/feature/order/presentation/cubit/order_cubit.dart';
import 'package:milkride/feature/product/data/repository/product_impl_repo.dart';
import 'package:milkride/feature/product/data/repository/product_remote_repo.dart';
import 'package:milkride/feature/product/domain/repository/product_repository.dart';
import 'package:milkride/feature/product/domain/usecase/all_category_usecase.dart';
import 'package:milkride/feature/product/domain/usecase/category_products_usecase.dart';
import 'package:milkride/feature/product/domain/usecase/product_usecase.dart';
import 'package:milkride/feature/product/domain/usecase/product_variants_usecase.dart';
import 'package:milkride/feature/product/presentation/cubit/category_all/all_category_cubit.dart';
import 'package:milkride/feature/product/presentation/cubit/category_product/category_product_cubit.dart';
import 'package:milkride/feature/product/presentation/cubit/product_detail/prod_detail_cubit.dart';
import 'package:milkride/feature/product/presentation/cubit/product_variants/product_variant_cubit.dart';
import 'package:milkride/service.dart/api_service.dart';

final GetIt getIt = GetIt.instance;

void setupLocator() {
  // api
  final ApiService apiServices = ApiService(Dio());
  getIt.registerLazySingleton(() => apiServices);

  // auth
  getIt.registerSingleton<AuthRemoteRepo>(AuthImplRemoteRepo(apiService: getIt()));
  getIt.registerSingleton<AuthRepository>(AuthImplRepo(authRemoteRepo: getIt()));
  getIt.registerLazySingleton(() => SignInUsecase(authRepository: getIt()));
  getIt.registerLazySingleton(() => OtpUsecase(authRepository: getIt()));
  getIt.registerLazySingleton(() => SignupDataUsecase(authRepository: getIt()));
  getIt.registerLazySingleton(() => AreaByRegionUsecase(authRepository: getIt()));
  getIt.registerLazySingleton(() => RegisterUsecase(authRepository: getIt()));
  getIt.registerLazySingleton(() => ResendOtpUsecase(authRepository: getIt()));
  getIt.registerLazySingleton(() => AreaCubit(areaByRegionUsecase: getIt()));
  getIt.registerLazySingleton(() => SignupDataCubit(signupDataUsecase: getIt()));

  getIt.registerLazySingleton(() => AuthCubit(
        signInUsecase: getIt(),
        otpUsecase: getIt(),
        resendOtpUsecase: getIt(),
        registerUsecase: getIt(),
      ));

  getIt.registerSingleton<HomeRemoteRepo>(HomeImplRemoteRepo(apiService: getIt()));
  getIt.registerSingleton<HomeRepository>(HomeImplRepo(homeRemoteRepo: getIt()));
  getIt.registerLazySingleton(() => HomeUsecase(homeRepository: getIt()));
  getIt.registerLazySingleton(() => HomeCubit(homeUsecase: getIt()));

  // all category
  getIt.registerSingleton<ProductRemoteRepo>(ProductImplRemoteRepo(apiService: getIt()));
  getIt.registerSingleton<ProductRepository>(ProductImplRepo(productRemoteRepo: getIt()));
  getIt.registerLazySingleton(() => AllCategoryUsecase(categoryRepository: getIt()));
  getIt.registerLazySingleton(() => CategoryProductsUsecase(productRepository: getIt()));
  getIt.registerLazySingleton(() => ProductDetailUsecase(productRepository: getIt()));
  getIt.registerLazySingleton(() => ProductVariantsUsecase(productRepository: getIt()));
  getIt.registerLazySingleton(() => AllCategoryCubit(allCategoryUsecase: getIt()));
  getIt.registerLazySingleton(() => CategoryProductsCubit(categoryProductsUsecase: getIt()));
  getIt.registerLazySingleton(() => ProdDetailCubit(productDetailUsecase: getIt()));
  getIt.registerLazySingleton(() => ProductVariantCubit(productVariantsUsecase: getIt()));

  //cart
  getIt.registerSingleton<CartRemoteRepo>(CartImplRemoteRepo(apiService: getIt()));
  getIt.registerSingleton<CartRepository>(CartImplRepo(cartRemoteRepo: getIt()));
  getIt.registerLazySingleton(() => CartPageUsecase(cartRepository: getIt()));
  getIt.registerLazySingleton(() => CartQtyUpdateUsecase(cartRepository: getIt()));
  getIt.registerLazySingleton(() => RemoveItemCartUsecase(cartRepository: getIt()));
  getIt.registerLazySingleton(() => SubscriptionUsecase(cartRepository: getIt()));
  getIt.registerLazySingleton(() => CartPageCubit(
      cartPageUsecase: getIt(),
      cartQtyUpdateUsecase: getIt(),
      removeItemCartUsecase: getIt(),
      subscriptionUsecase: getIt()));

  // order 
  getIt.registerSingleton<OrderRemoteRepo>(OrderImplRemoteRepo(apiService: getIt()));
  getIt.registerSingleton<OrderRepository>(OrderImplRepo(orderRemoteRepo: getIt()));
  getIt.registerLazySingleton(() => OrderUsecase(orderRepository: getIt()));
  getIt.registerLazySingleton(() => OrderGetUsecase(orderRepository: getIt()));
  getIt.registerLazySingleton(() => OrderCancelUsecase(orderRepository: getIt()));
  getIt.registerLazySingleton(() => OrderCubit(orderUsecase: getIt(), orderGetUsecase: getIt(), orderCancelUsecase: getIt()));
  getIt.registerLazySingleton(() => SubscriptionCubit(subscriptionUsecase: getIt()));
}
