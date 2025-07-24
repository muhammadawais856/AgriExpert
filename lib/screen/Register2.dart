
import 'dart:io';

import 'package:agriexpert/screen/login.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../Services/User.dart';
import '../models/UserModel.dart';
import 'package:uuid/uuid.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;



class Register2 extends StatefulWidget {
  final String name;
  final String email;
  const Register2({super.key, required this.name, required this.email});


  @override
  State<Register2> createState() => _Register2State();
}


class _Register2State extends State<Register2> {
  @override

  Future<String> uploadImageToFirebase(File imageFile) async {
    String fileId = Uuid().v4();
    firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance
        .ref()
        .child('user_images')
        .child('$fileId.jpg');

    firebase_storage.UploadTask uploadTask = ref.putFile(imageFile);
    firebase_storage.TaskSnapshot snapshot = await uploadTask;
    String downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }




  File? ProfileImage;
  String? ProfileImageName;

  File? degreeImage;
  String? degreeImageName;

  Future<void> pickimage1() async{
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if(image!=null){
      setState(() {
        ProfileImage = File(image.path);
        ProfileImageName= image.name;
      });
    }
  }
  Future<void> pickimage2() async{
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if(image!=null){
      setState(() {
        degreeImage = File(image.path);
        degreeImageName= image.name;
      });
    }
  }

  // Controllers
  TextEditingController qualification = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController contact = TextEditingController();

// Dropdown
  String? selectedExpertise;
  List<String> expertiseList = ['Farming', 'Irrigation', 'Soil', 'Crop', 'Pest'];

// Focus Nodes
  FocusNode qualificationFocus = FocusNode();
  FocusNode addressFocus = FocusNode();
  FocusNode contactFocus = FocusNode();

// Focus States
  bool isQualificationFocused = false;
  bool isAddressFocused = false;
  bool isContactFocused = false;
  bool isExpertiseFocused = false;

  @override
  void initState() {
    super.initState();

    qualificationFocus.addListener(() {
      setState(() => isQualificationFocused = qualificationFocus.hasFocus);
    });
    addressFocus.addListener(() {
      setState(() => isAddressFocused = addressFocus.hasFocus);
    });
    contactFocus.addListener(() {
      setState(() => isContactFocused = contactFocus.hasFocus);
    });
  }

  @override
  void dispose() {
    qualification.dispose();
    address.dispose();
    contact.dispose();

    qualificationFocus.dispose();
    addressFocus.dispose();
    contactFocus.dispose();

    super.dispose();
  }


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

