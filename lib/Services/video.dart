

import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/video_model.dart';

class VideoService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<videomodel>> getAllVideos() async {
    try {
      QuerySnapshot snapshot = await _firestore
          .collection('videos')
          .orderBy('createdAt', descending: true)
          .get();

      return snapshot.docs.map((doc) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        data['docId'] = doc.id;
        return videomodel.fromJson(data);
      }).toList();
    } catch (e) {
      print("Error fetching videos: $e");
      return [];
    }
  }
}
