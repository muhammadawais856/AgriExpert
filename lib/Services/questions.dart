import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/QuestionModel.dart';

class QuestionService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String _collection = 'questions';

  /// Initializes the `questions` collection with a dummy document if empty.
  Future<void> initializeCollection() async {
    try {
      QuerySnapshot snapshot = await _firestore.collection(_collection).limit(1).get();
      if (snapshot.docs.isEmpty) {
        await _firestore.collection(_collection).add({
          'title': 'Welcome question',
          'description': 'This is a sample question to initialize the collection.',
          'status': 'pending',
          'createdAt': FieldValue.serverTimestamp(),
          'autherName': 'System',
          'autherImage': '',
          'image': '',
        });
        print("Dummy document added to initialize the collection.");
      } else {
        print("Collection already exists.");
      }
    } catch (e) {
      print("Error initializing collection: $e");
    }
  }

  /// Fetches all questions.
  Future<List<QuestionModel>> getAllQuestions() async {
    try {
      QuerySnapshot snapshot = await _firestore.collection(_collection).get();
      return snapshot.docs.map((doc) {
        return QuestionModel.fromMap({
          ...doc.data() as Map<String, dynamic>,
          'docId': doc.id,
        });
      }).toList();
    } catch (e) {
      print("Error getting all questions: $e");
      return [];
    }
  }

  /// Fetches only pending questions.
  Future<List<QuestionModel>> getPendingQuestions() async {
    try {
      QuerySnapshot snapshot = await _firestore
          .collection(_collection)
          .where('status', isEqualTo: 'pending')
          .get();

      return snapshot.docs.map((doc) {
        return QuestionModel.fromMap({
          ...doc.data() as Map<String, dynamic>,
          'docId': doc.id,
        });
      }).toList();
    } catch (e) {
      print("Error getting pending questions: $e");
      return [];
    }
  }

  /// Fetches only answered questions.
  Future<List<QuestionModel>> getAnsweredQuestions() async {
    try {
      QuerySnapshot snapshot = await _firestore
          .collection(_collection)
          .where('status', isEqualTo: 'answer')
          .get();

      return snapshot.docs.map((doc) {
        return QuestionModel.fromMap({
          ...doc.data() as Map<String, dynamic>,
          'docId': doc.id,
        });
      }).toList();
    } catch (e) {
      print("Error getting answered questions: $e");
      return [];
    }
  }
}
