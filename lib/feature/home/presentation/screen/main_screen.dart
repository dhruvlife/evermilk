import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:milkride/core/common/app_label.dart';
import 'package:milkride/core/constant/app_colors.dart';
import 'package:milkride/core/constant/app_strings.dart';
import 'package:milkride/core/routes/routes_name.dart';
import 'package:milkride/feature/all_product/presentation/screen/all_product_screen.dart';
import 'package:milkride/feature/home/presentation/cubit/home_cubit.dart';
import 'package:milkride/feature/home/presentation/screen/home_screen.dart';
import 'package:milkride/feature/profile/presentation/screen/drawer.dart';
import 'package:milkride/feature/order/presentation/screen/order_screen.dart';
import 'package:milkride/feature/subscription/presentation/screen/subscription_screen/subscription_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;
  @override
  void initState() {
    super.initState();
    loadHomeData();
  }
  void loadHomeData()=> context.read<HomeCubit>().fetchUserDeviceData();
  void jumpToHomeTab() => setState(() => currentIndex = 0);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    final List<Widget> screens = [
      HomeScreen(scaffoldKey:scaffoldKey),
      AllProductScreen(onBack: jumpToHomeTab),
      OrderScreen(onBack: jumpToHomeTab),
      SubscriptionViewScreen(onIconPressed: jumpToHomeTab),
      SizedBox()];
    return Scaffold(
      key: scaffoldKey,
      drawer: ProfileDrawer(onNavigateToTab:  (index) {
        setState(() {
          currentIndex = index;
        });
      },),
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          if (index == 4) {
            Get.toNamed(RoutesName.cartPage);
            return;
          }
          setState(() {
            currentIndex = index;
          });
        },
        selectedLabelStyle: TextStyle(fontSize: 10.sp,fontWeight: FontWeight.w700),
        selectedItemColor: AppColors.optionButton,
        unselectedItemColor: AppColors.inactiveIconColor,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.category), label: "Products"),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_basket), label: "Orders"),
          BottomNavigationBarItem(icon: Icon(Icons.bookmark), label: "Subscription"),
          BottomNavigationBarItem(icon: SizedBox(
            width: 30.w,
            child: Stack(
              children: [
                Icon(Icons.shopping_cart),
                Positioned(top: 0,right: 0,
                child: AppLabel(label: context.read<HomeCubit>().qty ?? "0",labelSize:8.sp,height:15.sp,width:20.w,borderRadius: BorderRadius.circular(5.r)))
              ],
            ),
          ), label:AppStrings.cart),
        ],
      ),
    );
  }
}
