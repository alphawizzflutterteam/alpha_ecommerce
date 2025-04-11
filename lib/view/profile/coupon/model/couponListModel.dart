// To parse this JSON data, do
//
//     final couponModel = couponModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

CouponModel couponModelFromJson(String str) =>
    CouponModel.fromJson(json.decode(str));

String couponModelToJson(CouponModel data) => json.encode(data.toJson());

class CouponModel {
  bool status;
  String message;
  List<CouponList> data;

  CouponModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory CouponModel.fromJson(Map<String, dynamic> json) => CouponModel(
        status: json["status"],
        message: json["message"],
        data: List<CouponList>.from(
            json["data"].map((x) => CouponList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class CouponList {
  int id;
  String addedBy;
  String couponType;
  String couponBearer;
  String sellerId;
  int customerId;
  String title;
  String code;
  String startDate;
  String expireDate;
  dynamic minPurchase;
  int maxDiscount;
  int discount;
  String discountType;
  int status;
  String createdAt;
  String updatedAt;
  int limit;

  CouponList({
    required this.id,
    required this.addedBy,
    required this.couponType,
    required this.couponBearer,
    required this.sellerId,
    required this.customerId,
    required this.title,
    required this.code,
    required this.startDate,
    required this.expireDate,
    required this.minPurchase,
    required this.maxDiscount,
    required this.discount,
    required this.discountType,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.limit,
  });

  factory CouponList.fromJson(Map<String, dynamic> json) => CouponList(
        id: json["id"],
        addedBy: json["added_by"],
        couponType: json["coupon_type"],
        couponBearer: json["coupon_bearer"],
        sellerId: json["seller_id"],
        customerId: json["customer_id"],
        title: json["title"],
        code: json["code"],
        startDate: json["start_date"],
        expireDate: json["expire_date"],
        minPurchase: json["min_purchase"],
        maxDiscount: json["max_discount"],
        discount: json["discount"],
        discountType: json["discount_type"],
        status: json["status"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        limit: json["limit"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "added_by": addedBy,
        "coupon_type": couponType,
        "coupon_bearer": couponBearer,
        "seller_id": sellerId,
        "customer_id": customerId,
        "title": title,
        "code": code,
        "start_date": startDate,
        "expire_date": expireDate,
        "min_purchase": minPurchase,
        "max_discount": maxDiscount,
        "discount": discount,
        "discount_type": discountType,
        "status": status,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "limit": limit,
      };
}
