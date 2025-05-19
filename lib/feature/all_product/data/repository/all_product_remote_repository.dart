import 'package:milkride/feature/all_product/data/model/all_product_model.dart';
import 'package:milkride/feature/all_product/domain/usecase/all_product_usecase.dart';
import 'package:milkride/service/api_service.dart';

abstract interface class AllProductRemoteRepository {
  Future<AllProductModel> getAllProductResponse({required AllProductParam allProductParam});
  Future<AllProductModel> getSearchProductResponse({required AllProductParam allProductParam});
}

class AllProductImplRemoteRepo implements AllProductRemoteRepository {
  final ApiService apiService;
  AllProductImplRemoteRepo({required this.apiService});
  @override
  Future<AllProductModel> getAllProductResponse({required AllProductParam allProductParam}) async {
    return apiService.getAllProductResponse(
      customerId: allProductParam.customerId,
      categoryId: allProductParam.categoryId ?? 0,
      page: allProductParam.page,
      length: allProductParam.length,
    );
  }
  
  @override
  Future<AllProductModel> getSearchProductResponse({required AllProductParam allProductParam}) async {
    return apiService.getSearchResponse(
      customerId: allProductParam.customerId,
      categoryId: allProductParam.categoryId ?? 0,
      page: allProductParam.page,
      length: allProductParam.length,
      keyword: allProductParam.keyword ?? "",
    );
  }
}
