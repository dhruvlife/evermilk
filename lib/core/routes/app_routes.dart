import 'package:get/get.dart';
import 'package:milkride/core/routes/routes_name.dart';
import 'package:milkride/feature/cart/presentation/screen/cart_page/cart_screen.dart';
import 'package:milkride/feature/cart/presentation/screen/subscription_page/subscription_screen.dart';
import 'package:milkride/feature/home/presentation/screen/home_screen.dart';
import 'package:milkride/feature/auth/presentaion/screen/otp/otp_screen.dart';
import 'package:milkride/feature/auth/presentaion/screen/signin/signin_screen.dart';
import 'package:milkride/feature/auth/presentaion/screen/register/register_screen.dart';
import 'package:milkride/feature/auth/presentaion/screen/splash/splash_screen.dart';
import 'package:milkride/feature/order/presentation/screen/widgets/order_success_screen.dart';
import 'package:milkride/feature/product/presentation/screen/all_category/all_category_page.dart';
import 'package:milkride/feature/product/presentation/screen/category_product/category_product_page.dart';
import 'package:milkride/feature/product/presentation/screen/product_detail/product_detail_page.dart';

class AppRoutes {
  AppRoutes._();
  static List<GetPage<dynamic>> pages = [
    GetPage(name: RoutesName.splash, page: () => SplashScreen()),
    GetPage(name: RoutesName.login, page: () => SignInScreen()),
    GetPage(name: RoutesName.otpCheck, page: () => OtpCheckScreen(otpArguments: Get.arguments,)),
    GetPage(name: RoutesName.register, page: () => RegisterScreen(signupParam: Get.arguments,)),
    GetPage(name: RoutesName.home, page: () => HomeScreen()),
    GetPage(name: RoutesName.viewAllCat, page: () => AllCategoryPage()),
    GetPage(name: RoutesName.productDetail, page: () => ProductDetailPage(prodDetailParam: Get.arguments,)),
    GetPage(name: RoutesName.categoeyProds, page: () => CategoryProductPage(category: Get.arguments,)),
    GetPage(name: RoutesName.cartPage, page: () => CartPage()),
    GetPage(name: RoutesName.subscribePage, page: () => SubscriptionScreen(product: Get.arguments,)),
    GetPage(name: RoutesName.orderSuccess, page: () => OrderSuccessScreen()),
  ];
}

