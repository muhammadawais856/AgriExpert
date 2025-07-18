import 'package:agriexpert/screen/Register1.dart';
import 'package:agriexpert/screen/bottom_nav_bar.dart';
import 'package:agriexpert/screen/forgotpassword.dart';
import 'package:flutter/material.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  @override

  TextEditingController name=TextEditingController();
  TextEditingController password=TextEditingController();



  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
          width: double.infinity,
          decoration: BoxDecoration(


          ),
          child:Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.white
                ),
              ),
              Image.asset("Assets/images/welcome.jpg", width: double.infinity,
                height: screenHeight * 0.5, // 45% of screen height
                fit: BoxFit.cover,),
              Positioned(
                top: screenHeight * 0.35, // Push it below the image
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                    height: screenHeight * 0.65,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(topRight:Radius.circular(25), topLeft: Radius.circular(25)),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 30, top: 30, right: 30, bottom: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 5,),
                                Text("Welcome Again!", style: TextStyle(fontSize: 23.04,fontWeight:
                                FontWeight.bold,fontFamily: 'Raleway',color: Color(0xFF292929),),),
                                SizedBox(height: 5,),
                                Text("Login to Access Your Account", style: TextStyle(fontSize: 13.33,fontWeight:
                                FontWeight.w400,fontFamily: 'Raleway',color: Color(0xFFB4B4B4),),),


                                //Textfield for welcome page
                                SizedBox(height: 30,),
                                TextField(
                                  controller: name,
                                  keyboardType: TextInputType.text,
                                  decoration: InputDecoration(
                                    label: Text("Name", style: TextStyle(fontSize: 13.33,fontWeight:
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




                                SizedBox(height: 20,),
                                TextField(
                                  controller: password,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    label: Text("Password", style: TextStyle(fontSize: 13.33,fontWeight:
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

                                SizedBox(height: 20,),

                                Align(
                                  alignment: Alignment.topRight,
                                  child: TextButton(onPressed: (){
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => forgotpassword()),
                                    );
                                  },
                                      child: Text("Forgot Password?", style: TextStyle(fontSize: 13.33,fontWeight:
                                      FontWeight.w500,fontFamily: 'Raleway',color: Color(0xFF339D44),),),),
                                ),

                                SizedBox(height: 24,),



                                Center(
                                  child: SizedBox(
                                    height: 60,
                                    width: 315,
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
                                      child: Text("Login"),
                                    ),
                                  ),
                                ),

                                SizedBox(height: 23,),


                                Text("Don’t have an account?", style: TextStyle(fontSize: 13.33,fontWeight:
                                FontWeight.w400,fontFamily: 'Raleway',color: Color(0xFF292929),),),

                              ],
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.only(left: 17),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: TextButton(onPressed: (){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => Register1()),
                                );
                              },
                                child: Text("Sign Up", style: TextStyle(fontSize: 27.65,fontWeight:
                                FontWeight.w700,fontFamily: 'Raleway',color: Color(0xFF339D44),),),),
                            ),
                          ),
                        ],
                      ),
                    )

                ),
              )
            ],
          )
      ),
    );
  }
}
