import 'package:milkride/feature/product/domain/entities/product.dart';

class Operation {
  Operation._();
  static List<Product> getUniqueProductsByProductId({required List<Product> products}) {
    final List<Product> uniqueProds = [];
    for (var prod in products) {
      if (!uniqueProds.any((p) => p.productId == prod.productId)) {
        uniqueProds.add(prod);
      }
    }
    return uniqueProds;
  }

  static List<Product> groupProductsByProductId({
    required List<Product> products,
    required String prodId,
  }) {
    return products.where((p) => p.productId.toString() == prodId).toList();
  }

  static String discountRate({required String salePrice, required String mrpPrice}) {
    try {
      double sale = double.parse(salePrice);
      double mrp = double.parse(mrpPrice);
      if (mrp == 0) return "0%";
      
      double discount = ((mrp - sale) / mrp) * 100;
      return "${discount.toStringAsFixed(0)}%";
    } catch (e) {
      return "0%";
    }
  }
}
