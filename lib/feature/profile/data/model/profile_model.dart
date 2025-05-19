import 'package:milkride/feature/profile/domain/entities/profile_data.dart';
import 'package:milkride/feature/profile/domain/entities/profile_response.dart';

class ProfileModel extends ProfileResponse{
  ProfileModel({super.data,super.message,super.status,super.statusCode});
  ProfileModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    statusCode = json['statusCode'];
    message = json['message'];
    data = json['data'] != null ? ProfileData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['statusCode'] = statusCode;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

