// To parse this JSON data, do
//
//     final chatModel = chatModelFromJson(jsonString);

import 'dart:convert';

ChatModel chatModelFromJson(String str) => ChatModel.fromJson(json.decode(str));

String chatModelToJson(ChatModel data) => json.encode(data.toJson());

class ChatModel {
  int totalSize;
  String limit;
  String offset;
  List<MessageChat> message;

  ChatModel({
    required this.totalSize,
    required this.limit,
    required this.offset,
    required this.message,
  });

  factory ChatModel.fromJson(Map<String, dynamic> json) => ChatModel(
        totalSize: json["total_size"],
        limit: json["limit"],
        offset: json["offset"],
        message: List<MessageChat>.from(
            json["message"].map((x) => MessageChat.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "total_size": totalSize,
        "limit": limit,
        "offset": offset,
        "message": List<dynamic>.from(message.map((x) => x.toJson())),
      };
}

class MessageChat {
  int adminId;
  int userId;
  String message;
  int sentByCustomer;
  int sentByAdmin;
  String createdAt;

  MessageChat({
    required this.adminId,
    required this.userId,
    required this.message,
    required this.sentByCustomer,
    required this.sentByAdmin,
    required this.createdAt,
  });

  factory MessageChat.fromJson(Map<String, dynamic> json) => MessageChat(
        adminId: json["admin_id"],
        userId: json["user_id"],
        message: json["message"],
        sentByCustomer: json["sent_by_customer"],
        sentByAdmin: json["sent_by_admin"],
        createdAt: json["created_at"],
      );

  Map<String, dynamic> toJson() => {
        "admin_id": adminId,
        "user_id": userId,
        "message": message,
        "sent_by_customer": sentByCustomer,
        "sent_by_admin": sentByAdmin,
        "created_at": createdAt,
      };
}
