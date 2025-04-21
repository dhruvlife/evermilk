
class Config {
  int? id;
  String? vendorTitle;
  String? vendorDisplayName;
  String? logoUrl;
  bool? isBrandedApp;
  bool? isAndroidApp;
  bool? isIosApp;
  String? orderBefore;
  bool? forceUpdateAndroid;
  String? versionCodeAndroid;
  bool? forceUpdateIos;
  String? versionCodeIos;
  bool? isMaintenanceMode;

  Config(
      {this.id,
      this.vendorTitle,
      this.vendorDisplayName,
      this.logoUrl,
      this.isBrandedApp,
      this.isAndroidApp,
      this.isIosApp,
      this.orderBefore,
      this.forceUpdateAndroid,
      this.versionCodeAndroid,
      this.forceUpdateIos,
      this.versionCodeIos,
      this.isMaintenanceMode});

  Config.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    vendorTitle = json['vendor_title'];
    vendorDisplayName = json['vendor_display_name'];
    logoUrl = json['logo_url'];
    isBrandedApp = json['is_branded_app'];
    isAndroidApp = json['is_android_app'];
    isIosApp = json['is_ios_app'];
    orderBefore = json['order_before'];
    forceUpdateAndroid = json['force_update_android'];
    versionCodeAndroid = json['version_code_android'];
    forceUpdateIos = json['force_update_ios'];
    versionCodeIos = json['version_code_ios'];
    isMaintenanceMode = json['is_maintenance_mode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['vendor_title'] = vendorTitle;
    data['vendor_display_name'] = vendorDisplayName;
    data['logo_url'] = logoUrl;
    data['is_branded_app'] = isBrandedApp;
    data['is_android_app'] = isAndroidApp;
    data['is_ios_app'] = isIosApp;
    data['order_before'] = orderBefore;
    data['force_update_android'] = forceUpdateAndroid;
    data['version_code_android'] = versionCodeAndroid;
    data['force_update_ios'] = forceUpdateIos;
    data['version_code_ios'] = versionCodeIos;
    data['is_maintenance_mode'] = isMaintenanceMode;
    return data;
  }
}
