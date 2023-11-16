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

  LoginOtpResponseModel({
    required this.token,
    required this.status,
    required this.message,
    required this.data,
  });

  factory LoginOtpResponseModel.fromJson(Map<String, dynamic> json) =>
      LoginOtpResponseModel(
        token: json["token"],
        status: json["status"],
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
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
