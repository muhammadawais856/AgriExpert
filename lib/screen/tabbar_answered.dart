import 'package:flutter/material.dart';

class tabbar_answered extends StatefulWidget {
  const tabbar_answered({super.key});

  @override
  State<tabbar_answered> createState() => _tabbar_answeredState();
}

class _tabbar_answeredState extends State<tabbar_answered> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
      )
    );
  }
}
