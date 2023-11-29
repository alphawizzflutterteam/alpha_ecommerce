// To parse this JSON data, do
//
//     final generalConfigModel = generalConfigModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

GeneralConfigModel generalConfigModelFromJson(String str) =>
    GeneralConfigModel.fromJson(json.decode(str));

String generalConfigModelToJson(GeneralConfigModel data) =>
    json.encode(data.toJson());

class GeneralConfigModel {
  String brandSetting;
  String digitalProductSetting;
  int systemDefaultCurrency;
  bool digitalPayment;
  bool cashOnDelivery;
  String sellerRegistration;
  String posActive;
  int companyPhone;
  String companyEmail;
  String companyLogo;
  int deliveryCountryRestriction;
  int deliveryZipCodeAreaRestriction;
  BaseUrls baseUrls;
  StaticUrls staticUrls;
  String aboutUs;
  String privacyPolicy;
  List<dynamic> faq;
  String termsConditions;
  Policy refundPolicy;
  Policy returnPolicy;
  Policy cancellationPolicy;
  List<CurrencyList> currencyList;
  String currencySymbolPosition;
  String businessMode;
  bool maintenanceMode;
  List<Language> language;
  List<Color> colors;
  List<String> unit;
  String shippingMethod;
  bool emailVerification;
  bool phoneVerification;
  String countryCode;
  List<SocialLogin> socialLogin;
  String currencyModel;
  String forgotPasswordVerification;
  String softwareVersion;
  int decimalPointSettings;
  String inhouseSelectedShippingType;
  int billingInputByCustomer;
  int minimumOrderLimit;
  int walletStatus;
  int loyaltyPointStatus;
  int loyaltyPointExchangeRate;
  int loyaltyPointMinimumPoint;
  Map<String, bool> paymentMethods;

  GeneralConfigModel({
    required this.brandSetting,
    required this.digitalProductSetting,
    required this.systemDefaultCurrency,
    required this.digitalPayment,
    required this.cashOnDelivery,
    required this.sellerRegistration,
    required this.posActive,
    required this.companyPhone,
    required this.companyEmail,
    required this.companyLogo,
    required this.deliveryCountryRestriction,
    required this.deliveryZipCodeAreaRestriction,
    required this.baseUrls,
    required this.staticUrls,
    required this.aboutUs,
    required this.privacyPolicy,
    required this.faq,
    required this.termsConditions,
    required this.refundPolicy,
    required this.returnPolicy,
    required this.cancellationPolicy,
    required this.currencyList,
    required this.currencySymbolPosition,
    required this.businessMode,
    required this.maintenanceMode,
    required this.language,
    required this.colors,
    required this.unit,
    required this.shippingMethod,
    required this.emailVerification,
    required this.phoneVerification,
    required this.countryCode,
    required this.socialLogin,
    required this.currencyModel,
    required this.forgotPasswordVerification,
    required this.softwareVersion,
    required this.decimalPointSettings,
    required this.inhouseSelectedShippingType,
    required this.billingInputByCustomer,
    required this.minimumOrderLimit,
    required this.walletStatus,
    required this.loyaltyPointStatus,
    required this.loyaltyPointExchangeRate,
    required this.loyaltyPointMinimumPoint,
    required this.paymentMethods,
  });

