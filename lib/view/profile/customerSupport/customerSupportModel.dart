class CustomerSupportModel {
  CustomerSupportModel({
    required this.status,
    required this.message,
    required this.data,
  });

  final bool? status;
  final String? message;
  final List<SupportData> data;

  factory CustomerSupportModel.fromJson(Map<String, dynamic> json) {
    return CustomerSupportModel(
      status: json["status"],
      message: json["message"],
      data: json["data"] == null
          ? []
          : List<SupportData>.from(
              json["data"]!.map((x) => SupportData.fromJson(x))),
    );
  }
}

class SupportData {
  SupportData({
    required this.id,
    required this.customerId,
    required this.isVendor,
    required this.vendorId,
    required this.orderId,
    required this.subject,
    required this.type,
    required this.priority,
    required this.description,
    required this.reply,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.customerName,
    required this.customerEmail,
    required this.customerImage,
  });

  final int? id;
  final int? customerId;
  final String? isVendor;
  final String? vendorId;
  final String? orderId;
  final String? subject;
  final String? type;
  final String? priority;
  final String? description;
  final String? reply;
  final String? status;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? customerName;
  final String? customerEmail;
  final String? customerImage;

  factory SupportData.fromJson(Map<String, dynamic> json) {
    return SupportData(
      id: json["id"],
      customerId: json["customer_id"],
      isVendor: json["is_vendor"],
      vendorId: json["vendor_id"],
      orderId: json["order_id"],
      subject: json["subject"],
      type: json["type"],
      priority: json["priority"],
      description: json["description"],
      reply: json["reply"],
      status: json["status"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
      customerName: json["customer_name"],
      customerEmail: json["customer_email"],
      customerImage: json["customer_image"],
    );
  }
}
