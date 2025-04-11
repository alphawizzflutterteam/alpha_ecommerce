class ReferralModel {
  ReferralModel({
    required this.status,
    required this.message,
    required this.data,
  });

  final bool? status;
  final String? message;
  final List<ReferralData> data;

  factory ReferralModel.fromJson(Map<String, dynamic> json) {
    return ReferralModel(
      status: json["status"],
      message: json["message"],
      data: json["data"] == null
          ? []
          : List<ReferralData>.from(
              json["data"]!.map((x) => ReferralData.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data.map((x) => x?.toJson()).toList(),
      };
}

class ReferralData {
  ReferralData({
    required this.id,
    required this.userId,
    required this.transactionId,
    required this.credit,
    required this.debit,
    required this.balance,
    required this.reference,
    required this.transactionType,
    required this.createdAt,
    required this.updatedAt,
    required this.description,
  });

  final int? id;
  final int? userId;
  final String? transactionId;
  final int? credit;
  final int? debit;
  final int? balance;
  final String? reference;
  final String? transactionType;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? description;

  factory ReferralData.fromJson(Map<String, dynamic> json) {
    return ReferralData(
      id: json["id"],
      userId: json["user_id"],
      transactionId: json["transaction_id"],
      credit: json["credit"],
      debit: json["debit"],
      balance: json["balance"],
      reference: json["reference"],
      transactionType: json["transaction_type"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
      description: json["description"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "transaction_id": transactionId,
        "credit": credit,
        "debit": debit,
        "balance": balance,
        "reference": reference,
        "transaction_type": transactionType,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "description": description,
      };
}
