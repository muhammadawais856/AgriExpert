import 'package:agriexpert/models/UserModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';


class UserService {
  final CollectionReference usersCollection = FirebaseFirestore.instance.collection('users');

  Future<void> createUser(UserModel model) async {
    await usersCollection.doc(model.docId).set(model.toJson());
  }

  Future<UserModel?> getUserById(String uid) async {
    DocumentSnapshot doc = await usersCollection.doc(uid).get();
    if (doc.exists) {
      return UserModel.fromJson(doc.data() as Map<String, dynamic>);
    }
    return null;
  }

  Future<UserModel?> getCurrentUser(String userId) async {
    try {
      print("📡 Getting user with ID: $userId");
      DocumentSnapshot snapshot = await usersCollection.doc(userId).get();

      if (snapshot.exists) {
        print("✅ User document found: ${snapshot.data()}");
        return UserModel.fromJson({
          ...snapshot.data() as Map<String, dynamic>,
          'docId': snapshot.id,
        });
      } else {
        print("❌ User not found in Firestore.");
        return null;
      }
    } catch (e) {
      print("🔥 Error fetching user: $e");
      return null;
    }
  }





}
