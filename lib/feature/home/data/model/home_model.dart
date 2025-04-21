import 'package:milkride/feature/home/domain/entities/home_data.dart';
import 'package:milkride/feature/home/domain/entities/home_response.dart';

class HomeDataModel extends HomeResponse {
  HomeDataModel({super.homeData, super.message, super.status, super.statusCode});

  HomeDataModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    statusCode = json['statusCode'];
    message = json['message'];
    homeData = json['data'] != null ? HomeData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> response = <String, dynamic>{};
    response['status'] = status;
    response['statusCode'] = statusCode;
    response['message'] = message;
    if (homeData != null) {
      response['data'] = homeData!.toJson();
    }
    return response;
  }
}

