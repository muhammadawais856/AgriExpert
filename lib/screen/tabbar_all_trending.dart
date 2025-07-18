import 'package:agriexpert/models/all_model.dart';
import 'package:agriexpert/screen/Comment1.dart';
import 'package:flutter/material.dart';

class tabbar_all_trending extends StatefulWidget {
  const tabbar_all_trending({super.key});

  @override
  State<tabbar_all_trending> createState() => _tabbar_all_trendingState();
}

class _tabbar_all_trendingState extends State<tabbar_all_trending> {
  @override
  List<TrainingVideoAllModel> model = [
    TrainingVideoAllModel(
      title: "How to Start A Tractor",
      subtitle: "Upload Date",
      uploadTime: "15 mins ago",
      menuOptions: ['Edit', 'Delete', 'Share'],
      Image: "Assets/images/tractor2.jpg",
      viewImage: "Assets/images/viewimage.jpg",
      views: "139 Views",
      commentImage: "Assets/images/commentimage.jpg",
      comments: "22 Comments",
      commentPageRoute: comment1(),
    ),
    TrainingVideoAllModel(
      title: "How to Buy a Crane",
      subtitle: "Upload Date",
      uploadTime: "21 Oct, 2021 Monday",
      menuOptions: ['Edit', 'Delete', 'Share'],
      Image: "Assets/images/crane.jpg",
      viewImage: "Assets/images/viewimage.jpg",
      views: "72 Views",
      commentImage: "Assets/images/commentimage.jpg",
      comments: "14 Comments",

    ),
  ];

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [

          Expanded(
            child: ListView.builder(
              itemCount: model.length,
                itemBuilder: (context,i){
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 30, left: 30, top: 25),
                        child: Text(model[i].title,style: TextStyle(fontSize: 13.33,fontWeight:
                        FontWeight.w500,fontFamily: 'Raleway',color: Color(0xFF292929),),),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(right: 30, left: 30),
                        child: Row(
                          children: [
                            Text(model[i].subtitle,style: TextStyle(fontSize: 9.26,fontWeight:
                            FontWeight.w400,fontFamily: 'Raleway',color: Color(0xFFB4B4B4),),),
                            SizedBox(width: 5,),
                            Text(model[i].uploadTime,style: TextStyle(fontSize: 9.26,fontWeight:
                            FontWeight.w400,fontFamily: 'Raleway',color: Color(0xFF292929),),),
                            Spacer(),
                            PopupMenuButton<String>(
                              onSelected: (value) {
                                // Handle selected option
                                print('Selected: $value');
                              },
                              itemBuilder: (context) => model[i].menuOptions.map((option) {
                                return PopupMenuItem<String>(
                                  value: option,
                                  child: Text(option),
                                );
                              }).toList(),
                              icon: Icon(Icons.more_vert, color: Colors.black),
                            )

                          ],
                        ),
                      ),

                      Image.asset(model[i].Image,
                        width: MediaQuery.of(context).size.width,
                        fit: BoxFit.cover,
                        height: 179,),

                      Padding(
                        padding: const EdgeInsets.only(right: 30, left: 30, top: 13.5),
                        child: Row(
                          children: [
                            Image.asset(model[i].viewImage, width: 18,height: 18,),
                            SizedBox(width: 6,),
                            Text(model[i].views,style: TextStyle(fontSize: 9.26,fontWeight:
                            FontWeight.w400,fontFamily: 'Raleway',color: Color(0xFF292929),),),
                            SizedBox(width: 29,),
                            GestureDetector(
                              onTap: (){
                                if (model[i].commentPageRoute!= null) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => model[i].commentPageRoute!),
                                  );
                                }
                              },
                                child: Image.asset(model[i].commentImage, width: 18,height: 18,)),
                            SizedBox(width: 6,),
                            GestureDetector(
                              onTap: (){
                                if (model[i].commentPageRoute!= null) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => model[i].commentPageRoute!),
                                  );
                                }
                              },
                              child: Text(model[i].comments,style: TextStyle(fontSize: 9.26,fontWeight:
                              FontWeight.w400,fontFamily: 'Raleway',color: Color(0xFF292929),),),
                            ),
                          ],
                        ),
                      )

                    ],
                  );
                }),
          )
        ],
      ),

    );
  }
}
