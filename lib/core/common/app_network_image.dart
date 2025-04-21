import 'package:flutter/material.dart';
import 'package:milkride/core/common/common_container.dart';
import 'package:milkride/core/common/loding_indicator.dart';
import 'package:milkride/feature/home/presentation/cubit/home_cubit.dart';
import 'package:milkride/service.dart/injection.dart';

class AppNetWorkImage extends StatelessWidget {
  final String image;
  final double height;
  final double width;
  final double? borderRadius;
  final BorderRadiusGeometry? radius;
  final BoxFit? fit;

  const AppNetWorkImage({
    super.key,
    required this.image,
    required this.height,
    required this.width,
    this.fit,
    this.radius,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    final homeCubit = getIt<HomeCubit>();
    return ClipRRect(
      borderRadius:
      radius ??
          BorderRadius.vertical(top: Radius.circular(borderRadius ?? 0)),
      child: Image.network(
        image,
        height: height,
        width: width,
        fit: fit ?? BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
         return Image.network(homeCubit.config?.logoUrl ?? "",
              height: height, width: width, fit: fit ?? BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
            return CommonContainer(
                widget:Icon(Icons.network_check),
                height: height,
                width: width);
          });

        },
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) {
            return child;
          } else {
            return Container(
              color: Colors.white,
              height: height,
              width: width,
              child: Center(child:LodingIndicator()),
            );
          }
        },
      ),
    );
  }
}
