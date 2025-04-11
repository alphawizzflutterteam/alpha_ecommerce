// To parse this JSON data, do
//
//     final returnOrderModel = returnOrderModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

ReturnOrderModel returnOrderModelFromJson(String str) =>
    ReturnOrderModel.fromJson(json.decode(str));

String returnOrderModelToJson(ReturnOrderModel data) =>
    json.encode(data.toJson());

class ReturnOrderModel {
  bool status;
  String message;
  Data data;

  ReturnOrderModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory ReturnOrderModel.fromJson(Map<String, dynamic> json) =>
      ReturnOrderModel(
        status: json["status"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data.toJson(),
      };
}

class Data {
  String productPrice;
  int quntity;
  String productTotalDiscount;
  String productTotalTax;
  String subtotal;
  String couponDiscount;
  String refundAmount;
  List<RefundRequest> refundRequest;

  Data({
    required this.productPrice,
    required this.quntity,
    required this.productTotalDiscount,
    required this.productTotalTax,
    required this.subtotal,
    required this.couponDiscount,
    required this.refundAmount,
    required this.refundRequest,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        productPrice: json["product_price"],
        quntity: json["quntity"],
        productTotalDiscount: json["product_total_discount"],
        productTotalTax: json["product_total_tax"],
        subtotal: json["subtotal"],
        couponDiscount: json["coupon_discount"],
        refundAmount: json["refund_amount"],
        refundRequest: List<RefundRequest>.from(
            json["refund_request"].map((x) => RefundRequest.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "product_price": productPrice,
        "quntity": quntity,
        "product_total_discount": productTotalDiscount,
        "product_total_tax": productTotalTax,
        "subtotal": subtotal,
        "coupon_discount": couponDiscount,
        "refund_amount": refundAmount,
        "refund_request":
            List<dynamic>.from(refundRequest.map((x) => x.toJson())),
      };
}

class RefundRequest {
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

  RefundRequest({
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

  factory RefundRequest.fromJson(Map<String, dynamic> json) => RefundRequest(
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
