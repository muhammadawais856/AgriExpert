
import 'dart:async';

import 'package:agriexpert/screen/onboarding_screen.dart';
import 'package:flutter/material.dart';

class splash_screen extends StatefulWidget {
  const splash_screen({super.key});

  @override
  State<splash_screen> createState() => _splash_screenState();
}

class _splash_screenState extends State<splash_screen> {
  @override

  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => onboarding_screen()),
      );
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 290,),
            Image.asset("Assets/images/splashscreen.jpg", width: 119, height: 118,),
            SizedBox(height: 320,),

            Text("Powered by", style: TextStyle(fontSize: 16,fontWeight:
            FontWeight.w400,fontFamily: 'Raleway',color: Color(0xFFB7B9C6),),),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("Assets/images/splash1.jpg", width: 23.69, height: 22.4,),


                SizedBox(width: 5,),
                Text("FARM TECH", style: TextStyle(fontSize: 16,fontWeight:
                FontWeight.w300,fontFamily: 'Raleway',color: Color(0xFF292929),),),

              ],
            )


          ],
        ),
      ),

    );
  }
}
