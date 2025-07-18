
import 'package:agriexpert/screen/login.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class Register2 extends StatefulWidget {
  const Register2({super.key});

  @override
  State<Register2> createState() => _Register2State();
}

class _Register2State extends State<Register2> {
  @override
  String? selectedExpertise;
  TextEditingController qualification=TextEditingController();
  TextEditingController address=TextEditingController();
  TextEditingController contact=TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 45, left: 30,right: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Personal Details", style: TextStyle(fontSize: 23.03,fontWeight:
              FontWeight.bold,fontFamily: 'Raleway',color: Color(0xFF292929),),),
              SizedBox(height: 7,),
              Text("Enter your personal details", style: TextStyle(fontSize: 13.33,fontWeight:
              FontWeight.w400,fontFamily: 'Raleway',color: Color(0xFFB4B4B4),),),
              SizedBox(height: 30,),


              DottedBorder(
                options: RoundedRectDottedBorderOptions(radius: Radius.circular(7),
                  color: Color(0xFF339D44), // border color
                  strokeWidth: 1,
                  dashPattern: [9,9],
                ),

                  child: Container(
                    width: 315,
                    height: 50,
                    alignment: Alignment.center,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.only(left:20 ,right:20 ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Upload Profile Image", style: TextStyle(fontSize: 13.33,fontWeight:
                          FontWeight.w400,fontFamily: 'Raleway',color: Color(0xFF292929),),),

                          GestureDetector(onTap: (){
                          },
                              child: Image.asset("Assets/images/upload.jpg", width: 18, height: 20,)),
                        ],

                      ),
                    ),

              )),
              SizedBox(height: 20,),
              SizedBox(
                height:60 ,
                width: 320,
                child: DropdownButtonFormField<String>(
                  value: selectedExpertise,
                  hint: Text(
                    "Choose Expertise",
                    style: TextStyle(fontSize: 13.33, fontWeight: FontWeight.w400, fontFamily: 'Raleway', color: Color(0xFFD4D4D4),),
                  ),

                  style: TextStyle(fontSize: 13.33, fontWeight: FontWeight.w400, fontFamily: 'Raleway', color: Colors.black,),

                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFD4D4D4)),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFD4D4D4)),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  items: ['Math', 'Science', 'Programming']
                      .map((e) => DropdownMenuItem(child: Text(e), value: e))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedExpertise = value;
                    });
                  },
                ),
              ),

              SizedBox(height: 20,),

              SizedBox(
                height: 60,
                width: 320,
                child: TextField(
                  controller: qualification,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    label: Text("Qualifications", style: TextStyle(fontSize: 13.33,fontWeight:
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
              SizedBox(height: 20,),

              DottedBorder(
                  options: RoundedRectDottedBorderOptions(radius: Radius.circular(7),
                    color: Color(0xFF339D44), // border color
                    strokeWidth: 1,
                    dashPattern: [9,9],
                  ),

                  child: Container(
                    width: 315,
                    height: 50,
                    alignment: Alignment.center,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Upload Latest Degree Image", style: TextStyle(fontSize: 13.33,fontWeight:
                          FontWeight.w400,fontFamily: 'Raleway',color: Color(0xFF292929),),),

                          GestureDetector(onTap: (){
                          },
                              child: Image.asset("Assets/images/upload.jpg", width: 18, height: 20,)),
                        ],

                      ),
                    ),

                  )),

              SizedBox(height: 20,),


              SizedBox(
                height: 115,
                width: 320,
                child: TextFormField(
                  controller: address,
                  keyboardType: TextInputType.multiline,
                  maxLines: null, // Allows infinite lines
                  minLines: 5,
                  decoration: InputDecoration(
                    label: Text("Address", style: TextStyle(fontSize: 13.33,fontWeight:
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

              SizedBox(height: 20,),


              SizedBox(
                height: 60,
                width: 320,
                child: TextField(
                  controller: contact,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    label: Text("Contact", style: TextStyle(fontSize: 13.33,fontWeight:
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

              SizedBox(height: 47,),




              Center(
                child: SizedBox(
                  height: 60,
                  width: 315,
                  child: ElevatedButton(
                    onPressed: () {
                      showDialog(context: context,
                          barrierDismissible: false,
                          builder: (context){
                            return AlertDialog(
                              backgroundColor: Colors.white,
                              title: Column(
                                children: [
                                  Image.asset("Assets/images/tick.jpg", width: 48, height: 48,),
                                  Text("Account Created", style: TextStyle(fontSize: 23.03 ,fontWeight:
                                  FontWeight.bold,fontFamily: 'Raleway',color: Color(0xFF292929),),),
                                ],
                              ),
                              content: Padding(
                                padding: const EdgeInsets.only(left: 23.5, right: 23.5),
                                child: Text("You can now access your account", style: TextStyle(fontSize: 13.33 ,fontWeight:
                                FontWeight.w400,fontFamily: 'Raleway',color: Color(0xFFB4B4B4),),),
                              ),

                              actions: [
                                Center(
                                  child: SizedBox(
                                    height: 60,
                                    width: 255,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) => login()),
                                        );
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Color(0xFF339D44), // Button color
                                        foregroundColor: Color(0xFFF4F4F4), // Text color
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, fontFamily: 'Raleway',
                                        ),
                                      ),
                                      child: Text("Login"),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF339D44), // Button color
                      foregroundColor: Color(0xFFF4F4F4), // Text color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, fontFamily: 'Raleway',
                      ),
                    ),
                    child: Text("Next"),
                  ),
                ),
              ),
              SizedBox(height: 19,),

              TextButton(onPressed: (){
                Navigator.pop(context);
              },
                child: Text("back", style: TextStyle(fontSize: 13.33 ,fontWeight:
                FontWeight.w400,fontFamily: 'Raleway',color: Color(0xFF339D44),),),
              ),







            ],
          ),
        ),
      ),

    );
  }
}
