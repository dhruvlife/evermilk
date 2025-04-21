import 'package:dio/dio.dart';
import 'package:milkride/core/secrets/end_points.dart';
import 'package:milkride/core/secrets/api_strings.dart';
import 'package:milkride/feature/auth/data/model/otp_model.dart';
import 'package:milkride/feature/auth/data/model/register_model.dart';
import 'package:milkride/feature/auth/data/model/resend_otp_model.dart';
import 'package:milkride/feature/auth/data/model/signin_model.dart';
import 'package:milkride/feature/auth/data/model/signup_data_model.dart';
import 'package:milkride/feature/auth/domain/entity/register_region.dart';
import 'package:milkride/feature/cart/data/model/cart_page_model.dart';
import 'package:milkride/feature/cart/data/model/common_data_model.dart';
import 'package:milkride/feature/home/data/model/home_model.dart';
import 'package:milkride/feature/order/data/model/order_data_model.dart';
import 'package:milkride/feature/product/data/model/category_model.dart';
import 'package:milkride/feature/product/data/model/cat_product_model.dart';
import 'package:milkride/feature/product/data/model/product_detail_model.dart';
import 'package:milkride/feature/product/data/model/product_variants.dart';
import 'package:milkride/service.dart/interceptor.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:retrofit/retrofit.dart';
part 'api_service.g.dart';

@RestApi(baseUrl: ServerConfig.baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio) {
    final interceptor = DefaultInterceptor();
    dio.interceptors.add(interceptor);
    dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90,
      ),
    );
    return _ApiService(dio);
  }

  @POST(EndPoints.version + EndPoints.signin)
  Future<SignInModel> signIn({
    @Field('mobile_number') required String mobileNumber,
    @Field('user_id') required String userId,
  });

  @POST(EndPoints.version + EndPoints.otpCheck)
  Future<OtpVerifyModel> getOtpResponse({
    @Field('mobile_number') required String mobileNumber,
    @Field('user_id') required String userId,
    @Field('otp') required String otp,
  });

  @POST(EndPoints.version + EndPoints.otpResend)
  Future<ResendOtpModel> getResendOtpResponse({
    @Field('mobile_number') required String mobileNumber,
    @Field('user_id') required String userId,
  });

  @POST(EndPoints.version + EndPoints.signup)
  Future<SignupDataModel> signUpData({
    @Field('mobile_number') required String mobileNumber,
    @Field('user_id') required String userId,
  });

  @GET("${EndPoints.getRegions}/{id}")
  Future<List<Region>> getAreasByRegion({
    @Path("id") required int regionId,
  });

  @POST(EndPoints.version + EndPoints.register)
  Future<RegisterModel> getRegisterResponse({
    @Field('name') required String name,
    @Field('email') required String email,
    @Field('source_id') required String sourceId,
    @Field('address[area_id]') required String areaId,
    @Field('address[house_no]') required String houseNo,
    @Field('address[floor]') required String floor,
    @Field('address[society]') required String society,
    @Field('address[landmark]') required String landmark,
    @Field('address[latitude]') required String latitude,
    @Field('address[longitude]') required String longitude,
    @Field('address[pincode]') required String pincode,
    @Field('region_id') required String regionId,
    @Field('user_id') required String userId,
    @Field('customer_referrer_code') required String customerReferrerCode,
    @Field('agent_code') required String agentCode,
    @Field('delivery_type') required String deliveryType,
    @Field('gender') required String gender,
    @Field('mobile_number') required String mobileNumber,
  });

  @POST(EndPoints.version + EndPoints.home)
  Future<HomeDataModel> getHomeResponse({
    @Field('mobile_number') required String mobileNumber,
    @Field('user_id') required String userId,
    @Field('type') required String type,
    @Field('device_type') required String deliveryType,
    @Field('device_model') required String deviceModel,
    @Field('version') required String version,
    @Field('device_id') required String deviceId,
  });

  @POST(EndPoints.version + EndPoints.categoryProducts)
  Future<CategoryProductModel> getCategoriesProducts({
    @Field('category_id') required String categoryId,
    @Field('customer_id') required String customerId,
  });

  @POST(EndPoints.version + EndPoints.allCategory)
  Future<CategoryModel> getAllCategories({
    @Field('user_id') required String userId,
  });

  @GET(EndPoints.v3 + EndPoints.prodView)
  Future<ProductDetailModel> getProductDetail({
    @Query("customer_id") required String customerId,
    @Query("product_id") required String productId,
  });

  @GET(EndPoints.v3 + EndPoints.prodVariant)
  Future<ProdVariantsModel> getVarientProducts({
    @Query("customer_id") required String customerId,
    @Query("product_id") required String productId,
  });

  @POST(EndPoints.version + EndPoints.addToCart)
  Future<CartPageModel> getCartPageDetails({
    @Field('customer_id') required String customerId,
  });

  @POST(EndPoints.version + EndPoints.cartUpdate)
  @MultiPart()
  Future<CommonDataModel> getCartQuantityUpdateDetails({
    @Part(name: 'cart') required String cartJson,
  });

  @POST(EndPoints.version + EndPoints.orderPlace)
  @MultiPart()
  Future<CommonDataModel> getOrderPlace({
    @Part(name: 'user_id') required String userId,
    @Part(name: 'customer_id') required String customerId,
  });

  @POST(EndPoints.version + EndPoints.orders)
  Future<OrderDataModel> getOrders({
    @Field('delivery_date') required String date,
    @Field('customer_id') required String customerId,
  });

  @POST(EndPoints.version + EndPoints.romoveCartItem)
  Future<CommonDataModel> getRemoveCartItemDetails({
    @Field('cart_id') required String cartId,
  });

  @POST(EndPoints.version + EndPoints.orderCancel)
  Future<CommonDataModel> getCancelOrder({
    @Field('order_id') required String orderId,
    @Field('package_id') required String packageId,
    @Field('reason_id') required String reasonId,
  });

  @POST(EndPoints.version + EndPoints.subscriptionCreate)
  Future<CommonDataModel> getSubcriptionResponse({
    @Field('customer_id') required String customerId,
    @Field('package_id') required String packageId,
    @Field('user_id') required String userId,
    @Field('frequency_type') required String frequencyType,
    @Field('frequency_value') required String frequencyValue,
    @Field('qty') required String quantity,
    @Field('schedule') required String schedule,
    @Field('day_wise_quantity') required String dayWiseQuantity,
    @Field('delivery_type') required String deliveryType,
    @Field('start_date') required String startDate,
    @Field('end_date') required String endDate,
    @Field('trial_product') required String trialProduct,
    @Field('no_of_usages') required String noOfUsages,
    @Field('product_id') required String productId,
  });
}
