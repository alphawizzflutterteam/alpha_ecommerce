// To parse this JSON data, do
//
//     final countryModel = countryModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

CountryModel countryModelFromJson(String str) =>
    CountryModel.fromJson(json.decode(str));

String countryModelToJson(CountryModel data) => json.encode(data.toJson());

class CountryModel {
  bool status;
  String message;
  List<CountryList> data;

  CountryModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory CountryModel.fromJson(Map<String, dynamic> json) => CountryModel(
        status: json["status"],
        message: json["message"],
        data: List<CountryList>.from(
            json["data"].map((x) => CountryList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class CountryList {
  int id;
  String name;

  CountryList({
    required this.id,
    required this.name,
  });

  factory CountryList.fromJson(Map<String, dynamic> json) => CountryList(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
