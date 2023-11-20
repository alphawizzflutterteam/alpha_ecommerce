// To parse this JSON data, do
//
//     final brandsModel = brandsModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

BrandsModel brandsModelFromJson(String str) =>
    BrandsModel.fromJson(json.decode(str));

String brandsModelToJson(BrandsModel data) => json.encode(data.toJson());

class BrandsModel {
  bool status;
  String message;
  List<Datum> data;

  BrandsModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory BrandsModel.fromJson(Map<String, dynamic> json) => BrandsModel(
        status: json["status"],
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  int id;
  String name;
  String image;
  int status;
  DateTime createdAt;
  DateTime updatedAt;
  int brandProductsCount;
  List<dynamic> translations;

  Datum({
    required this.id,
    required this.name,
    required this.image,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.brandProductsCount,
    required this.translations,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        brandProductsCount: json["brand_products_count"],
        translations: List<dynamic>.from(json["translations"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "brand_products_count": brandProductsCount,
        "translations": List<dynamic>.from(translations.map((x) => x)),
      };
}
