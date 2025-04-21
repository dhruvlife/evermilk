import 'package:flutter/material.dart';
import 'package:milkride/core/common/app_image.dart';
import 'package:milkride/core/key/app_images.dart';

class FoodTypeCard extends StatelessWidget {
  final bool isVeg;
  final double height;
  final double width;
  const FoodTypeCard(
      {super.key, required this.isVeg, this.height = 20, this.width = 20});

  @override
  Widget build(BuildContext context) {
    return isVeg
        ? AppImage(image: AppImages.veg, height: height, width: width,fit: BoxFit.fill,)
        : AppImage(image: AppImages.nonVeg, height: height, width: width,fit: BoxFit.fill,);
  }
}
