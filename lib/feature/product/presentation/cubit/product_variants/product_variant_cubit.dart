import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:milkride/core/constant/app_strings.dart';
import 'package:milkride/core/storage/storage_key.dart';
import 'package:milkride/core/storage/storage_object.dart';
import 'package:milkride/feature/cart/domain/usecase/subscription_usecase.dart';
import 'package:milkride/feature/cart/presentation/cubit/cart/cart_cubit.dart';
import 'package:milkride/feature/product/domain/entities/product.dart';
import 'package:milkride/feature/product/domain/usecase/product_usecase.dart';
import 'package:milkride/feature/product/domain/usecase/product_variants_usecase.dart';
import 'package:milkride/service/injection.dart';
import 'product_variant_state.dart';

class ProductVariantCubit extends Cubit<ProductVariantState> {
  final ProductVariantsUsecase productVariantsUsecase;
  ProductVariantCubit({required this.productVariantsUsecase})
      : super(ProductVariantInitial());
  List<Product>? products;
  Product? selectedProduct;
  int quantity = 1;
  int deliveryType = 0;

  Future<void> fetchProductVariants(
      {required ProdDetailParam prodVarParam}) async {
    emit(ProductVariantLoading());
    final result = await productVariantsUsecase(prodVarParam);
    result.fold(
      (failure) => emit(ProductVariantError(message: failure.messege)),
      (response) {
        products = response.prodInfo;
        if (products != null && products!.isNotEmpty) {
          selectedProduct = products?.first;
          quantity = 1;
        }
        emit(ProductVariantLoaded(
            response: response,
            selectedProduct: selectedProduct,
            quantity: quantity,
            deliveryType: deliveryType));
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

  void addToCart({required Product product}){
    final cartCubit = getIt<CartPageCubit>();
    cartCubit.addToCart(
        subScribeCartParam: SubScribeCartParam(
            customerId:
                StorageObject.readData(StorageKeys.customerId).toString(),
            packageId: product.id.toString(),
            userId: StorageObject.readData(StorageKeys.userId),
            frequencyType: "one_time",
            frequencyValue: "",
            quantity: quantity.toString(),
            schedule: "",
            dayWiseQuantity: "",
            deliveryType:deliveryType == 0 ? AppStrings.morning : AppStrings.evening,
            startDate: DateFormat('dd-MM-yyyy').format(DateTime.now()),
            endDate: "",
            trialProduct: "0",
            noOfUsages: "0",
            productId: product.id.toString()));
  }
}
