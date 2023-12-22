// To parse this JSON data, do
//
//     final transactionHistoryModel = transactionHistoryModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

TransactionHistoryModel transactionHistoryModelFromJson(String str) =>
    TransactionHistoryModel.fromJson(json.decode(str));

String transactionHistoryModelToJson(TransactionHistoryModel data) =>
    json.encode(data.toJson());

class TransactionHistoryModel {
  bool status;
  String message;
  List<DatumTrasaction> data;

  TransactionHistoryModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory TransactionHistoryModel.fromJson(Map<String, dynamic> json) =>
      TransactionHistoryModel(
        status: json["status"],
        message: json["message"],
        data: List<DatumTrasaction>.from(
            json["data"].map((x) => DatumTrasaction.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class DatumTrasaction {
  int sellerId;
  int orderId;
  String orderAmount;
  String sellerAmount;
  String adminCommission;
  String receivedBy;
  String status;
  String deliveryCharge;
  String tax;
  String createdAt;
  String updatedAt;
  int customerId;
  String sellerIs;
  String deliveredBy;
  String paymentMethod;
  String transactionId;
  int id;

  DatumTrasaction({
    required this.sellerId,
    required this.orderId,
    required this.orderAmount,
    required this.sellerAmount,
    required this.adminCommission,
    required this.receivedBy,
    required this.status,
    required this.deliveryCharge,
    required this.tax,
    required this.createdAt,
    required this.updatedAt,
    required this.customerId,
    required this.sellerIs,
    required this.deliveredBy,
    required this.paymentMethod,
    required this.transactionId,
    required this.id,
  });

  factory DatumTrasaction.fromJson(Map<String, dynamic> json) =>
      DatumTrasaction(
        sellerId: json["seller_id"],
        orderId: json["order_id"],
        orderAmount: json["order_amount"],
        sellerAmount: json["seller_amount"],
        adminCommission: json["admin_commission"],
        receivedBy: json["received_by"],
        status: json["status"],
        deliveryCharge: json["delivery_charge"],
        tax: json["tax"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        customerId: json["customer_id"],
        sellerIs: json["seller_is"],
        deliveredBy: json["delivered_by"],
        paymentMethod: json["payment_method"],
        transactionId: json["transaction_id"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "seller_id": sellerId,
        "order_id": orderId,
        "order_amount": orderAmount,
        "seller_amount": sellerAmount,
        "admin_commission": adminCommission,
        "received_by": receivedBy,
        "status": status,
        "delivery_charge": deliveryCharge,
        "tax": tax,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "customer_id": customerId,
        "seller_is": sellerIs,
        "delivered_by": deliveredBy,
        "payment_method": paymentMethod,
        "transaction_id": transactionId,
        "id": id,
      };
}
