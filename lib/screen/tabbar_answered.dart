import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/QuestionModel.dart';


class tabbar_answered extends StatefulWidget {
  const tabbar_answered({super.key});

  @override
  State<tabbar_answered> createState() => _tabbar_answeredState();
}

class _tabbar_answeredState extends State<tabbar_answered> {
  List<QuestionModel> answeredQuestions = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchAnsweredQuestions();
  }

  Future<void> fetchAnsweredQuestions() async {
    try {
      final query = await FirebaseFirestore.instance
          .collection('questions')
          .where('status', isEqualTo: 'answered')
          .get();

      setState(() {
        answeredQuestions = query.docs
            .map((doc) => QuestionModel.fromDocumentSnapshot(doc))
            .toList();
        isLoading = false;
      });

      print("✅ Loaded ${answeredQuestions.length} answered questions");
    } catch (e) {
      print("❌ Error fetching answered questions: $e");
      setState(() {
        isLoading = false;
      });
    }
  }

  String timeAgo(DateTime date) {
    final Duration diff = DateTime.now().difference(date);
    if (diff.inMinutes < 1) return "just now";
    if (diff.inMinutes < 60) return "${diff.inMinutes} mins ago";
    if (diff.inHours < 24) return "${diff.inHours} hours ago";
    return "${diff.inDays} days ago";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : answeredQuestions.isEmpty
          ? Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset("Assets/images/image1.jpg", width: 190, height: 206),
            SizedBox(height: 35),
            Text(
              "No Data Found",
              style: TextStyle(
                fontSize: 23.04,
                fontWeight: FontWeight.w500,
                fontFamily: 'Raleway',
                color: Color(0xFF292929),
              ),
            ),
            SizedBox(height: 8),
            Text(
              "You have not answered any \n questions yet",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                fontFamily: 'Raleway',
                color: Color(0xFFB4B4B4),
              ),
            ),
          ],
        ),
      )
          : ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        itemCount: answeredQuestions.length,
        itemBuilder: (context, index) {
          final question = answeredQuestions[index];
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Image.asset("Assets/images/profile2.jpg", width: 25, height: 25),
                  SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        question.autherName ?? 'Anonymous',
                        style: TextStyle(
                          fontSize: 11.11,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Raleway',
                          color: Color(0xFF292929),
                        ),
                      ),
                      SizedBox(height: 3),
                      Text(
                        question.createdAt != null
                            ? timeAgo(question.createdAt!.toDate())
                            : "",
                        style: TextStyle(
                          fontSize: 9.26,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Raleway',
                          color: Color(0xFFB4B4B4),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 15.5),
              Text(
                question.title ?? 'No Title',
                style: TextStyle(
                  fontSize: 13.13,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Raleway',
                  color: Color(0xFF292929),
                ),
              ),
              if (question.image != null) ...[
                SizedBox(height: 10),
                Image.asset(
                  question.image!,
                  width: double.infinity,
                  height: 179,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Text("Failed to load image");
                  },
                ),
              ],
              if (question.answer != null) ...[
                SizedBox(height: 10),
                Text(
                  "Answer:",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
                Text(question.answer!),
              ],
              SizedBox(height: 24),

            ],
          );
        },
      ),
    );
  }
}
