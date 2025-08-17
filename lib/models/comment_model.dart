
import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

CommentsModel commentsModelFromJson(String str) =>
    CommentsModel.fromJson(json.decode(str));

String commentsModelToJson(CommentsModel data) =>
    json.encode(data.toJson());

class CommentsModel {
  final String? docId;
  final String? title;
  final String? date;
  final String? image;
  final String? comment;

  CommentsModel({
    this.docId,
    this.title,
    this.date,
    this.image,
    this.comment,
  });

  factory CommentsModel.fromJson(Map<String, dynamic> json) {
    String? formattedDate;

    if (json["date"] is Timestamp) {
      // Convert Firestore Timestamp to formatted string
      DateTime dateTime = (json["date"] as Timestamp).toDate();
      formattedDate = DateFormat('dd/MM/yyyy').format(dateTime);
    } else if (json["date"] != null) {
      formattedDate = json["date"].toString();
    }

    return CommentsModel(
      docId: json["docId"],
      title: json["title"],
      date: formattedDate,
      image: json["image"],
      comment: json["comment"],
    );
  }

  Map<String, dynamic> toJson() => {
    "docId": docId,
    "title": title,
    "date": date,
    "image": image,
    "comment": comment,
  };
}
