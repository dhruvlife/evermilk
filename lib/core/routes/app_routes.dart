import 'package:get/get.dart';
import 'package:milkride/core/routes/routes_name.dart';
import 'package:milkride/feature/cart/presentation/screen/cart_page/cart_screen.dart';
import 'package:milkride/feature/subscription/presentation/screen/modify_permanently/modify_permanently_screen.dart';
import 'package:milkride/feature/subscription/presentation/screen/modify_temporarily_screen/modify_temporarily_screen.dart';
import 'package:milkride/feature/subscription/presentation/screen/subscription_create/subscription_create_screen.dart';
import 'package:milkride/feature/home/presentation/screen/main_screen.dart';
import 'package:milkride/feature/auth/presentaion/screen/otp/otp_screen.dart';
import 'package:milkride/feature/auth/presentaion/screen/signin/signin_screen.dart';
import 'package:milkride/feature/auth/presentaion/screen/register/register_screen.dart';
import 'package:milkride/feature/auth/presentaion/screen/splash/splash_screen.dart';
import 'package:milkride/feature/order/presentation/screen/widgets/order_success_screen.dart';
import 'package:milkride/feature/product/presentation/screen/all_category/all_category_page.dart';
import 'package:milkride/feature/product/presentation/screen/category_product/category_product_page.dart';
import 'package:milkride/feature/product/presentation/screen/product_detail/product_detail_page.dart';
import 'package:milkride/feature/wallet/presentation/screen/billing_history/billing_history_screen.dart';
import 'package:milkride/feature/wallet/presentation/screen/recharge_history/recharge_history_screen.dart';
import 'package:milkride/feature/wallet/presentation/screen/wallet_page/wallet_screen.dart';

class AppRoutes {
  AppRoutes._();
  static List<GetPage<dynamic>> pages = [
    GetPage(name: RoutesName.splash, page: () => SplashScreen()),
    GetPage(name: RoutesName.login, page: () => SignInScreen()),
    GetPage(name: RoutesName.otpCheck, page: () => OtpCheckScreen(otpArguments: Get.arguments,)),
    GetPage(name: RoutesName.register, page: () => RegisterScreen(signupParam: Get.arguments,)),
    GetPage(name: RoutesName.home, page: () => MainScreen()),
    GetPage(name: RoutesName.viewAllCat, page: () => AllCategoryPage()),
    GetPage(name: RoutesName.productDetail, page: () => ProductDetailPage(prodDetailParam: Get.arguments,)),
    GetPage(name: RoutesName.categoeyProds, page: () => CategoryProductPage(category: Get.arguments,)),
    GetPage(name: RoutesName.cartPage, page: () => CartPage()),
    GetPage(name: RoutesName.subscribePage, page: () => SubscriptionScreen(product: Get.arguments,)),
    GetPage(name: RoutesName.orderSuccess, page: () => OrderSuccessScreen()),
    GetPage(name: RoutesName.modifyTemp, page: () => ModifyTemporarilyScreen(prod: Get.arguments)),
    GetPage(name: RoutesName.modifyPermenent, page: () => ModifyPermanentlyScreen(prod: Get.arguments,)),
    GetPage(name: RoutesName.wallet, page: () => WalletScreen()),
    GetPage(name: RoutesName.rechargeHistory, page: () => RechargeHistory()),
    GetPage(name: RoutesName.billingHistory, page: () => BillingHistory()),
  ];
}

