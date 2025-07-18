import 'package:agriexpert/screen/home.dart';
import 'package:agriexpert/screen/message.dart';
import 'package:agriexpert/screen/profile.dart';
import 'package:agriexpert/screen/question.dart';
import 'package:agriexpert/screen/trending.dart';
import 'package:flutter/material.dart';

class bottomnavbar extends StatefulWidget {
  const bottomnavbar({super.key});

  @override
  State<bottomnavbar> createState() => _bottomnavbarState();
}

class _bottomnavbarState extends State<bottomnavbar> {
  int selectedindex = 0;

  final List<Widget> screenlist = [
    home(image: '', title: '', subtitle: ''),
    question(),
    trending(),
    message(),
    profile()
  ];

  final List<String> icons = [
    'Assets/images/home_icon.png',
    'Assets/images/qes.png',
    'Assets/images/video_icon.png',
    'Assets/images/message_icon.png',
    'Assets/images/profile_icon.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: screenlist[selectedindex],
      bottomNavigationBar: Container(
        padding: EdgeInsets.zero,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
            )
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(icons.length, (index) {
            bool isSelected = selectedindex == index;
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedindex = index;
                });
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // ✅ Green indicator with bottom curves only
                  AnimatedContainer(
                    duration: Duration(milliseconds: 200),
                    height: 6,
                    width: 45,
                    decoration: BoxDecoration(
                      color: isSelected ? Color(0xFF339D44) : Colors.transparent,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(6),
                        bottomRight: Radius.circular(6),
                        topLeft: Radius.circular(0),
                        topRight: Radius.circular(0),
                      ),
                    ),
                  ),
                  SizedBox(height: 4),
                  Image.asset(
                    icons[index],
                    width: 24,
                    height: 24,
                    color: isSelected ? Color(0xFF339D44) : Colors.grey,
                  ),
                  SizedBox(height: 6),
                ],
              ),
            );
          }),
        ),
      ),

    );
  }
}
