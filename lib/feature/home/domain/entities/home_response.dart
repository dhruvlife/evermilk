
import 'package:milkride/feature/home/domain/entities/home_data.dart';

class HomeResponse {
  String? status;
  int? statusCode;
  String? message;
  HomeData? homeData;

  HomeResponse({this.status, this.statusCode, this.message, this.homeData});
}
