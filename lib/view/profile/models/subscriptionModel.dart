class SubscriptionModel {
  SubscriptionModel({
    required this.status,
    required this.message,
    required this.data,
  });

  final bool? status;
  final String? message;
  final List<SubscriptionData> data;

  factory SubscriptionModel.fromJson(Map<String, dynamic> json) {
    return SubscriptionModel(
      status: json["status"],
      message: json["message"],
      data: json["data"] == null
          ? []
          : List<SubscriptionData>.from(
              json["data"]!.map((x) => SubscriptionData.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data.map((x) => x?.toJson()).toList(),
      };
}

class SubscriptionData {
  SubscriptionData({
    required this.monthly,
    required this.yearly,
  });

  final List<Monthly> monthly;
  final List<Monthly> yearly;

  factory SubscriptionData.fromJson(Map<String, dynamic> json) {
    return SubscriptionData(
      monthly: json["monthly"] == null
          ? []
          : List<Monthly>.from(
              json["monthly"]!.map((x) => Monthly.fromJson(x))),
      yearly: json["yearly"] == null
          ? []
          : List<Monthly>.from(json["yearly"]!.map((x) => Monthly.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "monthly": monthly.map((x) => x?.toJson()).toList(),
        "yearly": yearly.map((x) => x?.toJson()).toList(),
      };
}

class Monthly {
  Monthly({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.type,
    required this.time,
    required this.userType,
    required this.image,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.timeText,
    required this.isPurchased,
    required this.priceWithCurrency,
    required this.translations,
  });

  final int? id;
  final String? title;
  final String? description;
  final int? price;
  final int? type;
  final int? time;
  final int? userType;
  final String? image;
  final int? status;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? timeText;
  final bool isPurchased;
  final String? priceWithCurrency;
  final List<dynamic> translations;

  factory Monthly.fromJson(Map<String, dynamic> json) {
    return Monthly(
      id: json["id"],
      title: json["title"],
      description: json["description"],
      price: json["price"],
      type: json["type"],
      time: json["time"],
      userType: json["user_type"],
      image: json["image"],
      status: json["status"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
      timeText: json["time_text"],
      isPurchased: json["is_purchased"],
      priceWithCurrency: json["price_with_currency"],
      translations: json["translations"] == null
          ? []
          : List<dynamic>.from(json["translations"]!.map((x) => x)),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "price": price,
        "type": type,
        "time": time,
        "user_type": userType,
        "image": image,
        "status": status,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "time_text": timeText,
        "is_purchased": isPurchased,
        "price_with_currency": priceWithCurrency,
        "translations": translations.map((x) => x).toList(),
      };
}
