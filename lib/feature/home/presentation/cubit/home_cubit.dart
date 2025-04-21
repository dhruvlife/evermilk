import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:milkride/core/constant/app_strings.dart';
import 'package:milkride/core/failure/failure.dart';
import 'package:milkride/core/storage/storage_key.dart';
import 'package:milkride/core/storage/storage_object.dart';
import 'package:milkride/core/utils/app_functional_components.dart';
import 'package:milkride/feature/auth/domain/entity/customer.dart';
import 'package:milkride/feature/product/domain/entities/categories.dart';
import 'package:milkride/feature/home/domain/entities/config.dart';
import 'package:milkride/feature/home/domain/entities/header_banner.dart';
import 'package:milkride/feature/home/domain/entities/home_data.dart';
import 'package:milkride/feature/home/domain/entities/home_response.dart';
import 'package:milkride/feature/product/domain/entities/product.dart';
import 'package:milkride/feature/home/domain/usecase/home_usecase.dart';
import 'package:package_info_plus/package_info_plus.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeUsecase homeUsecase;
  HomeCubit({required this.homeUsecase}) : super(HomeInitial());

  HomeData? homeData;
  Customer? userData;
  List<Product>? bestSeller;
  List<Product>? newArrival;
  List<Product>? seasonal;
  List<Categories>? categories;
  List<Banners>? headerBanners;
  List<Banners>? middleBanners;
  List<Banners>? footerBanners;
  Config? config;

  Future<void> getHomeResponse({required HomeParam homeParam}) async {
    emit(HomeLoading());
    try {
      final Either<Failure, HomeResponse> response =
          await homeUsecase.call(homeParam);
      response.fold(
        (failure) {
          emit(HomeError(errorMessage: failure.messege));
          AppFunctionalComponents.showSnackBar(message: failure.messege);
        },
        (homeResponse) {
          emit(HomeLoaded(homeResponse: homeResponse));
          if (homeResponse.message == AppStrings.homeSuccess) {
            homeData = homeResponse.homeData;
            config = homeData?.config;
            userData = homeData?.customer;
            bestSeller = homeData?.bestSeller;
            newArrival = homeData?.newArrival;
            seasonal = homeData?.seasonal;
            categories = homeData?.categories;
            headerBanners = homeData?.headerBanners;
            middleBanners = homeData?.middleBanners;
            footerBanners = homeData?.footerBanners;
            AppFunctionalComponents.showSnackBar(
              message: AppStrings.homeSnacSuccess,
            );
          } else if (homeResponse.message == AppStrings.homeFailAuth) {
            AppFunctionalComponents.showSnackBar(
              message: AppStrings.homeFailAuthSanc,
            );
          } else {
            emit(HomeError(errorMessage: homeResponse.message.toString()));
            AppFunctionalComponents.showSnackBar(
              message: AppStrings.unExpectedError,
            );
          }
        },
      );
    } on DioException catch (e) {
      emit(HomeError(errorMessage: e.toString()));
      AppFunctionalComponents.showSnackBar(message: e.toString());
    }
  }

  Future<void> fetchUserDeviceData() async {
    final deviceInfo = DeviceInfoPlugin();
    final packageInfo = await PackageInfo.fromPlatform();
    final androidInfo = await deviceInfo.androidInfo;
    await getHomeResponse(
      homeParam: HomeParam(
        mobileNumber: StorageObject.readData(StorageKeys.mobileNumber),
        userId:StorageObject.readData(StorageKeys.userId),
        type: "app",
        deviceType: "Android",
        deviceModel: androidInfo.model,
        deviceId: androidInfo.id,
        version: packageInfo.version,
      ),
    );
  }
}
