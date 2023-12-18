// To parse this JSON data, do
//
//     final registerUserResponseModel = registerUserResponseModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

RegisterUserResponseModel registerUserResponseModelFromJson(String str) =>
    RegisterUserResponseModel.fromJson(json.decode(str));

String registerUserResponseModelToJson(RegisterUserResponseModel data) =>
    json.encode(data.toJson());

class RegisterUserResponseModel {
  bool status;
  String message;
  List<dynamic> data;
  List<Error> errors;

  RegisterUserResponseModel({
    required this.status,
    required this.message,
    required this.data,
    required this.errors,
  });

  factory RegisterUserResponseModel.fromJson(Map<String, dynamic> json) =>
      RegisterUserResponseModel(
        status: json["status"],
        message: json["message"],
        data: List<dynamic>.from(json["data"].map((x) => x)),
        errors: List<Error>.from(json["errors"].map((x) => Error.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x)),
        "errors": List<dynamic>.from(errors.map((x) => x.toJson())),
      };
}

class Error {
  String code;
  String message;

  Error({
    required this.code,
    required this.message,
  });

  factory Error.fromJson(Map<String, dynamic> json) => Error(
        code: json["code"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
      };
}
