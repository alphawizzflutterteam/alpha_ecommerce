// To parse this JSON data, do
//
//     final addressModel = addressModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

AddressModel addressModelFromJson(String str) =>
    AddressModel.fromJson(json.decode(str));

String addressModelToJson(AddressModel data) => json.encode(data.toJson());

class AddressModel {
  bool status;
  String message;
  List<AddressList> data;

  AddressModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory AddressModel.fromJson(Map<String, dynamic> json) => AddressModel(
        status: json["status"],
        message: json["message"],
        data: List<AddressList>.from(
            json["data"].map((x) => AddressList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class AddressList {
  int id;
  int customerId;
  String contactPersonName;
  String addressType;
  String address;
  String address1;
  String city;
  String zip;
  String phone;
  String altPhone;
  String createdAt;
  String updatedAt;
  String state;
  String country;
  String latitude;
  String longitude;
  int isBilling;

  AddressList({
    required this.id,
    required this.customerId,
    required this.contactPersonName,
    required this.addressType,
    required this.address,
    required this.address1,
    required this.city,
    required this.zip,
    required this.phone,
    required this.altPhone,
    required this.createdAt,
    required this.updatedAt,
    required this.state,
    required this.country,
    required this.latitude,
    required this.longitude,
    required this.isBilling,
  });

  factory AddressList.fromJson(Map<String, dynamic> json) => AddressList(
        id: json["id"],
        customerId: json["customer_id"],
        contactPersonName: json["contact_person_name"],
        addressType: json["address_type"],
        address: json["address"],
        address1: json["address1"],
        city: json["city"],
        zip: json["zip"],
        phone: json["phone"],
        altPhone: json["alt_phone"] ?? "",
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        state: json["state"],
        country: json["country"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        isBilling: json["is_billing"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "customer_id": customerId,
        "contact_person_name": contactPersonName,
        "address_type": addressType,
        "address": address,
        "address1": address1,
        "city": city,
        "zip": zip,
        "phone": phone,
        "alt_phone": altPhone,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "state": state,
        "country": country,
        "latitude": latitude,
        "longitude": longitude,
        "is_billing": isBilling,
      };
}
