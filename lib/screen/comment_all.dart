import 'package:flutter/material.dart';

import '../models/all_model.dart';

class comment_all extends StatefulWidget {
  const comment_all({super.key});

  @override
  State<comment_all> createState() => _comment_allState();
}

class _comment_allState extends State<comment_all> {
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
            child: ListView.builder(
              itemCount: model.length,
                itemBuilder: (context,i){
              return Padding(
                padding: const EdgeInsets.only(right: 30, left: 30, top: 15),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(model[i].image,width: 25,height: 25,),
                    SizedBox(width: 6,),

                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(model[i].title,style: TextStyle(fontSize: 11.11,fontWeight:
                          FontWeight.bold,fontFamily: 'Raleway',color: Color(0xFF292929),),),
                          Text(model[i].date,style: TextStyle(fontSize: 11.11,fontWeight:
                          FontWeight.w400,fontFamily: 'Raleway',color: Color(0xFFB4B4B4),),),
                          Text(model[i].comment,style: TextStyle(fontSize: 11.11,fontWeight:
                          FontWeight.w400,fontFamily: 'Raleway',color: Color(0xFF292929),),),

                        ],
                      ),
                    )
                  ]


                ),
              );
            }),
          )

        ],
      ),

    );
  }
}
