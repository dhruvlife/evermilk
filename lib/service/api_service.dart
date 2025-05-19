import 'package:dio/dio.dart';
import 'package:milkride/core/secrets/end_points.dart';
import 'package:milkride/core/secrets/api_strings.dart';
import 'package:milkride/feature/all_product/data/model/all_product_model.dart';
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
import 'package:milkride/feature/profile/data/model/profile_model.dart';
import 'package:milkride/feature/subscription/data/model/subscription_view_model.dart';
import 'package:milkride/feature/wallet/data/model/payment_model.dart';
import 'package:milkride/feature/wallet/data/model/wallet_history_model.dart';
import 'package:milkride/feature/wallet/data/model/wallet_model.dart';
import 'package:milkride/service/interceptor.dart';
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

  @GET(EndPoints.version + EndPoints.home)
  Future<HomeDataModel> getHomeResponse({
    @Query('user_id') required String userId,
    @Query('mobile_number') required String mobileNumber,
    @Query('length') required int length,
    @Query('type') required String type,
    @Query('version') required String version,
    @Query('device_type') required String deviceType,
    @Query('device_model') required String deviceModel,
    @Query('device_id') required String deviceId,
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

  @GET(EndPoints.version + EndPoints.prodView)
  Future<ProductDetailModel> getProductDetail({
    @Query("customer_id") required String customerId,
    @Query("product_id") required String productId,
  });

  @GET(EndPoints.version + EndPoints.prodVariant)
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

  @POST(EndPoints.version + EndPoints.mySubscription)
  Future<SubscriptionViewModel> getSubscribeResponse({
    @Field('customer_id') required String customerId,
    @Field('user_id') required String userId,
  });

  @POST(EndPoints.version + EndPoints.temporaryChange)
  Future<CommonDataModel> getTemporaryChangeResponse({
    @Field('subscription_id') required String subscriptionId,
    @Field('temp_start_date') required String tempStartDate,
    @Field('temp_end_date') required String tempEndDate,
    @Field('temp_qty') required String tempQty,
  });

  @POST(EndPoints.version + EndPoints.pauseSubscription)
  Future<CommonDataModel> getPauseSubscriptionResponse({
    @Field('subscription_id') required String subscriptionId,
    @Field('pause_start_date') required String pauseStartDate,
    @Field('pause_end_date') required String pauseEndDate,
  });

  @POST(EndPoints.version + EndPoints.resumeSubscription)
  Future<CommonDataModel> getResumeSubscriptionResponse({
    @Field('subscription_id') required String subscriptionId,
    @Field('customer_id') required String customerId,
  });

  @POST(EndPoints.version + EndPoints.updateQuantity)
  Future<CommonDataModel> getUpdateQuantityResponse({
    @Field('subscription_id') required String subscriptionId,
    @Field('frequency_type') required String frequencyType,
    @Field('quantity') required String quantity,
  });

  @POST(EndPoints.version + EndPoints.deleteSubscription)
  Future<CommonDataModel> getDeleteSubscriptionResponse({
    @Field('subscription_id') required String subscriptionId,
  });

  @POST(EndPoints.version + EndPoints.wallet)
  Future<WalletModel> getWalletPageResponse({
    @Field('user_id') required String userId,
    @Field('customer_id') required String customerId,
  });

  @POST(EndPoints.version + EndPoints.walletHistory)
  Future<WalletHistory> getWalletHistoryResponse({
    @Field('customer_id') required String customerId,
  });

  @POST(EndPoints.version + EndPoints.billingHistory)
  Future<WalletHistory> getBillingHistoryResponse({
    @Field('customer_id') required String customerId,
  });

  @POST(EndPoints.version + EndPoints.payOnline)
  Future<PaymentModel> getPayOnlineResponse({
    @Field('customer_id') required String customerId,
    @Field('amount') required String amount,
  });

  @POST(EndPoints.version + EndPoints.verifyPayment)
  Future<CommonDataModel> getVerifyPaymentResponse({
    @Field('customer_id') required String customerId,
    @Field('transaction_id') required String transactionId,
    @Field('order_id') required String orderId,
  });

  @POST(EndPoints.version + EndPoints.paymentRequest)
  Future<CommonDataModel> getPaymentRequestResponse({
    @Field('customer_id') required String customerId,
    @Field('amount') required String amount,
    @Field('date') required String date,
  });

  @GET(EndPoints.version + EndPoints.categoryProducts)
  Future<AllProductModel> getAllProductResponse({
    @Query('customer_id') required String customerId,
    @Query('category_id') required int categoryId,
    @Query('page') required int page,
    @Query('length') required int length,
  });

  @GET(EndPoints.version + EndPoints.categoryProducts)
  Future<AllProductModel> getSearchResponse({
    @Query('customer_id') required String customerId,
    @Query('category_id') required int categoryId,
    @Query('page') required int page,
    @Query('length') required int length,
    @Query('keyword') required String keyword,
  });

  @POST(EndPoints.version + EndPoints.vacation)
  Future<CommonDataModel> getVacationResponse({
    @Field('customer_id') required String customerId,
    @Field('status') required String status,
  });

  @POST(EndPoints.version + EndPoints.profile)
  Future<ProfileModel> getProfileResponse({
    @Field('customer_id') required String customerId,
    @Field('user_id') required String userId,
  });
}
