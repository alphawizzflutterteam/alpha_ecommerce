// To parse this JSON data, do
//
//     final bannersModel = bannersModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

BannersModel bannersModelFromJson(String str) =>
    BannersModel.fromJson(json.decode(str));

String bannersModelToJson(BannersModel data) => json.encode(data.toJson());

class BannersModel {
  bool status;
  String message;
  List<BannersList> data;

  BannersModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory BannersModel.fromJson(Map<String, dynamic> json) => BannersModel(
        status: json["status"],
        message: json["message"],
        data: List<BannersList>.from(
            json["data"].map((x) => BannersList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class BannersList {
  int id;
  String photo;
  String bannerType;
  int published;
  String createdAt;
  String updatedAt;
  String url;
  String resourceType;
  int resourceId;
  // List<Product> product;

  BannersList({
    required this.id,
    required this.photo,
    required this.bannerType,
    required this.published,
    required this.createdAt,
    required this.updatedAt,
    required this.url,
    required this.resourceType,
    required this.resourceId,
    // required this.product,
  });

  factory BannersList.fromJson(Map<String, dynamic> json) => BannersList(
        id: json["id"],
        photo: json["photo"],
        bannerType: json["banner_type"],
        published: json["published"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        url: json["url"],
        resourceType: json["resource_type"],
        resourceId: json["resource_id"],
        // product:
        //     List<Product>.from(json["product"].map((x) => Product.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "photo": photo,
        "banner_type": bannerType,
        "published": published,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "url": url,
        "resource_type": resourceType,
        "resource_id": resourceId,
        // "product": List<dynamic>.from(product.map((x) => x.toJson())),
      };
}
