// To parse this JSON data, do
//
//     final questionModel = questionModelFromJson(jsonString);

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

videomodel questionModelFromJson(String str) => videomodel.fromJson(json.decode(str));

String questionModelToJson(videomodel data) => json.encode(data.toJson());

class videomodel {
  final String? docId;
  final String? video;
  final String? image;
  final String? title;
  final String? description;
  final String? userId;
  final String? username;
  final String? userImage;
  final Timestamp? createdAt;

  videomodel({
    this.docId,
    this.video,
    this.image,
    this.title,
    this.description,
    this.userId,
    this.username,
    this.userImage,
    this.createdAt,
  });

  factory videomodel.fromJson(Map<String, dynamic> json) => videomodel(
    docId: json["docId"],
    video: json["video"],
    image: json["image"],
    title: json["title"],
    description: json["description"],
    userId: json["userId"],
    username: json["username"],
    userImage: json["userimage"],
    createdAt: json["createdAt"],
  );

  Map<String, dynamic> toJson() => {
    "docId": docId,
    "video": video,
    "images": image,
    "title": title,
    "description": description,
    "userId": userId,
    "username": username,
    "userImage": userImage,
    "createdAt": createdAt,
  };
}
