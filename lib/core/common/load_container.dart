import 'package:flutter/material.dart';
import 'package:milkride/core/constant/app_colors.dart';
import 'package:shimmer/shimmer.dart';

class LoadContainer extends StatelessWidget {
  final double width;
  final double height;
  final double?radius;

  const LoadContainer({
    super.key,
    required this.height,
    required this.width,
    this.radius
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      period: Duration(seconds: 1),
      baseColor: const Color.fromARGB(220, 230, 230, 230),
      highlightColor: const Color.fromARGB(255, 255, 255, 255),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: AppColors.whiteShade,
          borderRadius: BorderRadius.circular(radius??0),
        ),
      ),
    );
  }
}
