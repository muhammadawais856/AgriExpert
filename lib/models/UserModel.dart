// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  final String? name;
  final String? email;
  final String? profileImage;
  final String? expertise;
  final String? qualifictaion;
  final String? degreeImage;
  final String? address;
  final String? contact;
  final String? docId;
  final String? createdAt;

  UserModel({
    this.name,
    this.email,
    this.profileImage,
    this.expertise,
    this.qualifictaion,
    this.degreeImage,
    this.address,
    this.contact,
    this.docId,
    this.createdAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    name: json["name"],
    email: json["email"],
    profileImage: json["profileImage"],
    expertise: json["expertise"],
    qualifictaion: json["qualifictaion"],
    degreeImage: json["degreeImage"],
    address: json["address"],
    contact: json["contact"],
    docId: json["docId"],
    createdAt: json["createdAt"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "email": email,
    "profileImage": profileImage,
    "expertise": expertise,
    "qualifictaion": qualifictaion,
    "degreeImage": degreeImage,
    "address": address,
    "contact": contact,
    "docId": docId,
    "createdAt": createdAt,
  };
}
