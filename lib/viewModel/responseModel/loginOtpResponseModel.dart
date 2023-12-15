// To parse this JSON data, do
//
//     final loginOtpResponseModel = loginOtpResponseModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

LoginOtpResponseModel loginOtpResponseModelFromJson(String str) =>
    LoginOtpResponseModel.fromJson(json.decode(str));

String loginOtpResponseModelToJson(LoginOtpResponseModel data) =>
    json.encode(data.toJson());

class LoginOtpResponseModel {
  String token;
  bool status;
  String message;
  List<Datum> data;
  List<Error> errors;

  LoginOtpResponseModel({
    required this.token,
    required this.status,
    required this.message,
    required this.data,
    required this.errors,
  });

  factory LoginOtpResponseModel.fromJson(Map<String, dynamic> json) =>
      LoginOtpResponseModel(
        token: json["token"],
        status: json["status"],
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        errors: List<Error>.from(json["errors"].map((x) => Error.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "errors": List<dynamic>.from(errors.map((x) => x.toJson())),
      };
}

class Datum {
  String otp;
  String mobile;

  Datum({
    required this.otp,
    required this.mobile,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        otp: json["otp"],
        mobile: json["mobile"],
      );

  Map<String, dynamic> toJson() => {
        "otp": otp,
        "mobile": mobile,
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
