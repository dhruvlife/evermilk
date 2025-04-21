import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:milkride/core/common/load_container.dart';

class ProductCardLoader extends StatelessWidget {
  final double productWidth;
  final double productHeight;
  final double productRadius;
  final double padding;
  final int count;

  const ProductCardLoader({
    super.key,
    required this.productHeight,
    required this.productWidth,
    required this.productRadius,
    required this.padding,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: productHeight,
      child: ListView.builder(
        itemCount: count,
        itemBuilder: (context, index) {
          return LoadContainer(
            height: productHeight,
            width: productWidth,
            radius: productRadius,
          ).paddingAll(padding);
        },
      ),
    );
  }
}
