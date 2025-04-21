class Product {
  int? id;
  String? name;
  String? salePrice;
  String? mrpPrice;
  String? indexType;
  int? productId;
  String? packageSize;
  String? imageUrl;
  String? brand;
  String? volume;
  String? foodType;
  bool? isEggless;
  String? deliveryType;
  bool? allowInCart;
  bool? allowInSubscription;
  bool? mustTry;
  int? minQtyAllow;
  int? maxQtyAllow;
  String? otherInfo;
  String? storageUsage;
  String? benefits;
  String? description;
  int? percentageDifference;
  bool? inStock;
  bool? isTrial;
  // Map<String, dynamic> trialPackage;
  bool? isSubscriptionPlan;
  String? planTitle;
  int? qty;
  int? price;
  String? priceDecimal;
  int? totalPrice;
  String? totalPriceDecimal;
  String? deliveryDate;
  int? cartId;

  Product(
      {this.id,
      this.name,
      this.salePrice,
      this.mrpPrice,
      this.indexType,
      this.productId,
      this.packageSize,
      this.imageUrl,
      this.brand,
      this.volume,
      this.foodType,
      this.isEggless,
      this.deliveryType,
      this.allowInCart,
      this.allowInSubscription,
      this.mustTry,
      this.minQtyAllow,
      this.maxQtyAllow,
      this.otherInfo,
      this.storageUsage,
      this.benefits,
      this.description,
      this.percentageDifference,
      this.inStock,
      this.isTrial,
      // this.trialPackage,
      this.isSubscriptionPlan,
      this.qty,
      this.price,
      this.priceDecimal,
      this.totalPrice,
      this.totalPriceDecimal,
      this.deliveryDate,
      this.cartId,
      this.planTitle});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    salePrice = json['sale_price']?.toString();
    mrpPrice = json['mrp_price']?.toString();
    indexType = json['index_type'];
    productId = json['product_id'];
    packageSize = json['package_size'];
    imageUrl = json['image_url'];
    brand = json['brand'];
    volume = json['volume'];
    foodType = json['food_type'];
    isEggless = json['is_eggless'];
    deliveryType = json['delivery_type'];
    allowInCart = json['allow_in_cart'];
    allowInSubscription = json['allow_in_subscription'];
    mustTry = json['must_try'];
    minQtyAllow = json['min_qty_allow'];
    maxQtyAllow = json['max_qty_allow'];
    otherInfo = json['other_info'];
    storageUsage = json['storage_usage'];
    benefits = json['benefits'];
    description = json['description'];
    percentageDifference = json['percentage_difference'];
    inStock = json['in_stock'];
    isTrial = json['is_trial'];
    // trialPackage = json['trial_package'];
    isSubscriptionPlan = json['is_subscription_plan'];
    planTitle = json['plan_title'];
    qty = json['qty'];
    price = json['price'];
    priceDecimal = json['price_decimal'];
    totalPrice = json['total_price'];
    totalPriceDecimal = json['total_price_decimal'];
    deliveryDate = json['delivery_date'];
    cartId = json['cart_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['sale_price'] = salePrice;
    data['mrp_price'] = mrpPrice;
    data['index_type'] = indexType;
    data['product_id'] = productId;
    data['package_size'] = packageSize;
    data['image_url'] = imageUrl;
    data['brand'] = brand;
    data['volume'] = volume;
    data['food_type'] = foodType;
    data['is_eggless'] = isEggless;
    data['delivery_type'] = deliveryType;
    data['allow_in_cart'] = allowInCart;
    data['allow_in_subscription'] = allowInSubscription;
    data['must_try'] = mustTry;
    data['min_qty_allow'] = minQtyAllow;
    data['max_qty_allow'] = maxQtyAllow;
    data['other_info'] = otherInfo;
    data['storage_usage'] = storageUsage;
    data['benefits'] = benefits;
    data['description'] = description;
    data['percentage_difference'] = percentageDifference;
    data['in_stock'] = inStock;
    data['is_trial'] = isTrial;
    // data['trial_package'] = trialPackage;
    data['is_subscription_plan'] = isSubscriptionPlan;
    data['plan_title'] = planTitle;
    data['qty'] = qty;
    data['price'] = price;
    data['price_decimal'] = priceDecimal;
    data['total_price'] = totalPrice;
    data['total_price_decimal'] = totalPriceDecimal;
    data['delivery_date'] = deliveryDate;
    data['cart_id'] = cartId;
    return data;
  }
}
// class Product {
//   int? id;
//   int? productId;
//   String? name;
//   String? salePrice;
//   String? salePriceDecimal;
//   String? mrpPrice;
//   String? mrpPriceDecimal;
//   String? indexType;
//   String? packageSize;
//   String? imageUrl;
//   String? brand;
//   String? volume;
//   String? foodType;
//   bool? isEggless;
//   bool? mustTry;

