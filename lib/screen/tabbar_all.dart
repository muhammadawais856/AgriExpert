
import 'package:agriexpert/models/all_model.dart';
import 'package:agriexpert/screen/answered.dart';
import 'package:flutter/material.dart';

class tabbar_all extends StatefulWidget {
  const tabbar_all({super.key});

  @override
  State<tabbar_all> createState() => _tabbar_allState();
}

class _tabbar_allState extends State<tabbar_all> {
  @override
  List<AllModel> model=[
      AllModel(
        profileImage: 'Assets/images/profile1.jpg',
        name: 'Fareeha Sadaqat',
        time: '10 mins ago',
        title: 'I have an issue regarding this vehicle.',
        contentImage: 'Assets/images/tractor.jpg',

      ),
    AllModel(
      profileImage: 'Assets/images/profile2.jpg',
      name: 'Muhammad Ali Nizami',
      time: '20 mins ago',
      title: 'What is the process of purchasing Vehicle from hardware store?',
      answerRoute: answered(),

    ),
    AllModel(
      profileImage: 'Assets/images/profile3.jpg',
      name: 'Masab Mehmood',
      time: '15 mins ago',
      title: 'What is the process of purchasing Vehicle from hardware store?',
    ),



  ];
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
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

                      TextButton(onPressed: (){
                        if (model[i].answerRoute != null) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => model[i].answerRoute!),
                          );
                        }

                      },
                          child: Text("Answered",style: TextStyle(fontSize: 11,fontWeight:
                          FontWeight.w400,fontFamily: 'Raleway',color: Color(0xFF339D44),),),
                      )



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
                      Image.asset(model[i].contentImage!,
                          width: double.infinity,
                          fit: BoxFit.cover, height: 179),



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
