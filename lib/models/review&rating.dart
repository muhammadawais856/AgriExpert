import 'package:cloud_firestore/cloud_firestore.dart';

class RatingReviewModels {
  final String id;
  final String image;
  final String name;
  final Timestamp time;
  final String comment;
  final int starCount;

  RatingReviewModels({
    required this.id,
    required this.image,
    required this.name,
    required this.time,
    required this.comment,
    required this.starCount,
  });


  factory RatingReviewModels.fromJson(Map<String, dynamic> json, String docId) {
    return RatingReviewModels(
      id: docId,
      image: json['image'] ?? "Assets/images/profile4.jpg",
      name: json['name'] ?? "",
      time: json['time'] is Timestamp ? json['time'] : Timestamp.now(),
      comment: json['comment'] ?? "",
      starCount: json['starCount'] is int
          ? json['starCount']
          : int.tryParse(json['starCount']?.toString() ?? "0") ?? 0,
    );
  }



  Map<String, dynamic> toJson() {
    return {
      "image": image,
      "name": name,
      "time": time,
      "comment": comment,
      "starCount": starCount,
    };
  }
}
