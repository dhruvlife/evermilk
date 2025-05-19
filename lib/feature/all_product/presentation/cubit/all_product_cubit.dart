import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:milkride/core/constant/app_strings.dart';
import 'package:milkride/core/storage/storage_key.dart';
import 'package:milkride/core/storage/storage_object.dart';
import 'package:milkride/core/utils/app_functional_components.dart';
import 'package:milkride/feature/all_product/domain/usecase/all_product_usecase.dart';
import 'package:milkride/feature/all_product/domain/usecase/search_usecase.dart';
import 'package:milkride/feature/product/domain/entities/categories.dart';
import 'package:milkride/feature/product/domain/entities/product.dart';
part 'all_product_state.dart';

class AllProductCubit extends Cubit<AllProductState> {
  final AllProductUsecase allProductUsecase;
  final SearchUsecase searchUsecase;

  AllProductCubit({
    required this.allProductUsecase,
    required this.searchUsecase,
  }) : super(AllProductInitial()) {
    scrollController.addListener(onScroll);
    searchController.addListener(handleSearchChanged);
  }

  final customerId = StorageObject.readData(StorageKeys.customerId).toString();
  final ScrollController scrollController = ScrollController();
  final TextEditingController searchController = TextEditingController();

  List<Product> products = [];
  List<Product> searchProducts = [];
  List<Categories> allCategories = [];

  int? selectedCategoryId;
  int currentPage = 1;
  int? totalPage;
  final int pageSize = 10;
  bool isLoadingMore = false;
  bool isSearching = false;

  Future<void> init(int userId) async {
    emit(AllProductLoading());
    selectedCategoryId = 0;
    products.clear();
    searchProducts.clear();
    currentPage = 1;
    await fetchAllProducts();
  }

  void onCategorySelected({required int selectedCatId}) async {
    selectedCategoryId = selectedCatId;
    isSearching = false;
    searchController.clear();
    products.clear();
    searchProducts.clear();
    currentPage = 1;
    emit(AllProductLoading());
    await fetchAllProducts();
  }

  void handleSearchChanged() {
    if (selectedCategoryId != 0) return;
    final keyword = searchController.text.trim();
    isSearching = keyword.isNotEmpty;
    currentPage = 1;
    totalPage = null;
    searchProducts.clear();
    products.clear();
    if (isSearching) {
      searchProds(
        allProductParam: AllProductParam(
          customerId: customerId,
          keyword: keyword,
          page: currentPage,
          length: pageSize));
    } else {
      fetchAllProducts();
    }
  }

  void onScroll() {
    final keyword = searchController.text.trim();
    if (scrollController.position.pixels >= scrollController.position.maxScrollExtent - 100 &&
        !isLoadingMore && (totalPage == null || currentPage <= totalPage!)) {
      if (isSearching && keyword.isNotEmpty) {
        searchProds(
          allProductParam: AllProductParam(
            customerId: customerId,
            keyword: keyword,
            page: currentPage,
            length: pageSize),
        );
      } else {
        fetchAllProducts();
      }
    }
  }

  Future<void> searchProds({required AllProductParam allProductParam}) async {
    isLoadingMore = true;
    Get.context?.loaderOverlay.show();
    final result = await searchUsecase.call(allProductParam);
    result.fold(
      (failure) {
        AppFunctionalComponents.showSnackBar(message: failure.messege);
        emit(AllProductError(message: failure.messege));
      },
      (response) {
        if (response.status == AppStrings.success) {
          final newProducts = response.allProductdata?.packages ?? [];
          totalPage = response.allProductdata?.totalPages ?? 1;
          searchProducts = newProducts;
          currentPage++;
          emit(AllProductLoaded(
            products: List<Product>.from(searchProducts),
            categories: allCategories));
        } else {
          emit(AllProductError(message: response.message ?? ""));
        }
      },
    );
    Get.context?.loaderOverlay.hide();
    isLoadingMore = false;
  }

  Future<void> fetchAllProducts() async {
    isLoadingMore = true;
    if (currentPage > 1) {
      Get.context?.loaderOverlay.show();
    }
    final result = await allProductUsecase.call(
      AllProductParam(
        customerId: customerId,
        categoryId: selectedCategoryId ?? 0,
        page: currentPage,
        length: pageSize),
    );

    result.fold(
      (failure) {
        AppFunctionalComponents.showSnackBar(message: failure.messege);
        emit(AllProductError(message: failure.messege));
      },
      (response) {
        if (response.status == AppStrings.success) {
          final newProducts = response.allProductdata?.packages ?? [];
          totalPage = response.allProductdata?.totalPages ?? 1;
          products.addAll(newProducts);
          currentPage++;
          emit(AllProductLoaded(
            products: List<Product>.from(products),
            categories: allCategories));
        } else {
          emit(AllProductError(message: response.message ?? ""));
        }
      },
    );
    if (currentPage > 1) {
      Get.context?.loaderOverlay.hide();
    }
    isLoadingMore = false;
  }

  @override
  Future<void> close() {
    scrollController.dispose();
    searchController.dispose();
    return super.close();
  }
}
