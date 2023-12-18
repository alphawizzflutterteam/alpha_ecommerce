// To parse this JSON data, do
//
//     final vendorModel = vendorModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

VendorModel vendorModelFromJson(String str) =>
    VendorModel.fromJson(json.decode(str));

String vendorModelToJson(VendorModel data) => json.encode(data.toJson());

class VendorModel {
  bool status;
  String message;
  List<VendorDatum> data;

  VendorModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory VendorModel.fromJson(Map<String, dynamic> json) => VendorModel(
        status: json["status"],
        message: json["message"],
        data: List<VendorDatum>.from(
            json["data"].map((x) => VendorDatum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class VendorDatum {
  int id;
  int sellerId;
  String name;
  String address;
  String contact;
  String image;
  String bottomBanner;
  String vacationStartDate;
  String vacationEndDate;
  String vacationNote;
  int vacationStatus;
  int temporaryClose;
  String createdAt;
  String updatedAt;
  String rating;
  String followers;
  String isVerified;
  String isFollowing;
  String banner;

  VendorDatum({
    required this.id,
    required this.sellerId,
    required this.name,
    required this.address,
    required this.contact,
    required this.image,
    required this.bottomBanner,
    required this.vacationStartDate,
    required this.vacationEndDate,
    required this.vacationNote,
    required this.vacationStatus,
    required this.temporaryClose,
    required this.createdAt,
    required this.updatedAt,
    required this.rating,
    required this.followers,
    required this.isVerified,
    required this.isFollowing,
    required this.banner,
  });

  factory VendorDatum.fromJson(Map<String, dynamic> json) => VendorDatum(
        id: json["id"],
        sellerId: json["seller_id"],
        name: json["name"],
        address: json["address"],
        contact: json["contact"],
        image: json["image"],
        bottomBanner: json["bottom_banner"],
        vacationStartDate: json["vacation_start_date"],
        vacationEndDate: json["vacation_end_date"],
        vacationNote: json["vacation_note"],
        vacationStatus: json["vacation_status"],
        temporaryClose: json["temporary_close"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        rating: json["rating"],
        followers: json["followers"],
        isVerified: json["is_verified"],
        isFollowing: json["is_following"],
        banner: json["banner"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "seller_id": sellerId,
        "name": name,
        "address": address,
        "contact": contact,
        "image": image,
        "bottom_banner": bottomBanner,
        "vacation_start_date": vacationStartDate,
        "vacation_end_date": vacationEndDate,
        "vacation_note": vacationNote,
        "vacation_status": vacationStatus,
        "temporary_close": temporaryClose,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "rating": rating,
        "followers": followers,
        "is_verified": isVerified,
        "is_following": isFollowing,
        "banner": banner,
      };
}
