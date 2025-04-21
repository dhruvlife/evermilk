import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:milkride/feature/product/domain/entities/product.dart';
import 'package:milkride/feature/product/domain/usecase/product_usecase.dart';
import 'package:milkride/feature/product/domain/usecase/product_variants_usecase.dart';
import 'product_variant_state.dart';

class ProductVariantCubit extends Cubit<ProductVariantState> {
  final ProductVariantsUsecase productVariantsUsecase;
  ProductVariantCubit({required this.productVariantsUsecase})
      : super(ProductVariantInitial());
  List<Product>? products;
  Product? selectedProduct;
  int quantity = 1;
  int deliveryType = 0;

  Future<void> fetchProductVariants({required ProdDetailParam prodVarParam}) async {
    emit(ProductVariantLoading());
    final result = await productVariantsUsecase(prodVarParam);
    result.fold(
      (failure) => emit(ProductVariantError(message:failure.messege)),
      (response) {
        products = response.prodInfo;
        if (products != null && products!.isNotEmpty) {
          selectedProduct = products?.first;
          quantity = 1;
        }
        emit(ProductVariantLoaded(response: response, selectedProduct: selectedProduct, quantity: quantity, deliveryType: deliveryType));
      },
    );
  }

  void selectProduct(Product product) {
    selectedProduct = product;
    quantity = 1;
    setCurrentState();
  }

  void incrementQty() {
    final max = selectedProduct?.maxQtyAllow ?? 500;
    if (quantity < max) {
      quantity++;
      setCurrentState();
    }
  }

  void decrementQty() {
    final min = selectedProduct?.minQtyAllow ?? 1;
    if (quantity > min) {
      quantity--;
      setCurrentState();
    }
  }

  void changeDeliveryType(int type) {
    deliveryType = type;
    setCurrentState();
  }

  double get totalPrice {
    final price = double.tryParse(selectedProduct?.salePrice ?? '0') ?? 0;
    return quantity * price;
  }

  void setCurrentState() {
    if (state is ProductVariantLoaded) {
      final res = (state as ProductVariantLoaded).response;
      emit(ProductVariantLoaded(
        response: res,
        selectedProduct: selectedProduct,
        quantity: quantity,
        deliveryType: deliveryType,
      ));
    }
  }

  void printCartData() {
    print("Selected Product: ${selectedProduct?.name}");
    print("Selected Product ID: ${selectedProduct?.id}");
    print("Quantity: $quantity");
    print("Delivery Type: ${deliveryType == 0 ? "Morning" : "Evening"}");
    print("Total Price: ₹$totalPrice");
  }
}
