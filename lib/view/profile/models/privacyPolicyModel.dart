class PrivacyPolicyModel {
  PrivacyPolicyModel({
    required this.status,
    required this.message,
    required this.data,
  });

  final bool? status;
  final String? message;
  final Data? data;

  factory PrivacyPolicyModel.fromJson(Map<String, dynamic> json) {
    return PrivacyPolicyModel(
      status: json["status"],
      message: json["message"],
      data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data?.toJson(),
      };
}

class Data {
  Data({
    required this.aboutUs,
    required this.privacyPolicy,
    required this.faq,
    required this.termsConditions,
    required this.refundPolicy,
    required this.returnPolicy,
    required this.cancellationPolicy,
    required this.shippingDeliveryPolicy,
    required this.securityPolicyPolicy,
    required this.paymentPolicy,
    required this.conditionOfUsePolicy,
    required this.securityInformation,
  });

  final String? aboutUs;
  final String? privacyPolicy;
  final List<Faq> faq;
  final String? termsConditions;
  final CancellationPolicy? refundPolicy;
  final CancellationPolicy? returnPolicy;
  final CancellationPolicy? cancellationPolicy;
  final CancellationPolicy? shippingDeliveryPolicy;
  final CancellationPolicy? securityPolicyPolicy;
  final CancellationPolicy? paymentPolicy;
  final CancellationPolicy? conditionOfUsePolicy;
  final CancellationPolicy? securityInformation;

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      aboutUs: json["about_us"],
      privacyPolicy: json["privacy_policy"],
      faq: json["faq"] == null
          ? []
          : List<Faq>.from(json["faq"]!.map((x) => Faq.fromJson(x))),
      termsConditions: json["terms_&_conditions"],
      refundPolicy: json["refund_policy"] == null
          ? null
          : CancellationPolicy.fromJson(json["refund_policy"]),
      returnPolicy: json["return_policy"] == null
          ? null
          : CancellationPolicy.fromJson(json["return_policy"]),
      cancellationPolicy: json["cancellation_policy"] == null
          ? null
          : CancellationPolicy.fromJson(json["cancellation_policy"]),
      shippingDeliveryPolicy: json["shipping_delivery_policy"] == null
          ? null
          : CancellationPolicy.fromJson(json["shipping_delivery_policy"]),
      securityPolicyPolicy: json["security_policy_policy"] == null
          ? null
          : CancellationPolicy.fromJson(json["security_policy_policy"]),
      paymentPolicy: json["payment_policy"] == null
          ? null
          : CancellationPolicy.fromJson(json["payment_policy"]),
      conditionOfUsePolicy: json["condition_of_use_policy"] == null
          ? null
          : CancellationPolicy.fromJson(json["condition_of_use_policy"]),
      securityInformation: json["security_information"] == null
          ? null
          : CancellationPolicy.fromJson(json["security_information"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "about_us": aboutUs,
        "privacy_policy": privacyPolicy,
        "faq": faq.map((x) => x?.toJson()).toList(),
        "terms_&_conditions": termsConditions,
        "refund_policy": refundPolicy?.toJson(),
        "return_policy": returnPolicy?.toJson(),
        "cancellation_policy": cancellationPolicy?.toJson(),
        "shipping_delivery_policy": shippingDeliveryPolicy?.toJson(),
        "security_policy_policy": securityPolicyPolicy?.toJson(),
        "payment_policy": paymentPolicy?.toJson(),
        "condition_of_use_policy": conditionOfUsePolicy?.toJson(),
        "security_information": securityInformation?.toJson(),
      };
}

class CancellationPolicy {
  CancellationPolicy({
    required this.status,
    required this.content,
  });

  final int? status;
  final String? content;

  factory CancellationPolicy.fromJson(Map<String, dynamic> json) {
    return CancellationPolicy(
      status: json["status"],
      content: json["content"],
    );
  }

  Map<String, dynamic> toJson() => {
        "status": status,
        "content": content,
      };
}

class Faq {
  Faq({
    required this.id,
    required this.question,
    required this.answer,
    required this.ranking,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  final int? id;
  final String? question;
  final String? answer;
  final int? ranking;
  final int? status;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory Faq.fromJson(Map<String, dynamic> json) {
    return Faq(
      id: json["id"],
      question: json["question"],
      answer: json["answer"],
      ranking: json["ranking"],
      status: json["status"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "question": question,
        "answer": answer,
        "ranking": ranking,
        "status": status,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
