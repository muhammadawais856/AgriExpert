
import 'package:flutter/material.dart';

class edit_profile extends StatefulWidget {
  const edit_profile({super.key});

  @override
  State<edit_profile> createState() => _edit_profileState();
}

class _edit_profileState extends State<edit_profile> {
  @override
  TextEditingController name=TextEditingController();
  TextEditingController email=TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.arrow_back, color: Colors.green,),),
        title: Text("Profile", style: TextStyle(fontSize: 23.04,fontWeight:
        FontWeight.bold,fontFamily: 'Raleway',color: Color(0xFF292929),),),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Stack(
                children: [
                  ClipOval(
                    child: Image.asset('Assets/images/profileimage.jpg', width: 82, height: 82, fit: BoxFit.cover,),
                  ),
                  Positioned( // this set position of wigdet
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 28,
                      height: 28,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: Center(    // this is use to overlay each other
                        child: Image.asset("Assets/images/editprofile.png", width: 32, height: 32,),
                      ),
                    ),
                  ),
                ],
              ),

            ),

            SizedBox(height: 30,),
            SizedBox(
              height: 60,
              width: 320,
              child: TextField(
                controller: name,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  label: Text("Name", style: TextStyle(fontSize: 13.33,fontWeight:
                  FontWeight.w400,fontFamily: 'Raleway',color: Color(0xFFB4B4B4),),),

                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFD4D4D4)), // inactive border
                    borderRadius: BorderRadius.circular(8),
                  ),

                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF339D44), width: 2), // active border
                    borderRadius: BorderRadius.circular(8),
                  ),

                ),
              ),
            ),

            SizedBox(height: 24,),

            SizedBox(
              height: 60,
              width: 320,
              child: TextField(
                controller: email,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  label: Text("Email", style: TextStyle(fontSize: 13.33,fontWeight:
                  FontWeight.w400,fontFamily: 'Raleway',color: Color(0xFFB4B4B4),),),

                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFD4D4D4)), // inactive border
                    borderRadius: BorderRadius.circular(8),
                  ),

                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF339D44), width: 2), // active border
                    borderRadius: BorderRadius.circular(8),
                  ),

                ),
              ),
            ),
            SizedBox(height: 370,),

            Center(
              child: SizedBox(
                height: 60,
                width: 315,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
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
                  child: Text("Save Changes"),
                ),
              ),
            ),



          ],
        ),
      ),
    );
  }
}
