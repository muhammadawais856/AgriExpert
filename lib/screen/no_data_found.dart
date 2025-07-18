
import 'package:agriexpert/screen/bottom_nav_bar.dart';
import 'package:flutter/material.dart';

class no_data_found extends StatefulWidget {
  const no_data_found({super.key});

  @override
  State<no_data_found> createState() => _no_data_foundState();
}

class _no_data_foundState extends State<no_data_found> {
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

            Text("You have not answered any  questions yet",textAlign: TextAlign.center, style: TextStyle(fontSize: 16,fontWeight:
            FontWeight.w400,fontFamily: 'Raleway',color: Color(0xFFB4B4B4),),),

            SizedBox(height: 26,),

            Center(
              child: SizedBox(
                height: 60,
                width: 156,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => bottomnavbar()),
                    );
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
                  child: Text("Back to home"),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
