// To parse this JSON data, do
//
//     final refundModel = refundModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

RefundModel refundModelFromJson(String str) =>
    RefundModel.fromJson(json.decode(str));

String refundModelToJson(RefundModel data) => json.encode(data.toJson());

class RefundModel {
  bool status;
  String message;
  List<DatumRefund> data;

  RefundModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory RefundModel.fromJson(Map<String, dynamic> json) => RefundModel(
        status: json["status"],
        message: json["message"],
        data: List<DatumRefund>.from(
            json["data"].map((x) => DatumRefund.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class DatumRefund {
  int id;
  int orderDetailsId;
  int customerId;
  String status;
  String amount;
  int productId;
  int orderId;
  String refundReason;
  String images;
  String createdAt;
  String updatedAt;
  String approvedNote;
  String rejectedNote;
  String paymentInfo;
  String changeBy;

  DatumRefund({
    required this.id,
    required this.orderDetailsId,
    required this.customerId,
    required this.status,
    required this.amount,
    required this.productId,
    required this.orderId,
    required this.refundReason,
    required this.images,
    required this.createdAt,
    required this.updatedAt,
    required this.approvedNote,
    required this.rejectedNote,
    required this.paymentInfo,
    required this.changeBy,
  });

  factory DatumRefund.fromJson(Map<String, dynamic> json) => DatumRefund(
        id: json["id"],
        orderDetailsId: json["order_details_id"],
        customerId: json["customer_id"],
        status: json["status"],
        amount: json["amount"],
        productId: json["product_id"],
        orderId: json["order_id"],
        refundReason: json["refund_reason"],
        images: json["images"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        approvedNote: json["approved_note"],
        rejectedNote: json["rejected_note"],
        paymentInfo: json["payment_info"],
        changeBy: json["change_by"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "order_details_id": orderDetailsId,
        "customer_id": customerId,
        "status": status,
        "amount": amount,
        "product_id": productId,
        "order_id": orderId,
        "refund_reason": refundReason,
        "images": images,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "approved_note": approvedNote,
        "rejected_note": rejectedNote,
        "payment_info": paymentInfo,
        "change_by": changeBy,
      };
}