  factory GeneralConfigModel.fromJson(Map<String, dynamic> json) =>
      GeneralConfigModel(
        brandSetting: json["brand_setting"],
        digitalProductSetting: json["digital_product_setting"],
        systemDefaultCurrency: json["system_default_currency"],
        digitalPayment: json["digital_payment"],
        cashOnDelivery: json["cash_on_delivery"],
        sellerRegistration: json["seller_registration"],
        posActive: json["pos_active"],
        companyPhone: json["company_phone"],
        companyEmail: json["company_email"],
        companyLogo: json["company_logo"],
        deliveryCountryRestriction: json["delivery_country_restriction"],
        deliveryZipCodeAreaRestriction:
            json["delivery_zip_code_area_restriction"],
        baseUrls: BaseUrls.fromJson(json["base_urls"]),
        staticUrls: StaticUrls.fromJson(json["static_urls"]),
        aboutUs: json["about_us"],
        privacyPolicy: json["privacy_policy"],
        faq: List<dynamic>.from(json["faq"].map((x) => x)),
        termsConditions: json["terms_&_conditions"],
        refundPolicy: Policy.fromJson(json["refund_policy"]),
        returnPolicy: Policy.fromJson(json["return_policy"]),
        cancellationPolicy: Policy.fromJson(json["cancellation_policy"]),
        currencyList: List<CurrencyList>.from(
            json["currency_list"].map((x) => CurrencyList.fromJson(x))),
        currencySymbolPosition: json["currency_symbol_position"],
        businessMode: json["business_mode"],
        maintenanceMode: json["maintenance_mode"],
        language: List<Language>.from(
            json["language"].map((x) => Language.fromJson(x))),
        colors: List<Color>.from(json["colors"].map((x) => Color.fromJson(x))),
        unit: List<String>.from(json["unit"].map((x) => x)),
        shippingMethod: json["shipping_method"],
        emailVerification: json["email_verification"],
        phoneVerification: json["phone_verification"],
        countryCode: json["country_code"],
        socialLogin: List<SocialLogin>.from(
            json["social_login"].map((x) => SocialLogin.fromJson(x))),
        currencyModel: json["currency_model"],
        forgotPasswordVerification: json["forgot_password_verification"],
        softwareVersion: json["software_version"],
        decimalPointSettings: json["decimal_point_settings"],
        inhouseSelectedShippingType: json["inhouse_selected_shipping_type"],
        billingInputByCustomer: json["billing_input_by_customer"],
        minimumOrderLimit: json["minimum_order_limit"],
        walletStatus: json["wallet_status"],
        loyaltyPointStatus: json["loyalty_point_status"],
        loyaltyPointExchangeRate: json["loyalty_point_exchange_rate"],
        loyaltyPointMinimumPoint: json["loyalty_point_minimum_point"],
        paymentMethods: Map.from(json["payment_methods"])
            .map((k, v) => MapEntry<String, bool>(k, v)),
      );

  Map<String, dynamic> toJson() => {
        "brand_setting": brandSetting,
        "digital_product_setting": digitalProductSetting,
        "system_default_currency": systemDefaultCurrency,
        "digital_payment": digitalPayment,
        "cash_on_delivery": cashOnDelivery,
        "seller_registration": sellerRegistration,
        "pos_active": posActive,
        "company_phone": companyPhone,
        "company_email": companyEmail,
        "company_logo": companyLogo,
        "delivery_country_restriction": deliveryCountryRestriction,
        "delivery_zip_code_area_restriction": deliveryZipCodeAreaRestriction,
        "base_urls": baseUrls.toJson(),
        "static_urls": staticUrls.toJson(),
        "about_us": aboutUs,
        "privacy_policy": privacyPolicy,
        "faq": List<dynamic>.from(faq.map((x) => x)),
        "terms_&_conditions": termsConditions,
        "refund_policy": refundPolicy.toJson(),
        "return_policy": returnPolicy.toJson(),
        "cancellation_policy": cancellationPolicy.toJson(),
        "currency_list":
            List<dynamic>.from(currencyList.map((x) => x.toJson())),
        "currency_symbol_position": currencySymbolPosition,
        "business_mode": businessMode,
        "maintenance_mode": maintenanceMode,
        "language": List<dynamic>.from(language.map((x) => x.toJson())),
        "colors": List<dynamic>.from(colors.map((x) => x.toJson())),
        "unit": List<dynamic>.from(unit.map((x) => x)),
        "shipping_method": shippingMethod,
        "email_verification": emailVerification,
        "phone_verification": phoneVerification,
        "country_code": countryCode,
        "social_login": List<dynamic>.from(socialLogin.map((x) => x.toJson())),
        "currency_model": currencyModel,
        "forgot_password_verification": forgotPasswordVerification,
        "software_version": softwareVersion,
        "decimal_point_settings": decimalPointSettings,
        "inhouse_selected_shipping_type": inhouseSelectedShippingType,
        "billing_input_by_customer": billingInputByCustomer,
        "minimum_order_limit": minimumOrderLimit,
        "wallet_status": walletStatus,
        "loyalty_point_status": loyaltyPointStatus,
        "loyalty_point_exchange_rate": loyaltyPointExchangeRate,
        "loyalty_point_minimum_point": loyaltyPointMinimumPoint,
        "payment_methods": Map.from(paymentMethods)
            .map((k, v) => MapEntry<String, dynamic>(k, v)),
      };
}

