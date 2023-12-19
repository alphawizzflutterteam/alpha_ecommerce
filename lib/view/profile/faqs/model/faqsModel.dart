// To parse this JSON data, do
//
//     final faqModel = faqModelFromJson(jsonString);

import 'dart:convert';

FaqModel faqModelFromJson(String str) => FaqModel.fromJson(json.decode(str));

String faqModelToJson(FaqModel data) => json.encode(data.toJson());

class FaqModel {
  bool status;
  String message;
  List<DatumFAQ> data;

  FaqModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory FaqModel.fromJson(Map<String, dynamic> json) => FaqModel(
        status: json["status"],
        message: json["message"],
        data:
            List<DatumFAQ>.from(json["data"].map((x) => DatumFAQ.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class DatumFAQ {
  int id;
  String question;
  String answer;
  int ranking;
  int status;
  String createdAt;
  String updatedAt;

  DatumFAQ({
    required this.id,
    required this.question,
    required this.answer,
    required this.ranking,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  factory DatumFAQ.fromJson(Map<String, dynamic> json) => DatumFAQ(
        id: json["id"],
        question: json["question"],
        answer: json["answer"],
        ranking: json["ranking"],
        status: json["status"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "question": question,
        "answer": answer,
        "ranking": ranking,
        "status": status,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}
