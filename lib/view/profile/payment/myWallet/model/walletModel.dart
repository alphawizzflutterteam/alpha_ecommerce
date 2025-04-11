// To parse this JSON data, do
//
//     final walletHistory = walletHistoryFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

WalletHistory walletHistoryFromJson(String str) =>
    WalletHistory.fromJson(json.decode(str));

String walletHistoryToJson(WalletHistory data) => json.encode(data.toJson());

class WalletHistory {
  int limit;
  int offset;
  String totalWalletBalance;
  int totalWalletTransactio;
  List<WalletTransactioList> walletTransactioList;

  WalletHistory({
    required this.limit,
    required this.offset,
    required this.totalWalletBalance,
    required this.totalWalletTransactio,
    required this.walletTransactioList,
  });

  factory WalletHistory.fromJson(Map<String, dynamic> json) => WalletHistory(
        limit: json["limit"],
        offset: json["offset"],
        totalWalletBalance: json["total_wallet_balance"],
        totalWalletTransactio: json["total_wallet_transactio"],
        walletTransactioList: List<WalletTransactioList>.from(
            json["wallet_transactio_list"]
                .map((x) => WalletTransactioList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "limit": limit,
        "offset": offset,
        "total_wallet_balance": totalWalletBalance,
        "total_wallet_transactio": totalWalletTransactio,
        "wallet_transactio_list":
            List<dynamic>.from(walletTransactioList.map((x) => x.toJson())),
      };
}

class WalletTransactioList {
  int id;
  int userId;
  String transactionId;
  String credit;
  String debit;
  String adminBonus;
  String balance;
  String transactionType;
  String reference;
  String createdAt;
  String updatedAt;

  WalletTransactioList({
    required this.id,
    required this.userId,
    required this.transactionId,
    required this.credit,
    required this.debit,
    required this.adminBonus,
    required this.balance,
    required this.transactionType,
    required this.reference,
    required this.createdAt,
    required this.updatedAt,
  });

  factory WalletTransactioList.fromJson(Map<String, dynamic> json) =>
      WalletTransactioList(
        id: json["id"],
        userId: json["user_id"],
        transactionId: json["transaction_id"],
        credit: json["credit"],
        debit: json["debit"],
        adminBonus: json["admin_bonus"],
        balance: json["balance"],
        transactionType: json["transaction_type"],
        reference: json["reference"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "transaction_id": transactionId,
        "credit": credit,
        "debit": debit,
        "admin_bonus": adminBonus,
        "balance": balance,
        "transaction_type": transactionType,
        "reference": reference,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}
