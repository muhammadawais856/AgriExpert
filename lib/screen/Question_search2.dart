import 'package:flutter/material.dart';

class questionsearch2 extends StatefulWidget {
  const questionsearch2({super.key});

  @override
  State<questionsearch2> createState() => _questionsearch2State();
}

class _questionsearch2State extends State<questionsearch2> {
  @override
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
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,

          children: [
            Image.asset("Assets/images/image1.jpg", width: 190, height: 206,),
            SizedBox(height: 35,),

            Text("No Data Found", style: TextStyle(fontSize: 23.04,fontWeight:
            FontWeight.w500,fontFamily: 'Raleway',color: Color(0xFF292929),),),
            SizedBox(height: 8,),

            Text("You have not answered any \n questions yet",textAlign: TextAlign.center, style: TextStyle(fontSize: 16,fontWeight:
            FontWeight.w400,fontFamily: 'Raleway',color: Color(0xFFB4B4B4),),),

          ],
        ),
      ),
    );
  }
}