class BaseUrls {
  String productImageUrl;
  String productThumbnailUrl;
  String digitalProductUrl;
  String brandImageUrl;
  String customerImageUrl;
  String bannerImageUrl;
  String categoryImageUrl;
  String reviewImageUrl;
  String sellerImageUrl;
  String shopImageUrl;
  String notificationImageUrl;
  String deliveryManImageUrl;

  BaseUrls({
    required this.productImageUrl,
    required this.productThumbnailUrl,
    required this.digitalProductUrl,
    required this.brandImageUrl,
    required this.customerImageUrl,
    required this.bannerImageUrl,
    required this.categoryImageUrl,
    required this.reviewImageUrl,
    required this.sellerImageUrl,
    required this.shopImageUrl,
    required this.notificationImageUrl,
    required this.deliveryManImageUrl,
  });

  factory BaseUrls.fromJson(Map<String, dynamic> json) => BaseUrls(
        productImageUrl: json["product_image_url"],
        productThumbnailUrl: json["product_thumbnail_url"],
        digitalProductUrl: json["digital_product_url"],
        brandImageUrl: json["brand_image_url"],
        customerImageUrl: json["customer_image_url"],
        bannerImageUrl: json["banner_image_url"],
        categoryImageUrl: json["category_image_url"],
        reviewImageUrl: json["review_image_url"],
        sellerImageUrl: json["seller_image_url"],
        shopImageUrl: json["shop_image_url"],
        notificationImageUrl: json["notification_image_url"],
        deliveryManImageUrl: json["delivery_man_image_url"],
      );

  Map<String, dynamic> toJson() => {
        "product_image_url": productImageUrl,
        "product_thumbnail_url": productThumbnailUrl,
        "digital_product_url": digitalProductUrl,
        "brand_image_url": brandImageUrl,
        "customer_image_url": customerImageUrl,
        "banner_image_url": bannerImageUrl,
        "category_image_url": categoryImageUrl,
        "review_image_url": reviewImageUrl,
        "seller_image_url": sellerImageUrl,
        "shop_image_url": shopImageUrl,
        "notification_image_url": notificationImageUrl,
        "delivery_man_image_url": deliveryManImageUrl,
      };
}

class Policy {
  int status;
  String content;

  Policy({
    required this.status,
    required this.content,
  });

  factory Policy.fromJson(Map<String, dynamic> json) => Policy(
        status: json["status"],
        content: json["content"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "content": content,
      };
}

class Color {
  int id;
  String name;
  String code;
  String createdAt;
  String updatedAt;

  Color({
    required this.id,
    required this.name,
    required this.code,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Color.fromJson(Map<String, dynamic> json) => Color(
        id: json["id"],
        name: json["name"],
        code: json["code"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "code": code,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}

class CurrencyList {
  int id;
  String name;
  String symbol;
  String code;
  double exchangeRate;
  int status;
  String createdAt;
  String updatedAt;

  CurrencyList({
    required this.id,
    required this.name,
    required this.symbol,
    required this.code,
    required this.exchangeRate,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  factory CurrencyList.fromJson(Map<String, dynamic> json) => CurrencyList(
        id: json["id"],
        name: json["name"],
        symbol: json["symbol"],
        code: json["code"],
        exchangeRate: json["exchange_rate"]?.toDouble(),
        status: json["status"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "symbol": symbol,
        "code": code,
        "exchange_rate": exchangeRate,
        "status": status,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}

class Language {
  String code;
  String name;

  Language({
    required this.code,
    required this.name,
  });

  factory Language.fromJson(Map<String, dynamic> json) => Language(
        code: json["code"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "name": name,
      };
}

class SocialLogin {
  String loginMedium;
  bool status;

  SocialLogin({
    required this.loginMedium,
    required this.status,
  });

  factory SocialLogin.fromJson(Map<String, dynamic> json) => SocialLogin(
        loginMedium: json["login_medium"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "login_medium": loginMedium,
        "status": status,
      };
}

class StaticUrls {
  String contactUs;
  String brands;
  String categories;
  String customerAccount;

  StaticUrls({
    required this.contactUs,
    required this.brands,
    required this.categories,
    required this.customerAccount,
  });

  factory StaticUrls.fromJson(Map<String, dynamic> json) => StaticUrls(
        contactUs: json["contact_us"],
        brands: json["brands"],
        categories: json["categories"],
        customerAccount: json["customer_account"],
      );

  Map<String, dynamic> toJson() => {
        "contact_us": contactUs,
        "brands": brands,
        "categories": categories,
        "customer_account": customerAccount,
      };
}