//   Product(
//       {this.id,
//       this.productId,
//       this.name,
//       this.salePrice,
//       this.salePriceDecimal,
//       this.mrpPrice,
//       this.mrpPriceDecimal,
//       this.indexType,
//       this.packageSize,
//       this.imageUrl,
//       this.brand,
//       this.volume,
//       this.foodType,
//       this.isEggless,
//       this.mustTry});

//   Product.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     productId = json['product_id'];
//     name = json['name'];
//     salePrice = json['sale_price'];
//     salePriceDecimal = json['sale_price_decimal'];
//     mrpPrice = json['mrp_price'];
//     mrpPriceDecimal = json['mrp_price_decimal'];
//     indexType = json['index_type'];
//     packageSize = json['package_size'];
//     imageUrl = json['image_url'];
//     brand = json['brand'];
//     volume = json['volume'];
//     foodType = json['food_type'];
//     isEggless = json['is_eggless'];
//     mustTry = json['must_try'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['id'] = id;
//     data['product_id'] = productId;
//     data['name'] = name;
//     data['sale_price'] = salePrice;
//     data['sale_price_decimal'] = salePriceDecimal;
//     data['mrp_price'] = mrpPrice;
//     data['mrp_price_decimal'] = mrpPriceDecimal;
//     data['index_type'] = indexType;
//     data['package_size'] = packageSize;
//     data['image_url'] = imageUrl;
//     data['brand'] = brand;
//     data['volume'] = volume;
//     data['food_type'] = foodType;
//     data['is_eggless'] = isEggless;
//     data['must_try'] = mustTry;
//     return data;
//   }
// }

// class Product {
//   int? id;
//   String? name;
//   String? salePrice;
//   String? mrpPrice;
//   String? indexType;
//   int? productId;
//   String? packageSize;
//   String? imageUrl;
//   String? brand;
//   String? volume;
//   String? foodType;
//   bool? isEggless;
//   bool? mustTry;

//   Product(
//       {this.id,
//       this.name,
//       this.salePrice,
//       this.mrpPrice,
//       this.indexType,
//       this.productId,
//       this.packageSize,
//       this.imageUrl,
//       this.brand,
//       this.volume,
//       this.foodType,
//       this.isEggless,
//       this.mustTry});

//   Product.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     salePrice = json['sale_price'];
//     mrpPrice = json['mrp_price'];
//     indexType = json['index_type'];
//     productId = json['product_id'];
//     packageSize = json['package_size'];
//     imageUrl = json['image_url'];
//     brand = json['brand'];
//     volume = json['volume'];
//     foodType = json['food_type'];
//     isEggless = json['is_eggless'];
//     mustTry = json['must_try'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['id'] = id;
//     data['name'] = name;
//     data['sale_price'] = salePrice;
//     data['mrp_price'] = mrpPrice;
//     data['index_type'] = indexType;
//     data['product_id'] = productId;
//     data['package_size'] = packageSize;
//     data['image_url'] = imageUrl;
//     data['brand'] = brand;
//     data['volume'] = volume;
//     data['food_type'] = foodType;
//     data['is_eggless'] = isEggless;
//     data['must_try'] = mustTry;
//     return data;
//   }
// }