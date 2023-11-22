// To parse this JSON data, do
//
//     final categoriesModel = categoriesModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

CategoriesModel categoriesModelFromJson(String str) =>
    CategoriesModel.fromJson(json.decode(str));

String categoriesModelToJson(CategoriesModel data) =>
    json.encode(data.toJson());

class CategoriesModel {
  bool status;
  String message;
  List<Datum> data;

  CategoriesModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory CategoriesModel.fromJson(Map<String, dynamic> json) =>
      CategoriesModel(
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
  String slug;
  String icon;
  int parentId;
  int position;
  String createdAt;
  String updatedAt;
  int homeStatus;
  int priority;
  List<Datum> childes;
  List<dynamic> translations;

  Datum({
    required this.id,
    required this.name,
    required this.slug,
    required this.icon,
    required this.parentId,
    required this.position,
    required this.createdAt,
    required this.updatedAt,
    required this.homeStatus,
    required this.priority,
    required this.childes,
    required this.translations,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        icon: json["icon"],
        parentId: json["parent_id"],
        position: json["position"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        homeStatus: json["home_status"],
        priority: json["priority"],
        childes:
            List<Datum>.from(json["childes"].map((x) => Datum.fromJson(x))),
        translations: List<dynamic>.from(json["translations"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
        "icon": icon,
        "parent_id": parentId,
        "position": position,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "home_status": homeStatus,
        "priority": priority,
        "childes": List<dynamic>.from(childes.map((x) => x.toJson())),
        "translations": List<dynamic>.from(translations.map((x) => x)),
      };
}
