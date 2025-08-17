import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Answered extends StatefulWidget {
  final String docId;

  const Answered({super.key, required this.docId});

  @override
  State<Answered> createState() => _AnsweredState();
}

class _AnsweredState extends State<Answered> {
  TextEditingController answer = TextEditingController();

  String? autherName;
  String? autherImage;
  String? questionTitle;
  Timestamp? createdAt;

  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchQuestionDetails();
  }

  Future<void> fetchQuestionDetails() async {
    try {
      final doc = await FirebaseFirestore.instance
          .collection('questions')
          .doc(widget.docId)
          .get();

      if (doc.exists) {
        final data = doc.data()!;
        setState(() {
          autherName = data['autherName'] ?? 'Unknown';
          autherImage = data['autherImage'];
          questionTitle = data['title'] ?? '';
          createdAt = data['createdAt'];
          isLoading = false;
        });
      }
    } catch (e) {
      print('Error fetching question details: $e');
      setState(() {
        isLoading = false;
      });
    }
  }

  String timeAgo(Timestamp timestamp) {
    final date = timestamp.toDate();
    final now = DateTime.now();
    final diff = now.difference(date);

    if (diff.inSeconds < 60) return 'just now';
    if (diff.inMinutes < 60) return '${diff.inMinutes} min ago';
    if (diff.inHours < 24) return '${diff.inHours} hr ago';
    if (diff.inDays < 7) return '${diff.inDays} days ago';
    return DateFormat('dd MMM yyyy').format(date);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back, color: Color(0xFF339D44))),
        title: Text(
          "Answer",
          style: TextStyle(
            fontSize: 23.04,
            fontWeight: FontWeight.bold,
            fontFamily: 'Raleway',
            color: Color(0xFF292929),
          ),
        ),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : Padding(
        padding: const EdgeInsets.all(30.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  autherImage != null && autherImage!.startsWith('http')
                      ? CircleAvatar(
                    backgroundImage: NetworkImage(autherImage!),
                    radius: 12,
                  )
                      : Image.asset(
                    "Assets/images/profile2.jpg",
                    width: 25,
                    height: 25,
                  ),
                  SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        autherName ?? "Unknown",
                        style: TextStyle(
                          fontSize: 11.11,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Raleway',
                          color: Color(0xFF292929),
                        ),
                      ),
                      SizedBox(height: 3),
                      Text(
                        createdAt != null
                            ? timeAgo(createdAt!)
                            : "No time",
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
                questionTitle ?? "",
                style: TextStyle(
                  fontSize: 13.13,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Raleway',
                  color: Color(0xFF292929),
                ),
              ),

              SizedBox(height: 24),


              SizedBox(
                height: 115,
                width: 320,
                child: TextFormField(
                  controller: answer,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  minLines: 5,
                  decoration: InputDecoration(
                    label: Text(
                      "Enter your answer",
                      style: TextStyle(
                        fontSize: 13.33,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Raleway',
                        color: Color(0xFFB4B4B4),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                      BorderSide(color: Color(0xFFD4D4D4)), // inactive
                      borderRadius: BorderRadius.circular(8),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color(0xFF339D44),
                          width: 2), // active
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 390),


              Center(
                child: SizedBox(
                  height: 60,
                  width: 315,
                  child: ElevatedButton(
                    onPressed: () async {
                      if (answer.text.trim().isEmpty) return;

                      await FirebaseFirestore.instance
                          .collection('questions')
                          .doc(widget.docId)
                          .update({
                        'answer': answer.text.trim(),
                        'status': 'answered',
                      });

                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF339D44),
                      foregroundColor: Color(0xFFF4F4F4),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      textStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Raleway',
                      ),
                    ),
                    child: Text("Send"),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