                  // profile image upload container
                  child: Container(
                    width: 335,
                    height: 50,
                    alignment: Alignment.center,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.only(left:20 ,right:20 ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(ProfileImageName ?? "Upload Profile Image", style: TextStyle(fontSize: 13.33,fontWeight:
                          FontWeight.w400,fontFamily: 'Raleway',color: Color(0xFF292929),),),

                          GestureDetector(onTap: (){
                            pickimage1();
                          },
                              child: Image.asset("Assets/images/upload.jpg", width: 18, height: 20,)),
                        ],

                      ),
                    ),

              )),

              SizedBox(height: 20,),

              // expertise dropdown
              GestureDetector(
                onTap: () {
                  setState(() {
                    isExpertiseFocused = true;
                  });
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: isExpertiseFocused ? Color(0xFF339D44) : Color(0xFFD4D4D4),
                      width: 1.5,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: DropdownButtonFormField<String>(
                    value: selectedExpertise,
                    icon: Icon(Icons.arrow_drop_down),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      labelText: "Expertise",
                      labelStyle: TextStyle(
                        color: isExpertiseFocused ? Color(0xFF339D44) : Color(0xFFB4B4B4),
                        fontFamily: 'Raleway', fontWeight: FontWeight.w400, fontSize: 13.33,
                      ),
                    ),
                    onChanged: (value) {
                      setState(() {
                        selectedExpertise = value;
                        isExpertiseFocused = false; // remove green after select
                      });
                    },
                    items: expertiseList.map((item) {
                      return DropdownMenuItem<String>(
                        value: item,
                        child: Text(item),
                      );
                    }).toList(),
                  ),
                ),
              ),


              SizedBox(height: 20,),

              Container(
                padding: EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: isQualificationFocused ? Color(0xFF339D44) : Color(0xFFD4D4D4),
                    width: 1.5,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TextField(
                  controller: qualification,
                  focusNode: qualificationFocus,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: "Qualification",
                    labelStyle: TextStyle(
                      color: isQualificationFocused ? Color(0xFF339D44) : Color(0xFFB4B4B4),
                      fontFamily: 'Raleway', fontWeight: FontWeight.w400, fontSize: 13.33,
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
                    width: 335,
                    height: 50,
                    alignment: Alignment.center,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(degreeImageName ?? "Upload Latest Degree Image", style: TextStyle(fontSize: 13.33,fontWeight:
                          FontWeight.w400,fontFamily: 'Raleway',color: Color(0xFF292929),),),

                          GestureDetector(onTap: (){
                            pickimage2();
                          },
                              child: Image.asset("Assets/images/upload.jpg", width: 18, height: 20,)),
                        ],

                      ),
                    ),

                  )),

              SizedBox(height: 20,),


              Container(
                padding: EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: isAddressFocused ? Color(0xFF339D44) : Color(0xFFD4D4D4),
                    width: 1.5,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TextField(
                  controller: address,
                  focusNode: addressFocus,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: "Address",
                    labelStyle: TextStyle(
                      color: isAddressFocused ? Color(0xFF339D44) : Color(0xFFB4B4B4),
                      fontFamily: 'Raleway',
                      fontWeight: FontWeight.w400,
                      fontSize: 13.33,
                    ),
                  ),
                ),
              ),


              SizedBox(height: 20,),


              Container(
                padding: EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: isContactFocused ? Color(0xFF339D44) : Color(0xFFD4D4D4),
                    width: 1.5,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TextField(
                  controller: contact,
                  focusNode: contactFocus,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: "Contact",
                    labelStyle: TextStyle(
                      color: isContactFocused ? Color(0xFF339D44) : Color(0xFFB4B4B4),
                      fontFamily: 'Raleway',
                      fontWeight: FontWeight.w400,
                      fontSize: 13.33,
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
                    onPressed: () async {
                      try{
                        // validations

                        if (ProfileImage == null) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Upload your profile image")),);
                          return;
                        }

                        if(selectedExpertise == null || selectedExpertise!.isEmpty){
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Please choose any Expertise"),));
                          return;
                        }
                        if(qualification.text.isEmpty){
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Enter your Qualification"),));
                          return;
                        }
                        if (ProfileImage == null) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Upload your degree image")),);
                          return;
                        }
                        if(address.text.isEmpty){
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Enter your Address"),));
                          return;
                        }
                        if(contact.text.isEmpty){
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Enter your contact number"),));
                          return;
                        }
                        if(contact.text.length!=11){
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Contact number must be 11 digit"),));
                          return;
                        }

                        String profileUrl = await uploadImageToFirebase(ProfileImage!);
                        String degreeUrl = await uploadImageToFirebase(degreeImage!);

                        // Create user model
                        UserModel model = UserModel(
                          name: widget.name,//pass from register 1
                          email: widget.email,

                          contact: contact.text,
                          address: address.text,
                          qualifictaion: qualification.text,
                          profileImage: profileUrl,
                          degreeImage: degreeUrl,
                          expertise: selectedExpertise!,
                        );

                        // Save in Firestore
                        await UserService().createUser(model);




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
                      }catch(e){

                        setState(() {});
                        ScaffoldMessenger.of(context)
                            .showSnackBar(SnackBar(content: Text(e.toString())));


                      }
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
