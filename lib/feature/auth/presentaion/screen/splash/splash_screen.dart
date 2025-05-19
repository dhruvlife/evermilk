import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:milkride/core/common/app_image.dart';
import 'package:milkride/core/key/app_images.dart';
import 'package:milkride/feature/auth/presentaion/cubit/auth/auth_cubit.dart';
import 'package:milkride/service/injection.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    getIt<AuthCubit>().checkUserState();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Center(child: AppImage(image: AppImages.logo,height: 200.h,width: 200.w,),)),
    );
  }
}