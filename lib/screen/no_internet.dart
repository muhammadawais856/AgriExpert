
import 'package:flutter/material.dart';

class No_internet extends StatefulWidget {
  const No_internet({super.key});

  @override
  State<No_internet> createState() => _No_internetState();
}

class _No_internetState extends State<No_internet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Color(0xFF339D44),
      body: Stack(
        children: [
          Image.asset("Assets/images/no_internet.jpg",
            width: MediaQuery.of(context).size.width, height: 666,fit: BoxFit.contain,
          ),
          Positioned(
            bottom: 1,
            right: 1,
            child: Padding(
              padding: const EdgeInsets.only(right: 40,bottom: 29),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text("Connection Lost",textAlign: TextAlign.center, style: TextStyle(fontSize: 23.04,fontWeight:
                  FontWeight.w500,fontFamily: 'Raleway',color: Color(0xFFFFFFFF),),),
                  Text("Something went wrong.",textAlign: TextAlign.center, style: TextStyle(fontSize: 16,fontWeight:
                  FontWeight.w400,fontFamily: 'Raleway',color: Color(0xFFFFFFFF),),),
                  SizedBox(height: 29,),
                  SizedBox(
                    height: 59,
                    width: 128,
                    child: ElevatedButton(
                      onPressed: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(builder: (context) => Register2()),
                        // );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFFFFFFF), // Button color
                        foregroundColor: Color(0xFF339D44), // Text/icon color
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        textStyle: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Raleway',
                        ),
                      ),
                      child: Text("Retry"),
                    ),
                  ),
                ],
              ),
            ),
          ),
      ],
    ),

    );
  }
}
