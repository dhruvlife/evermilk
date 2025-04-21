import 'package:milkride/feature/product/data/model/category_model.dart';
import 'package:milkride/feature/product/data/model/cat_product_model.dart';
import 'package:milkride/feature/product/data/model/product_detail_model.dart';
import 'package:milkride/feature/product/data/model/product_variants.dart';
import 'package:milkride/feature/product/domain/usecase/category_products_usecase.dart';
import 'package:milkride/feature/product/domain/usecase/product_usecase.dart';
import 'package:milkride/service.dart/api_service.dart';

abstract interface class ProductRemoteRepo {
  Future<CategoryProductModel> getCategoriesProducts({required CategoryProdParam categoryProdParam});
  Future<CategoryModel> getAllCategoryResponse({required int userId});
  Future<ProductDetailModel> getProductDetail({required ProdDetailParam prodDetailParam});
  Future<ProdVariantsModel> getProductVariants({required ProdDetailParam prodDetailParam});
}

class ProductImplRemoteRepo implements ProductRemoteRepo {
  final ApiService apiService;
  ProductImplRemoteRepo({required this.apiService});
  @override
  Future<CategoryProductModel> getCategoriesProducts({required CategoryProdParam categoryProdParam})async {
      return await apiService.getCategoriesProducts(categoryId: categoryProdParam.categoryId, customerId: categoryProdParam.customerId);
  }
  @override
  Future<CategoryModel> getAllCategoryResponse({required int userId})async {
       return await apiService.getAllCategories(userId: userId.toString());
  }
  @override
  Future<ProductDetailModel> getProductDetail({required ProdDetailParam prodDetailParam})async {
       return await apiService.getProductDetail(productId: prodDetailParam.productId,customerId: prodDetailParam.customerId);
  }
  
  @override
  Future<ProdVariantsModel> getProductVariants({required ProdDetailParam prodDetailParam})async {
    return await apiService.getVarientProducts(productId: prodDetailParam.productId,customerId: prodDetailParam.customerId);
  }
}

