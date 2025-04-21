import 'package:milkride/feature/auth/domain/entity/register_region.dart';
import 'package:milkride/feature/auth/domain/entity/register_source.dart';
import 'package:milkride/feature/auth/domain/entity/register_user_data.dart';

class SignupDetail {
  String? customerMobileNumber;
  UserData? user;
  List<Source>? sources;
  List<dynamic>? areas;
  List<Region>? regions;

  SignupDetail({this.customerMobileNumber, this.user, this.sources, this.areas, this.regions});

  SignupDetail.fromJson(Map<String, dynamic> json) {
    customerMobileNumber = json['customer_mobile_number'];
    user = json['user'] != null ? UserData.fromJson(json['user']) : null;
    if (json['sources'] != null) {
      sources = <Source>[];
      json['sources'].forEach((v) {
        sources!.add(Source.fromJson(v));
      });
    }
    areas = json['areas'] ?? [];
    if (json['regions'] != null) {
      regions = <Region>[];
      json['regions'].forEach((v) {
        regions!.add(Region.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> response = <String, dynamic>{};
    response['customer_mobile_number'] = customerMobileNumber;
    if (user != null) {
      response['user'] = user!.toJson();
    }
    if (sources != null) {
      response['sources'] = sources!.map((v) => v.toJson()).toList();
    }
    response['areas'] = areas;
    if (regions != null) {
      response['regions'] = regions!.map((v) => v.toJson()).toList();
    }
    return response;
  }
}
