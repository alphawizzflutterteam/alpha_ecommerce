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
  List<CategoriesList> data;

  CategoriesModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory CategoriesModel.fromJson(Map<String, dynamic> json) =>
      CategoriesModel(
        status: json["status"],
        message: json["message"],
        data: List<CategoriesList>.from(
            json["data"].map((x) => CategoriesList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<CategoriesList>.from(data.map((x) => x.toJson())),
      };
}

class CategoriesList {
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
  //List<CategoriesList> childes;

  CategoriesList({
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
    //required this.childes,
  });

  factory CategoriesList.fromJson(Map<String, dynamic> json) => CategoriesList(
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
        // childes: List<CategoriesList>.from(
        //     json["childes"].map((x) => CategoriesList.fromJson(x))),
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
        //"childes": List<CategoriesList>.from(childes.map((x) => x.toJson())),
      };
}
