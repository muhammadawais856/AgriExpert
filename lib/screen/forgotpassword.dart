
import 'package:agriexpert/Services/auth.dart';
import 'package:agriexpert/screen/Register1.dart';
import 'package:flutter/material.dart';

class forgotpassword extends StatefulWidget {
  const forgotpassword({super.key});

  @override
  State<forgotpassword> createState() => _forgotpasswordState();
}

class _forgotpasswordState extends State<forgotpassword> {
  @override
  bool isLoading = false;
  // Controllers
  TextEditingController email = TextEditingController();

// FocusNodes
  FocusNode emailFocus = FocusNode();

// Focus state variables
  bool isEmailFocused = false;

  @override
  void initState() {
    super.initState();


    emailFocus.addListener(() {
      setState(() {
        isEmailFocused = emailFocus.hasFocus;
      });
    });


  }

  @override
  void dispose() {
    email.dispose();

    emailFocus.dispose();

    super.dispose();
  }


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
                      child: Padding(
                        padding: const EdgeInsets.only(left: 30, top: 30, right: 30, bottom: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 5,),
                            Text("Forgot Password", style: TextStyle(fontSize: 23.04,fontWeight:
                            FontWeight.bold,fontFamily: 'Raleway',color: Color(0xFF292929),),),
                            SizedBox(height: 5,),
                            Text("Enter your registered  email below \n we’ll send you a  reset link", style: TextStyle(fontSize: 13.33,fontWeight:
                            FontWeight.w400,fontFamily: 'Raleway',color: Color(0xFFB4B4B4),),),


                            SizedBox(height: 24,),
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


                            SizedBox(height: 222,),



                            isLoading? Center(
                              child: CircularProgressIndicator(),
                            )
                            :Center(
                              child: SizedBox(
                                height: 60,
                                width: 315,
                                child: ElevatedButton(
                                  onPressed: () async {
                                    if (email.text.isEmpty) {
                                      ScaffoldMessenger.of(context).showSnackBar(
                                          SnackBar(content: Text("Email cannot be empty.")));
                                      return;
                                    }
                                    try{
                                      isLoading=true;
                                      setState(() {

                                      });
                                      await AuthServies().forgotpassword(email.text).then((val){
                                        isLoading=false;
                                        setState(() {

                                        });
                                        ScaffoldMessenger.of(context).showSnackBar(
                                            SnackBar(content: Text("Password reset link has been send to your email account")));

                                      });


                                    }catch(e){
                                      isLoading = false;
                                      setState(() {});
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(content: Text(e.toString())));

                                    }
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
                                  child: Text("Get Link"),
                                ),
                              ),
                            ),


                          ],
                        ),
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
