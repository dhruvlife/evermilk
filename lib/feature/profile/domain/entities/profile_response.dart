import 'package:milkride/feature/profile/domain/entities/profile_data.dart';

class ProfileResponse {
  String? status;
  int? statusCode;
  String? message;
  ProfileData? data;
  ProfileResponse({this.status, this.statusCode, this.message, this.data});
}