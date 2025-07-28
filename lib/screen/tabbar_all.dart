
import 'package:agriexpert/Services/questions.dart';
import 'package:agriexpert/models/QuestionModel.dart';
import 'package:agriexpert/models/all_model.dart';
import 'package:agriexpert/screen/answered.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class tabbar_all extends StatefulWidget {
  const tabbar_all({super.key});

  @override
  State<tabbar_all> createState() => _tabbar_allState();
}

class _tabbar_allState extends State<tabbar_all> {
  @override
  List<AllModel> model = [];
  final QuestionService _questionService = QuestionService();
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchQuestions();
  }
  void fetchQuestions() async {
    List<QuestionModel> questions = await _questionService.getAllQuestions();
    print("Fetched questions: ${questions.length}");

    setState(() {
      model = questions.map((q) => AllModel(
        docId: q.docId!,
        profileImage: q.autherImage ?? 'Assets/images/profile1.jpg',
        name: q.autherName ?? 'Anonymous',
        time: q.createdAt != null ? timeAgo((q.createdAt as Timestamp).toDate()) : 'Some time ago',
        title: q.title ?? 'No title',
        contentImage: q.image,
        answerRoute: Answered(docId: q.docId!), // always assign route
        status: q.status ?? "pending", // <-- Assign status

      )).toList();
      isLoading=false;
    });

  }
  String timeAgo(DateTime date) {
    final Duration diff = DateTime.now().difference(date);
    if (diff.inMinutes < 1) return "just now";
    if (diff.inMinutes < 60) return "${diff.inMinutes} mins ago";
    if (diff.inHours < 24) return "${diff.inHours} hours ago";
    return "${diff.inDays} days ago";
  }



  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: isLoading
          ? Center(child: CircularProgressIndicator()):
      Column(
        children: [
          SizedBox(height: 30,),
          Expanded(
            child: ListView.builder(
              itemCount: model.length,
                itemBuilder: (context, i){
              return SingleChildScrollView(
                child: Column(

                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //SizedBox(height: 30,),
                    Padding(
                      padding: const EdgeInsets.only(left: 30, right: 30),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(model[i].profileImage,width: 25,height: 25,),
                          SizedBox(width: 8,),


                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(model[i].name,style: TextStyle(fontSize: 11.11,fontWeight:
                                FontWeight.bold,fontFamily: 'Raleway',color: Color(0xFF292929),),),
                                SizedBox(height: 3,),
                                Text(model[i].time,style: TextStyle(fontSize: 9.26,fontWeight:
                                FontWeight.w500,fontFamily: 'Raleway',color: Color(0xFFB4B4B4),),),
                              ],
                            ),
                          ),

                          model[i].status == "pending"
                              ? TextButton(
                            onPressed: () async {
                              await Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Answered(docId: model[i].docId!)),
                              );
                              fetchQuestions(); // 👈 Refresh after coming back
                            },
                            child: Text(
                              "Answered",
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Raleway',
                                color: Color(0xFF339D44),
                              ),
                            ),
                          )
                              : SizedBox.shrink(),





                        ],
                      ),
                    ),
                    SizedBox(height: 15.5,),

                    Padding(
                      padding: const EdgeInsets.only(left: 30, right: 30),
                      child: Text(model[i].title,style: TextStyle(fontSize: 13.13,fontWeight:
                      FontWeight.bold,fontFamily: 'Raleway',color: Color(0xFF292929),),),
                    ),

                    SizedBox(height: 5,),

                    if (model[i].contentImage != null)
                      Image.asset(
                        model[i].contentImage!,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        height: 179,
                        errorBuilder: (context, error, stackTrace) {
                          return Text("Failed to load image");
                        },
                      ),



                    SizedBox(height: 24,),
                  ],
                ),
              );
            }),
          ),
        ],
      )
    );
  }
}
