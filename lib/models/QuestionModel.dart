import 'package:cloud_firestore/cloud_firestore.dart';

class QuestionModel {
  final String? docId;
  final String? autherName;
  final String? autherImage;
  final String? title;
  final String? image;
  final String? answer; // ✅ ADD THIS LINE
  final String status;
  final Timestamp? createdAt;

  QuestionModel({
    this.docId,
    this.autherName,
    this.autherImage,
    this.title,
    this.image,
    this.answer, // ✅ ADD THIS LINE
    this.createdAt,
    required this.status,
  });

  factory QuestionModel.fromMap(Map<String, dynamic> map) {
    return QuestionModel(
      docId: map['docId'],
      autherName: map['autherName'],
      autherImage: map['autherImage'],
      title: map['title'],
      image: map['image'],
      answer: map['answer'], // ✅ ADD THIS LINE
      status: map['status'] ?? 'pending',
      createdAt: map['createdAt'],
    );
  }

  factory QuestionModel.fromDocumentSnapshot(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return QuestionModel(
      docId: doc.id,
      autherName: data['autherName'],
      autherImage: data['autherImage'],
      title: data['title'],
      image: data['image'],
      answer: data['answer'], // ✅ ADD THIS LINE
      status: data['status'] ?? 'pending',
      createdAt: data['createdAt'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'docId': docId,
      'autherName': autherName,
      'autherImage': autherImage,
      'title': title,
      'image': image,
      'answer': answer, // ✅ ADD THIS LINE
      'status': status,
      'createdAt': createdAt,
    };
  }
}
