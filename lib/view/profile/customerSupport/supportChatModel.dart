class SupportChatModel {
  SupportChatModel({
    required this.status,
    required this.message,
    required this.data,
  });

  final bool? status;
  final String? message;
  final List<ChatData> data;

  factory SupportChatModel.fromJson(Map<String, dynamic> json) {
    return SupportChatModel(
      status: json["status"],
      message: json["message"],
      data: json["data"] == null
          ? []
          : List<ChatData>.from(json["data"]!.map((x) => ChatData.fromJson(x))),
    );
  }
}

class ChatData {
  ChatData({
    required this.id,
    required this.supportTicketId,
    required this.adminId,
    required this.customerMessage,
    required this.adminMessage,
    required this.vendorMessage,
    required this.position,
    required this.createdAt,
    required this.updatedAt,
  });

  final int? id;
  final int? supportTicketId;
  final int? adminId;
  final String? customerMessage;
  final String? adminMessage;
  final String? vendorMessage;
  final int? position;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory ChatData.fromJson(Map<String, dynamic> json) {
    return ChatData(
      id: json["id"],
      supportTicketId: json["support_ticket_id"],
      adminId: json["admin_id"],
      customerMessage: json["customer_message"],
      adminMessage: json["admin_message"],
      vendorMessage: json["vendor_message"],
      position: json["position"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
    );
  }
}
