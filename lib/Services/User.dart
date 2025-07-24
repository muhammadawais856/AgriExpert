import 'package:agriexpert/models/UserModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class UserService {
  final CollectionReference usersCollection =
  FirebaseFirestore.instance.collection('users');

  Future createUser(UserModel model) async {
    DocumentReference documentReference =
    FirebaseFirestore.instance.collection('users').doc();

    return await FirebaseFirestore.instance
        .collection('users')
        .doc(documentReference.id)
        .set(model.toJson()..['docId'] = documentReference.id);
  }

}
