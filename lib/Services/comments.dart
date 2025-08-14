// import 'package:cloud_firestore/cloud_firestore.dart';
//
// class CommentsService {
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//   final String _collection = "comments";
//
//   // Get all comments
//   Future<List<CommentsModel>> getComments() async {
//     try {
//       QuerySnapshot<Map<String, dynamic>> snapshot =
//       await _firestore.collection(_collection).get();
//
//       return snapshot.docs.map((doc) {
//         final data = doc.data() ?? {}; // Ensure it's not null
//         return CommentsModel.fromJson({
//           "docId": doc.id,
//           ...data,
//         });
//       }).toList();
//     } catch (e) {
//       print("Error getting comments: $e");
//       return [];
//     }
//   }
// }
