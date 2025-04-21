import 'package:milkride/feature/auth/domain/entity/customer.dart';
import 'package:milkride/feature/product/domain/entities/product.dart';
import 'package:milkride/feature/product/domain/entities/categories.dart';
import 'package:milkride/feature/home/domain/entities/config.dart';
import 'package:milkride/feature/home/domain/entities/header_banner.dart';
import 'package:milkride/feature/home/domain/entities/referal_program.dart';

class HomeData {
  Config? config;
  Customer? customer;
  List<Banners>? headerBanners;
  List<Categories>? categories;
  List<Product>? bestSeller;
  List<Banners>? middleBanners;
  List<Product>? newArrival;
  List<Banners>? footerBanners;
  List<Product>? seasonal;
  int? isVacation;
  int? cartQty;
  List<ReferralProgram>? referralProgram;

  HomeData({
    this.config,
    this.customer,
    this.headerBanners,
    this.categories,
    this.bestSeller,
    this.middleBanners,
    this.newArrival,
    this.footerBanners,
    this.seasonal,
    this.isVacation,
    this.cartQty,
    this.referralProgram,
  });

  HomeData.fromJson(Map<String, dynamic> json) {
    config = json['config'] != null ? Config.fromJson(json['config']) : null;
    customer =
        json['customer'] != null ? Customer.fromJson(json['customer']) : null;
    if (json['headerBanners'] != null) {
      headerBanners = <Banners>[];
      json['headerBanners'].forEach((v) {
        headerBanners!.add(Banners.fromJson(v));
      });
    }
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories!.add(Categories.fromJson(v));
      });
    }
    if (json['bestSeller'] != null) {
      bestSeller = <Product>[];
      json['bestSeller'].forEach((v) {
        bestSeller!.add(Product.fromJson(v));
      });
    }
    if (json['middleBanners'] != null) {
      middleBanners = <Banners>[];
      json['middleBanners'].forEach((v) {
        middleBanners!.add(Banners.fromJson(v));
      });
    }
    if (json['newArrival'] != null) {
      newArrival = <Product>[];
      json['newArrival'].forEach((v) {
        newArrival!.add(Product.fromJson(v));
      });
    }
    if (json['footerBanners'] != null) {
      footerBanners = <Banners>[];
      json['footerBanners'].forEach((v) {
        footerBanners!.add(Banners.fromJson(v));
      });
    }
    if (json['seasonal'] != null) {
      seasonal = <Product>[];
      json['seasonal'].forEach((v) {
        seasonal!.add(Product.fromJson(v));
      });
    }
    isVacation = json['isVacation'];
    cartQty = json['cart_qty'];
    if (json['referralProgram'] != null) {
      referralProgram = <ReferralProgram>[];
      json['referralProgram'].forEach((v) {
        referralProgram!.add(ReferralProgram.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (config != null) {
      data['config'] = config!.toJson();
    }
    if (customer != null) {
      data['customer'] = customer!.toJson();
    }
    if (headerBanners != null) {
      data['headerBanners'] = headerBanners!.map((v) => v.toJson()).toList();
    }
    if (categories != null) {
      data['categories'] = categories!.map((v) => v.toJson()).toList();
    }
    if (bestSeller != null) {
      data['bestSeller'] = bestSeller!.map((v) => v.toJson()).toList();
    }
    if (middleBanners != null) {
      data['middleBanners'] = middleBanners!.map((v) => v.toJson()).toList();
    }
    if (newArrival != null) {
      data['newArrival'] = newArrival!.map((v) => v.toJson()).toList();
    }
    if (footerBanners != null) {
      data['footerBanners'] = footerBanners!.map((v) => v.toJson()).toList();
    }
    if (seasonal != null) {
      data['seasonal'] = seasonal!.map((v) => v.toJson()).toList();
    }
    data['isVacation'] = isVacation;
    data['cart_qty'] = cartQty;
    if (referralProgram != null) {
      data['referralProgram'] =
          referralProgram!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
