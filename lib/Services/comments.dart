import 'package:agriexpert/models/comment_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CommentsService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String _collectionName = "comments";

  /// Get all comments from Firestore
  Future<List<CommentsModel>> getAllComments() async {
    try {
      QuerySnapshot snapshot = await _firestore
          .collection(_collectionName)
          .orderBy("date", descending: true) // Optional sorting
          .get();

      return snapshot.docs.map((doc) {
        return CommentsModel.fromJson({
          ...doc.data() as Map<String, dynamic>,
          "docId": doc.id, // Include document ID
        });
      }).toList();
    } catch (e) {
      print("Error fetching comments: $e");
      return [];
    }
  }

  /// Stream comments for real-time updates
  Stream<List<CommentsModel>> getCommentsStream() {
    return _firestore
        .collection(_collectionName)
        .orderBy("date", descending: true)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        return CommentsModel.fromJson({
          ...doc.data() as Map<String, dynamic>,
          "docId": doc.id,
        });
      }).toList();
    });
  }
}
