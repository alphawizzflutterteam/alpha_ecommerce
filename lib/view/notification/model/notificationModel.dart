// To parse this JSON data, do
//
//     final notificationModel = notificationModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

NotificationModel notificationModelFromJson(String str) =>
    NotificationModel.fromJson(json.decode(str));

String notificationModelToJson(NotificationModel data) =>
    json.encode(data.toJson());

class NotificationModel {
  bool status;
  String message;
  List<DatumNot> data;

  NotificationModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      NotificationModel(
        status: json["status"],
        message: json["message"],
        data:
            List<DatumNot>.from(json["data"].map((x) => DatumNot.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class DatumNot {
  int id;
  String userId;
  String title;
  String message;
  String type;
  String typeId;
  String image;
  String isRead;
  String createdAt;
  String updatedAt;

  DatumNot({
    required this.id,
    required this.userId,
    required this.title,
    required this.message,
    required this.type,
    required this.typeId,
    required this.image,
    required this.isRead,
    required this.createdAt,
    required this.updatedAt,
  });

  factory DatumNot.fromJson(Map<String, dynamic> json) => DatumNot(
        id: json["id"],
        userId: json["user_id"],
        title: json["title"],
        message: json["message"],
        type: json["type"],
        typeId: json["type_id"],
        image: json["image"],
        isRead: json["is_read"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "title": title,
        "message": message,
        "type": type,
        "type_id": typeId,
        "image": image,
        "is_read": isRead,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}
