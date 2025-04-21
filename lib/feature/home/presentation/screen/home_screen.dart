import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:milkride/core/constant/app_colors.dart';
import 'package:milkride/core/routes/routes_name.dart';
import 'package:milkride/feature/home/presentation/cubit/home_cubit.dart';
import 'package:milkride/feature/home/presentation/screen/home_tab_screen.dart';
import 'package:milkride/feature/order/presentation/screen/order_screen.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {
  late PersistentTabController _controller;
  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
    loadHomeData();
  }
  void loadHomeData() async {
    await context.read<HomeCubit>().fetchUserDeviceData();
  }
  final List<PersistentBottomNavBarItem> _navBarsItems = [
    buildNavBarItem(icon: Icons.home, title: "Home"),
    buildNavBarItem(icon: Icons.category, title: "Products"),
    buildNavBarItem(icon: Icons.shopping_basket, title: "Orders"),
    buildNavBarItem(icon: Icons.bookmark, title: "Subscription"),
    PersistentBottomNavBarItem(
      icon: Icon(Icons.shopping_cart),
      title: "Cart",
      textStyle: TextStyle(
          color: AppColors.otionButton,
          fontWeight: FontWeight.w600,
          fontSize: 12.sp),
      activeColorPrimary: AppColors.otionButton,
      inactiveColorPrimary: AppColors.grey,
      onPressed: (context) {
        Get.toNamed(RoutesName.cartPage);
      },
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final List<Widget> screens = [
      HomeTabScreen(),
      HomeTabScreen(),
      OrderScreen(onBack: () => _controller.jumpToTab(0)),
      HomeTabScreen(),
      SizedBox()
    ];
    return PersistentTabView(
      context,
      controller: _controller,
      padding: EdgeInsets.all(5),
      screens: screens,
      items: _navBarsItems,
      navBarStyle: NavBarStyle.neumorphic,
      backgroundColor: Colors.white,
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
    );
  }
}

PersistentBottomNavBarItem buildNavBarItem({
  required IconData icon,
  required String title,
  Color? activeColor,
  Color? inactiveColor,
}) {
  return PersistentBottomNavBarItem(
    contentPadding: 10,
    icon: Icon(icon),
    title: title,
    activeColorPrimary: activeColor ?? AppColors.otionButton,
    inactiveColorPrimary: inactiveColor ?? AppColors.grey,
  );
}
