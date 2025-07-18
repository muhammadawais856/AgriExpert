import 'package:flutter/material.dart';

class connection_lost extends StatefulWidget {
  const connection_lost({super.key});

  @override
  State<connection_lost> createState() => _connection_lostState();
}

class _connection_lostState extends State<connection_lost> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            height: 698,
          ),
          Positioned(
            bottom: 0,
            child: Image.asset("Assets/images/connection1.jpg",
              width: MediaQuery.of(context).size.width, height: 376,fit: BoxFit.contain,
            ),
          ),
          Positioned(
            bottom: 212,
            left: -40,
            child: Image.asset("Assets/images/person.png",
              width: 285, height: 232,
            ),
          ),
          Positioned(
            top: 57,
            right: 30,
            child: Image.asset("Assets/images/connection3.jpg",
              width: 124, height: 169,fit: BoxFit.contain,
            ),
          ),
          Positioned(
            bottom: -20,
            left: 100,
            child: Padding(
              padding: const EdgeInsets.only(right: 40,bottom: 29),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Connection Lost",textAlign: TextAlign.center, style: TextStyle(fontSize: 23.04,fontWeight:
                  FontWeight.w500,fontFamily: 'Raleway',color: Color(0xFF292929),),),
                  Text("Something went wrong.",textAlign: TextAlign.center, style: TextStyle(fontSize: 16,fontWeight:
                  FontWeight.w400,fontFamily: 'Raleway',color: Color(0xFF292929),),),
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
