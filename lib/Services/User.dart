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
  Future<void> updateUser(String uid, Map<String, dynamic> updatedData) async {
    await usersCollection.doc(uid).update(updatedData);
  }







}
