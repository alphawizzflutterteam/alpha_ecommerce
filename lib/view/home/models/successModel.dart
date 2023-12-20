// To parse this JSON data, do
//
//     final successModel = successModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

SuccessModel successModelFromJson(String str) =>
    SuccessModel.fromJson(json.decode(str));

String successModelToJson(SuccessModel data) => json.encode(data.toJson());

class SuccessModel {
  bool status;
  String message;
  List<dynamic> data;

  SuccessModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory SuccessModel.fromJson(Map<String, dynamic> json) => SuccessModel(
        status: json["status"],
        message: json["message"],
        data: List<dynamic>.from(json["data"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x)),
      };
}

SuccessModel2 successModel2FromJson(String str) =>
    SuccessModel2.fromJson(json.decode(str));

String successModel2ToJson(SuccessModel2 data) => json.encode(data.toJson());

class SuccessModel2 {
  bool status;
  String message;

  SuccessModel2({
    required this.status,
    required this.message,
  });

  factory SuccessModel2.fromJson(Map<String, dynamic> json) => SuccessModel2(
        status: json["status"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
      };
}
