
import 'package:flutter/material.dart';

class four_zero_four extends StatefulWidget {
  const four_zero_four({super.key});

  @override
  State<four_zero_four> createState() => _four_zero_fourState();
}

class _four_zero_fourState extends State<four_zero_four> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            height: 698,
          ),
          Image.asset("Assets/images/fourzerofour.jpg",
            width: MediaQuery.of(context).size.width, height: MediaQuery.of(context).size.height,fit: BoxFit.contain,
          ),
          Positioned(
            bottom: 156,
            right: 45,

            child: Padding(
              padding: const EdgeInsets.only(right: 40,bottom: 29),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Page Not Found",textAlign: TextAlign.center, style: TextStyle(fontSize: 23.04,fontWeight:
                  FontWeight.w500,fontFamily: 'Raleway',color: Color(0xFF292929),),),
                  Text("The page you are looking for \n doesn’t seem to exist…",textAlign: TextAlign.center, style: TextStyle(fontSize: 16,fontWeight:
                  FontWeight.w400,fontFamily: 'Raleway',color: Color(0xFF292929),),),
                  SizedBox(height: 29,),
                  SizedBox(
                    height: 59,
                    width: 196,
                    child: ElevatedButton(
                      onPressed: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(builder: (context) => Register2()),
                        // );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF339D44), // Button color
                        foregroundColor: Color(0xFFF4F4F4), // Text/icon color
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        textStyle: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Raleway',
                        ),
                      ),
                      child: Text("Back To Home"),
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
