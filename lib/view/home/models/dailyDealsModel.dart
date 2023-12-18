// To parse this JSON data, do
//
//     final dailyDealsModel = dailyDealsModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

DailyDealsModel dailyDealsModelFromJson(String str) =>
    DailyDealsModel.fromJson(json.decode(str));

String dailyDealsModelToJson(DailyDealsModel data) =>
    json.encode(data.toJson());

class DailyDealsModel {
  bool status;
  String title;
  String message;
  List<DailyDealsModelList> data;

  DailyDealsModel({
    required this.status,
    required this.title,
    required this.message,
    required this.data,
  });

  factory DailyDealsModel.fromJson(Map<String, dynamic> json) =>
      DailyDealsModel(
        status: json["status"],
        title: json["title"],
        message: json["message"],
        data: List<DailyDealsModelList>.from(
            json["data"].map((x) => DailyDealsModelList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "title": title,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class DailyDealsModelList {
  int id;
  String title;
  String description;
  int productId;
  int discount;
  String discountType;
  int status;
  String createdAt;
  String updatedAt;
  List<dynamic> translations;

  DailyDealsModelList({
    required this.id,
    required this.title,
    required this.description,
    required this.productId,
    required this.discount,
    required this.discountType,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.translations,
  });

  factory DailyDealsModelList.fromJson(Map<String, dynamic> json) =>
      DailyDealsModelList(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        productId: json["product_id"],
        discount: json["discount"],
        discountType: json["discount_type"],
        status: json["status"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        translations: List<dynamic>.from(json["translations"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "product_id": productId,
        "discount": discount,
        "discount_type": discountType,
        "status": status,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "translations": List<dynamic>.from(translations.map((x) => x)),
      };
}
