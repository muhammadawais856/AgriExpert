import 'package:agriexpert/models/all_model.dart';
import 'package:flutter/material.dart';

class questionsearch1 extends StatefulWidget {
  const questionsearch1({super.key});

  @override
  State<questionsearch1> createState() => _questionsearch1State();
}

class _questionsearch1State extends State<questionsearch1> {
  @override

  TextEditingController search=TextEditingController();

  List<AllModel> model=[
    AllModel(
      profileImage: 'Assets/images/profile2.jpg',
      name: 'Muhammad Ali Nizami',
      time: '20 mins ago',
      title: 'What is the process of purchasing Vehicle from hardware store?',

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
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Text("Questions", style: TextStyle(fontSize: 23.04,fontWeight:
        FontWeight.bold,fontFamily: 'Raleway',color: Color(0xFF292929),),),
        actions: [
          GestureDetector(
              onTap: (){
                Navigator.pop(context);
              },
              child: Image.asset("Assets/images/cross.jpg", width: 24, height: 24,)),
          SizedBox(width: 30,)
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            TextField(
              controller: search,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                label: Text("Search", style: TextStyle(fontSize: 13.33,fontWeight:
                FontWeight.w400,fontFamily: 'Raleway',color: Color(0xFFB4B4B4),),),

                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFD4D4D4),), // inactive border
                  borderRadius: BorderRadius.circular(8),
                ),

                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF339D44), width: 2), // active border
                  borderRadius: BorderRadius.circular(8),
                ),

              ),
            ),
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
                          Row(
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
                          SizedBox(height: 15.5,),

                          Text(model[i].title,style: TextStyle(fontSize: 13.13,fontWeight:
                          FontWeight.bold,fontFamily: 'Raleway',color: Color(0xFF292929),),),

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
        ),
      ),

    );
  }
}
