import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../provider/user_provider.dart';

class edit_profile extends StatefulWidget {
  const edit_profile({super.key});

  @override
  State<edit_profile> createState() => _edit_profileState();
}

class _edit_profileState extends State<edit_profile> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  File? _pickedImage;

  @override
  void initState() {
    super.initState();
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    name.text = userProvider.name ?? '';
    email.text = userProvider.email ?? '';
  }


  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile =
    await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _pickedImage = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back, color: Colors.green),
        ),
        title: const Text(
          "Profile",
          style: TextStyle(
            fontSize: 23.04,
            fontWeight: FontWeight.bold,
            fontFamily: 'Raleway',
            color: Color(0xFF292929),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [

            Center(
              child: Stack(
                children: [
                  ClipOval(
                    child: _pickedImage != null
                        ? Image.file(
                      _pickedImage!,
                      width: 82,
                      height: 82,
                      fit: BoxFit.cover,
                    )
                        : (userProvider.profilePicture != null &&
                        userProvider.profilePicture!.isNotEmpty)
                        ? Image.network(
                      userProvider.profilePicture!,
                      width: 82,
                      height: 82,
                      fit: BoxFit.cover,
                    )
                        : Image.asset(
                      'Assets/images/profileimage.jpg',
                      width: 82,
                      height: 82,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: GestureDetector(
                      onTap: _pickImage,
                      child: Container(
                        width: 28,
                        height: 28,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        child: Center(
                          child: Image.asset(
                            "Assets/images/editprofile.png",
                            width: 20,
                            height: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),


            SizedBox(
              height: 60,
              width: 320,
              child: TextField(
                controller: name,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  label: const Text(
                    "Name",
                    style: TextStyle(
                      fontSize: 13.33,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Raleway',
                      color: Color(0xFFB4B4B4),
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xFFD4D4D4)),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                    const BorderSide(color: Color(0xFF339D44), width: 2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 24),


            SizedBox(
              height: 60,
              width: 320,
              child: TextField(
                controller: email,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  label: const Text(
                    "Email",
                    style: TextStyle(
                      fontSize: 13.33,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Raleway',
                      color: Color(0xFFB4B4B4),
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xFFD4D4D4)),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                    const BorderSide(color: Color(0xFF339D44), width: 2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 370),


            Center(
              child: SizedBox(
                height: 60,
                width: 315,
                child: ElevatedButton(
                  onPressed: () {

                    userProvider.setUserDetails(name.text, email.text);


                    if (_pickedImage != null) {
                      userProvider.setProfilePicture(_pickedImage!.path);
                    }

                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF339D44),
                    foregroundColor: const Color(0xFFF4F4F4),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    textStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Raleway',
                    ),
                  ),
                  child: const Text("Save Changes"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
