import 'package:agriexpert/Services/auth.dart';
import 'package:agriexpert/screen/Register2.dart';
import 'package:agriexpert/screen/login.dart';
import 'package:flutter/material.dart';
import 'package:string_validator/string_validator.dart';

import '../Services/User.dart';
import '../models/UserModel.dart';

class Register1 extends StatefulWidget {
  const Register1({super.key});

  @override
  State<Register1> createState() => _Register1State();
}

class _Register1State extends State<Register1> {

  bool isLoading = false;

  @override
  // Controllers
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();

// FocusNodes
  FocusNode nameFocus = FocusNode();
  FocusNode emailFocus = FocusNode();
  FocusNode passwordFocus = FocusNode();
  FocusNode confirmPasswordFocus = FocusNode();

// Focus state variables
  bool isNameFocused = false;
  bool isEmailFocused = false;
  bool isPasswordFocused = false;
  bool isConfirmPasswordFocused = false;

  @override
  void initState() {
    super.initState();

    nameFocus.addListener(() {
      setState(() {
        isNameFocused = nameFocus.hasFocus;
      });
    });

    emailFocus.addListener(() {
      setState(() {
        isEmailFocused = emailFocus.hasFocus;
      });
    });

    passwordFocus.addListener(() {
      setState(() {
        isPasswordFocused = passwordFocus.hasFocus;
      });
    });

    confirmPasswordFocus.addListener(() {
      setState(() {
        isConfirmPasswordFocused = confirmPasswordFocus.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    name.dispose();
    email.dispose();
    password.dispose();
    confirmpassword.dispose();

    nameFocus.dispose();
    emailFocus.dispose();
    passwordFocus.dispose();
    confirmPasswordFocus.dispose();

    super.dispose();
  }




  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body:Container(
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
            Image.asset("Assets/images/login.png", width: double.infinity,
              height: screenHeight * 0.45, // 45% of screen height
              fit: BoxFit.cover,),
            Positioned(
              top: screenHeight * 0.2, // Push it below the image
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                height: screenHeight * 0.55,
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
                            Text("Create Account", style: TextStyle(fontSize: 23.04,fontWeight:
                            FontWeight.bold,fontFamily: 'Raleway',color: Color(0xFF292929),),),
                            SizedBox(height: 5,),
                            Text("Login to Access Your Account", style: TextStyle(fontSize: 13.33,fontWeight:
                            FontWeight.w400,fontFamily: 'Raleway',color: Color(0xFFB4B4B4),),),
                        
                        
                            //Textfield for login page
                            SizedBox(height: 15,),
                            // Name Field
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 12),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                  color: isNameFocused ? Color(0xFF339D44) : Color(0xFFD4D4D4),
                                  width: 1.5,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: TextField(
                                controller: name,
                                focusNode: nameFocus,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  labelText: "Name",
                                  labelStyle: TextStyle(fontSize: 13.33, fontWeight: FontWeight.w400,
                                    fontFamily: 'Raleway', color: isNameFocused ? Color(0xFF339D44) : Color(0xFFB4B4B4),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 15),

                            // Textfield for email

                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 12),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                  color: isEmailFocused ? Color(0xFF339D44) : Color(0xFFD4D4D4),
                                  width: 1.5,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: TextField(
                                controller: email,
                                focusNode: emailFocus,
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  labelText: "Email",
                                  labelStyle: TextStyle(fontSize: 13.33, fontWeight: FontWeight.w400,
                                    fontFamily: 'Raleway', color: isEmailFocused ? Color(0xFF339D44) : Color(0xFFB4B4B4),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 15),

                            // textfeild for password

                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 12),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                  color: isPasswordFocused ? Color(0xFF339D44) : Color(0xFFD4D4D4),
                                  width: 1.5,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: TextField(
                                controller: password,
                                focusNode: passwordFocus,
                                keyboardType: TextInputType.number,
                                obscureText: true,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  labelText: "Password",
                                  labelStyle: TextStyle(fontSize: 13.33, fontWeight: FontWeight.w400,
                                    fontFamily: 'Raleway', color: isPasswordFocused ? Color(0xFF339D44) : Color(0xFFB4B4B4),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 15),

                           // Confirm Password Field
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 12),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                  color: isConfirmPasswordFocused ? Color(0xFF339D44) : Color(0xFFD4D4D4),
                                  width: 1.5,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: TextField(
                                controller: confirmpassword,
                                focusNode: confirmPasswordFocus,
                                keyboardType: TextInputType.number,
                                obscureText: true,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  labelText: "Confirm Password",
                                  labelStyle: TextStyle(fontSize: 13.33, fontWeight: FontWeight.w400,
                                    fontFamily: 'Raleway', color: isConfirmPasswordFocused ? Color(0xFF339D44) : Color(0xFFB4B4B4),
                                  ),
                                ),
                              ),
                            ),

                            SizedBox(height: 58,),

                         //button for login , validation and firebase signup authentication

                         isLoading? Center(
                           child: CircularProgressIndicator(),
                            )
                            :Center(
                              child: SizedBox(
                                height: 60,
                                width: 315,
                                child: ElevatedButton(
                                  onPressed: () async {
                                    // validation for textfield
                                    if(name.text.isEmpty){
                                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Name Cannot be empty \n Please enter your name"),));
                                      return;
                                    }
                                    if(email.text.isEmpty){
                                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Email cannot be empty"),));
                                      return;
                                    }
                                    if(!email.text.isEmail){
                                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Enter valid email"),));
                                      return;
                                    }
                                    if(password.text.isEmpty){
                                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("password cannot be empty"),));
                                      return;
                                    }
                                    if(password.text.length<6){
                                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("password must be greater than 6 digits"),));
                                      return;
                                    }
                                    if(confirmpassword.text.isEmpty){
                                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("password cannot be empty"),));
                                      return;
                                    }
                                    if(confirmpassword.text.length<6){
                                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("password must be greater than 6 digits"),));
                                      return;
                                    }
                                    if (password.text != confirmpassword.text) {
                                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Passwords are not same \n please enter same password")),);
                                      return;
                                    }

                                    // firebase store
                                    try {
                                      isLoading = true;
                                      setState(() {});

                                      await AuthServies().signupUser(email: email.text, password: password.text);

                                      // Create a user model with name and email
                                      UserModel user = UserModel(
                                        name: name.text,
                                        email: email.text,
                                        createdAt: DateTime.now().toString(),
                                      );

                                      // Save to Firestore
                                      await UserService().createUser(user);

                                      // Navigate to Register2
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => Register2()),
                                      );

                                    }catch(e){
                                      isLoading=false;
                                      setState(() {});
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(content: Text(e.toString())));


                                    }


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
                                  child: Text("Next"),
                                ),
                              ),
                            ),

                            SizedBox(height: 30,),
                        
                        
                            Text("Already have an account?", style: TextStyle(fontSize: 13.33,fontWeight:
                            FontWeight.w400,fontFamily: 'Raleway',color: Color(0xFF292929),),),

                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 17),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: TextButton(onPressed: (){

                            // navigations
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => login()),
                            );
                          },
                            child: Text("Login", style: TextStyle(fontSize: 27.65,fontWeight:
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
      )

    );
  }
}
