import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:milkride/feature/all_product/data/repository/all_product_impl_repository.dart';
import 'package:milkride/feature/all_product/data/repository/all_product_remote_repository.dart';
import 'package:milkride/feature/all_product/domain/repository/all_product_repository.dart';
import 'package:milkride/feature/all_product/domain/usecase/all_product_usecase.dart';
import 'package:milkride/feature/all_product/domain/usecase/search_usecase.dart';
import 'package:milkride/feature/all_product/presentation/cubit/all_product_cubit.dart';
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
import 'package:milkride/feature/profile/data/repository/profile_impl_repo.dart';
import 'package:milkride/feature/profile/data/repository/profile_remote_repo.dart';
import 'package:milkride/feature/profile/domain/repository/profile_repository.dart';
import 'package:milkride/feature/profile/domain/usecase/profile_usecase.dart';
import 'package:milkride/feature/profile/domain/usecase/vacation_usecase.dart';
import 'package:milkride/feature/profile/presentation/cubit/profile_cubit.dart';
import 'package:milkride/feature/subscription/data/repository/subscription_impl_repo.dart';
import 'package:milkride/feature/subscription/data/repository/subscription_remote_repo.dart';
import 'package:milkride/feature/subscription/domain/repository/subscription_repository.dart';
import 'package:milkride/feature/subscription/domain/usecase/delete_subscription_usecase.dart';
import 'package:milkride/feature/subscription/domain/usecase/pause_subscription_usecase.dart';
import 'package:milkride/feature/subscription/domain/usecase/resume_subscription_usecase.dart';
import 'package:milkride/feature/subscription/domain/usecase/subscribe_view_usecase.dart';
import 'package:milkride/feature/subscription/domain/usecase/temp_change_usecase.dart';
import 'package:milkride/feature/subscription/domain/usecase/update_quantity_sub_usecase.dart';
import 'package:milkride/feature/subscription/presentation/cubit/modify_permenant/modify_permenant_cubit.dart';
import 'package:milkride/feature/subscription/presentation/cubit/modify_temp/modify_temp_cubit.dart';
import 'package:milkride/feature/subscription/presentation/cubit/scuscribe_view/subscribe_view_cubit.dart';
import 'package:milkride/feature/subscription/presentation/cubit/subscribe_create/subscribe_cubit.dart';
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
import 'package:milkride/feature/wallet/data/repository/wallet_impl_repo.dart';
import 'package:milkride/feature/wallet/data/repository/wallet_remote_repo.dart';
import 'package:milkride/feature/wallet/domain/repository/wallet_repository.dart';
import 'package:milkride/feature/wallet/domain/usecase/billing_history_usecase.dart';
import 'package:milkride/feature/wallet/domain/usecase/pay_online_usecase.dart';
import 'package:milkride/feature/wallet/domain/usecase/payment_request_usecase.dart';
import 'package:milkride/feature/wallet/domain/usecase/verify_payment_usecase.dart';
import 'package:milkride/feature/wallet/domain/usecase/wallet_history_usecase.dart';
import 'package:milkride/feature/wallet/domain/usecase/wallet_usecase.dart';
import 'package:milkride/feature/wallet/presentation/cubit/billing_history/billing_history_cubit.dart';
import 'package:milkride/feature/wallet/presentation/cubit/payment/payment_cubit.dart';
import 'package:milkride/feature/wallet/presentation/cubit/recharge_history/recharge_history_cubit.dart';
import 'package:milkride/feature/wallet/presentation/cubit/wallet/wallet_cubit.dart';
import 'package:milkride/service/api_service.dart';

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

  // subscribe
  getIt.registerSingleton<SubscriptionRemoteRepo>(SubscriptionImplRemoteRepo(apiService: getIt()));
  getIt.registerSingleton<SubscriptionRepository>(SubscribeImplRepo(subscriptionRemoteRepo: getIt()));
  getIt.registerLazySingleton(() => SubscriptionViewUsecase(subscriptionRepository: getIt()));  
  getIt.registerLazySingleton(() => ResumeSubscriptionUsecase(subscriptionRepository: getIt()));  
  getIt.registerLazySingleton(() => PauseSubscriptionUsecase(subscriptionRepository: getIt()));  
  getIt.registerLazySingleton(() => DeleteSubscriptionUsecase(subscriptionRepository: getIt()));  
  getIt.registerLazySingleton(() => TemporaryChangeUsecase(subscriptionRepository: getIt()));  
  getIt.registerLazySingleton(() => UpdateQuantityUsecase(subscriptionRepository: getIt()));  
  getIt.registerLazySingleton(() => SubscriptionCubit(subscriptionUsecase: getIt()));
  getIt.registerLazySingleton(() => SubscribeViewCubit(subscriptionViewUsecase: getIt(),deleteSubscriptionUsecase: getIt(),pauseSubscriptionUsecase: getIt(),resumeSubscriptionUsecase: getIt()));
  getIt.registerLazySingleton(() => ModifyTempCubit(temporaryChangeUsecase: getIt()));
  getIt.registerLazySingleton(() => ModifyPermenantCubit(updateQuantityUsecase: getIt()));

  // Wallet
  getIt.registerSingleton<WalletRemoteRepo>(WalletImplRemoteRepo(apiService: getIt()));
  getIt.registerSingleton<WalletRepository>(WalletImplRepo(walletRemoteRepo: getIt()));
  getIt.registerLazySingleton(() => WalletUsecase(walletRepository: getIt()));  
  getIt.registerLazySingleton(() => WalletHistoryUsecase(walletRepository: getIt()));  
  getIt.registerLazySingleton(() => BillingHistoryUsecase(walletRepository: getIt()));  
  getIt.registerLazySingleton(() => PaymentUsecase(walletRepository: getIt()));  
  getIt.registerLazySingleton(() => VerifyPaymentUsecase(walletRepository: getIt()));  
  getIt.registerLazySingleton(() => PaymentRequestUsecase(walletRepository: getIt()));  
  getIt.registerFactory(() => WalletCubit(walletUsecase: getIt()));
  getIt.registerFactory(() => PaymentCubit(paymentUsecase: getIt(),verifyPaymentUsecase: getIt(),paymentRequestUsecase: getIt()));
  getIt.registerFactory(() => BillingHistoryCubit(billingHistoryUsecase: getIt()));
  getIt.registerFactory(() => RechargeHistoryCubit(walletHistoryUsecase: getIt()));

  // all product 
  getIt.registerSingleton<AllProductRemoteRepository>(AllProductImplRemoteRepo(apiService: getIt()));
  getIt.registerSingleton<AllProductRepository>(AllProductImplRepo(allProductRemoteRepository: getIt()));
  getIt.registerLazySingleton(()=> AllProductUsecase(allProductRepository: getIt()));
  getIt.registerLazySingleton(()=> SearchUsecase(allProductRepository: getIt()));
  getIt.registerFactory(()=>AllProductCubit(allProductUsecase: getIt(),searchUsecase: getIt()));

  // Profile
  getIt.registerSingleton<ProfileRemoteRepository>(ProfileImplRemoteRepo(apiService: getIt()));
  getIt.registerSingleton<ProfileRepository>(ProfileImplRepo(profileRemoteRepository: getIt()));
  getIt.registerLazySingleton(()=> VacationUsecase(profileRepository: getIt()));
  getIt.registerLazySingleton(()=> ProfileUsecase(profileRepository: getIt()));
  getIt.registerFactory(()=>ProfileCubit(vacationUsecase: getIt(),profileUsecase: getIt()));
}
