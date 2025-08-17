import 'package:agriexpert/models/comment_model.dart';
import 'package:flutter/material.dart';

import '../Services/comments.dart';
import '../models/all_model.dart';

class comment_recent extends StatefulWidget {
  const comment_recent({super.key});

  @override
  State<comment_recent> createState() => _comment_recentState();
}

class _comment_recentState extends State<comment_recent> {
  @override

  List<AllComments> model = [
    AllComments(
      image: 'Assets/images/user1.jpg',
      title: 'Masab Mehmood',
      date: '11/10/2021',
      comment: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pulvinar ante id netus sit congue justo. Felis, volutpat sit senectus tempor, aliquam. Tellus proin enim orci in ullamcorper egestas dolor. Dictumst sed.',
    ),
    AllComments(
      image: 'Assets/images/user2.jpg',
      title: 'Gusti Ilham Tauhid',
      date: '11/10/2021',
      comment: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pulvinar ante id netus sit congue justo. Felis, volutpat sit senectus tempor, aliquam. Tellus proin enim orci in ullamcorper egestas dolor. Dictumst sed.',
    ),
    AllComments(
      image: 'Assets/images/user3.jpg',
      title: 'Adhitia Panji K.W',
      date: '11/10/2021',
      comment: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pulvinar ante id netus sit congue justo. Felis, volutpat sit senectus tempor, aliquam. Tellus proin enim orci in ullamcorper egestas dolor. Dictumst sed.',
    ),
    AllComments(
      image: 'Assets/images/user4.jpg',
      title: 'Dazzy',
      date: '11/10/2021',
      comment: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pulvinar ante id netus sit congue justo. Felis, volutpat sit senectus tempor, aliquam. Tellus proin enim orci in ullamcorper egestas dolor. Dictumst sed.',
    ),
    AllComments(
      image: 'Assets/images/user5.jpg',
      title: 'Althaf Ukail',
      date: '11/10/2021',
      comment: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pulvinar ante id netus sit congue justo. Felis, volutpat sit senectus tempor, aliquam. Tellus proin enim orci in ullamcorper egestas dolor. Dictumst sed.',
    ),
  ];
  final CommentsService _commentsService = CommentsService();
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.white,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 30,left: 30,top: 15),
            child: Row(
              children: [
                Text("Video ", style: TextStyle(fontSize: 13.13,fontWeight:
                FontWeight.bold,fontFamily: 'Raleway',color: Color(0xFF292929),),),
                Text(": How to Start A Tractor", style: TextStyle(fontSize: 13.13,fontWeight:
                FontWeight.bold,fontFamily: 'Raleway',color: Color(0xFF292929),),),
              ],
            ),
          ),

          Expanded(
            child: FutureBuilder<List<CommentsModel>>(
              future: _commentsService.getAllComments(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                }

                final comments = snapshot.data!;

                if (comments.isEmpty) {
                  return Center(child: Text("No comments found"));
                }

                return ListView.builder(
                  itemCount: comments.length,
                  itemBuilder: (context, i) {
                    return Padding(
                      padding:
                      const EdgeInsets.only(right: 30, left: 30, top: 15),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            comments[i].image ?? 'assets/images/default_user.png',
                            width: 25,
                            height: 25,
                            errorBuilder: (context, error, stackTrace) =>
                                Icon(Icons.person, size: 25),
                          ),

                          SizedBox(width: 6),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  comments[i].title ?? '',
                                  style: TextStyle(
                                    fontSize: 11.11,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Raleway',
                                    color: Color(0xFF292929),
                                  ),
                                ),
                                Text(
                                  comments[i].date ?? '',
                                  style: TextStyle(
                                    fontSize: 11.11,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Raleway',
                                    color: Color(0xFFB4B4B4),
                                  ),
                                ),
                                SizedBox(height: 10,),
                                Text(
                                  comments[i].comment ?? '',
                                  style: TextStyle(
                                    fontSize: 11.11,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Raleway',
                                    color: Color(0xFF292929),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          )

        ],
      ),

    );
  }
}
