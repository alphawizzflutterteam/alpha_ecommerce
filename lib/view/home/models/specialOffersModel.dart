// To parse this JSON data, do
//
//     final specialOffersModel = specialOffersModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

SpecialOffersModel specialOffersModelFromJson(String str) =>
    SpecialOffersModel.fromJson(json.decode(str));

String specialOffersModelToJson(SpecialOffersModel data) =>
    json.encode(data.toJson());

class SpecialOffersModel {
  bool status;
  String title;
  String message;
  List<SpecialOffersList> data;

  SpecialOffersModel({
    required this.status,
    required this.title,
    required this.message,
    required this.data,
  });

  factory SpecialOffersModel.fromJson(Map<String, dynamic> json) =>
      SpecialOffersModel(
        status: json["status"],
        title: json["title"],
        message: json["message"],
        data: List<SpecialOffersList>.from(json["data"].map((x) => SpecialOffersList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "title": title,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class SpecialOffersList {
  int id;
  String title;
  DateTime startDate;
  DateTime endDate;
  int status;
  int featured;
  String banner;
  String slug;
  DateTime createdAt;
  DateTime updatedAt;
  String dealType;
  List<dynamic> translations;

  SpecialOffersList({
    required this.id,
    required this.title,
    required this.startDate,
    required this.endDate,
    required this.status,
    required this.featured,
    required this.banner,
    required this.slug,
    required this.createdAt,
    required this.updatedAt,
    required this.dealType,
    required this.translations,
  });

  factory SpecialOffersList.fromJson(Map<String, dynamic> json) => SpecialOffersList(
        id: json["id"],
        title: json["title"],
        startDate: DateTime.parse(json["start_date"]),
        endDate: DateTime.parse(json["end_date"]),
        status: json["status"],
        featured: json["featured"],
        banner: json["banner"],
        slug: json["slug"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        dealType: json["deal_type"],
        translations: List<dynamic>.from(json["translations"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "start_date": startDate.toIso8601String(),
        "end_date": endDate.toIso8601String(),
        "status": status,
        "featured": featured,
        "banner": banner,
        "slug": slug,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "deal_type": dealType,
        "translations": List<dynamic>.from(translations.map((x) => x)),
      };
}
