// To parse this JSON data, do
//
//     final languageModel = languageModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

LanguageModel languageModelFromJson(String str) =>
    LanguageModel.fromJson(json.decode(str));

String languageModelToJson(LanguageModel data) => json.encode(data.toJson());

class LanguageModel {
  bool status;
  String message;
  List<Datum> data;

  LanguageModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory LanguageModel.fromJson(Map<String, dynamic> json) => LanguageModel(
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
  dynamic id;
  String name;
  String direction;
  String code;
  int status;
  bool datumDefault;

  Datum({
    required this.id,
    required this.name,
    required this.direction,
    required this.code,
    required this.status,
    required this.datumDefault,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        direction: json["direction"],
        code: json["code"],
        status: json["status"],
        datumDefault: json["default"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "direction": direction,
        "code": code,
        "status": status,
        "default": datumDefault,
      };
}
