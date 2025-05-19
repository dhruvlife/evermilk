import 'package:milkride/feature/subscription/domain/entity/pause_subscription.dart';
import 'package:milkride/feature/subscription/domain/entity/temp_change.dart';

class SubScriptionDetail {
  int? id;
  String? startDate;
  String? endDate;
  String? totalSalePrice;
  int? customerId;
  int? packageId;
  String? frequencyType;
  String? dayWiseQuantity;
  String? deliveryType;
  bool? isSample;
  dynamic qty;
  String? mrpPrice;
  String? volume;
  String? status;
  String? salePrice;
  bool? isPauseSubscription;
  bool? cutOff;
  PauseSubscription? pauseSubscription;
  String? packageSize;
  String? productName;
  int? minQtyAllow;
  int? maxQtyAllow;
  String? imageUrl;
  List<TempChanges>? tempChanges;
  int? remainingUsages;
  bool? isSubscriptionPlan;
  int? packageQty;
  bool? isRenew;
  String? attributeOptions;
  String? withAttributePrice;
  String? planTitle;

  SubScriptionDetail({
    this.id,
    this.startDate,
    this.endDate,
    this.totalSalePrice,
    this.customerId,
    this.packageId,
    this.frequencyType,
    this.dayWiseQuantity,
    this.deliveryType,
    this.isSample,
    this.qty,
    this.mrpPrice,
    this.volume,
    this.status,
    this.salePrice,
    this.isPauseSubscription,
    this.cutOff,
    this.pauseSubscription,
    this.packageSize,
    this.productName,
    this.minQtyAllow,
    this.maxQtyAllow,
    this.imageUrl,
    this.tempChanges,
    this.remainingUsages,
    this.isSubscriptionPlan,
    this.packageQty,
    this.isRenew,
    this.attributeOptions,
    this.withAttributePrice,
    this.planTitle,
  });

  SubScriptionDetail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    totalSalePrice = json['total_sale_price'];
    customerId = json['customer_id'];
    packageId = json['package_id'];
    frequencyType = json['frequency_type'];
    dayWiseQuantity = json['day_wise_quantity'];
    deliveryType = json['delivery_type'];
    isSample = json['is_sample'];
    qty = json['qty'];
    mrpPrice = json['mrp_price'];
    volume = json['volume'];
    status = json['status'];
    salePrice = json['sale_price'];
    isPauseSubscription = json['is_pause_subscription'];
    cutOff = json['cut_off'];
    pauseSubscription = json['pause_subscription'] != null
        ? PauseSubscription.fromJson(json['pause_subscription'])
        : null;
    packageSize = json['package_size'];
    productName = json['product_name'];
    minQtyAllow = json['min_qty_allow'];
    maxQtyAllow = json['max_qty_allow'];
    imageUrl = json['image_url'];
    if (json['temp_changes'] != null) {
      tempChanges = <TempChanges>[];
      json['temp_changes'].forEach((v) {
        tempChanges!.add(TempChanges.fromJson(v));
      });
    }
    remainingUsages = json['remaining_usages'];
    isSubscriptionPlan = json['is_subscription_plan'];
    packageQty = json['package_qty'];
    isRenew = json['is_renew'];
    attributeOptions = json['attribute_options'];
    withAttributePrice = json['with_attribute_price'];
    planTitle = json['plan_title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['start_date'] = startDate;
    data['end_date'] = endDate;
    data['total_sale_price'] = totalSalePrice;
    data['customer_id'] = customerId;
    data['package_id'] = packageId;
    data['frequency_type'] = frequencyType;
    data['day_wise_quantity'] = dayWiseQuantity;
    data['delivery_type'] = deliveryType;
    data['is_sample'] = isSample;
    data['qty'] = qty;
    data['mrp_price'] = mrpPrice;
    data['volume'] = volume;
    data['status'] = status;
    data['sale_price'] = salePrice;
    data['is_pause_subscription'] = isPauseSubscription;
    data['cut_off'] = cutOff;
    if (pauseSubscription != null) {
      data['pause_subscription'] = pauseSubscription!.toJson();
    }
    data['package_size'] = packageSize;
    data['product_name'] = productName;
    data['min_qty_allow'] = minQtyAllow;
    data['max_qty_allow'] = maxQtyAllow;
    data['image_url'] = imageUrl;
    if (tempChanges != null) {
      data['temp_changes'] = tempChanges!.map((v) => v.toJson()).toList();
    }
    data['remaining_usages'] = remainingUsages;
    data['is_subscription_plan'] = isSubscriptionPlan;
    data['package_qty'] = packageQty;
    data['is_renew'] = isRenew;
    data['attribute_options'] = attributeOptions;
    data['with_attribute_price'] = withAttributePrice;
    data['plan_title'] = planTitle;
    return data;
  }
}
