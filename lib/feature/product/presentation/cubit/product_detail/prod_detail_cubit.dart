import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:milkride/feature/product/domain/entities/product.dart';
import 'package:milkride/feature/product/domain/usecase/product_usecase.dart';
import 'package:milkride/feature/product/presentation/cubit/product_detail/prod_detail_state.dart';

class ProdDetailCubit extends Cubit<ProdDetailState> {
  final ProductDetailUsecase productDetailUsecase;
  ProdDetailCubit({required this.productDetailUsecase}) : super(ProdDetailInitial());

  List<Product>? products;
  Product? selectedProduct;
  int quantity = 1;
  String deliveryType = "morning";

  Future<void> fetchProductDetail({required ProdDetailParam prodDetailParam}) async {
    emit(ProdDetailLoading());
    final result = await productDetailUsecase(prodDetailParam);
    result.fold(
      (failure) => emit(ProdDetailError(message: failure.messege)),
      (productDetail) {
        products = productDetail.data?.filteredPackages;
        if (products != null && products!.isNotEmpty) {
          selectedProduct = products!.first;
          quantity = 1;
        }
        emit(ProdDetailLoaded(
          response: productDetail,
          selectedVariant: selectedProduct,
          quantity: quantity,
          deliveryType: deliveryType,
        ));
      },
    );
  }

  void selectVariant({required Product variant}) {
    selectedProduct = variant;
    quantity = 1;
    updatedState();
  }

  void incrementQty() {
    final max = selectedProduct?.maxQtyAllow ?? 50;
    if (quantity < max) {
      quantity++;
      updatedState();
    }
  }

  void decrementQty() {
    final min = selectedProduct?.minQtyAllow ?? 1;
    if (quantity > min) {
      quantity--;
      updatedState();
    }
  }

  void changeDeliveryType({required String delivery}) {
    deliveryType = delivery;
    updatedState();
  }

  double get totalPrice {
    final price = double.tryParse(selectedProduct?.salePrice ?? '0') ?? 0;
    return quantity * price;
  }

  void updatedState() {
    if (state is ProdDetailLoaded) {
      final current = state as ProdDetailLoaded;
      emit(current.copyWith(
        selectedVariant: selectedProduct,
        quantity: quantity,
        deliveryType: deliveryType,
      ));
    }
  }
}
