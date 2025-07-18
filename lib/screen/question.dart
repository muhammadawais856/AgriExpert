
import 'package:agriexpert/screen/Question_Search1.dart';
import 'package:agriexpert/screen/tabbar_all.dart';
import 'package:agriexpert/screen/tabbar_answered.dart';
import 'package:agriexpert/screen/tabbar_pending.dart';
import 'package:flutter/material.dart';

class question extends StatefulWidget {
  const question({super.key});

  @override
  State<question> createState() => _questionState();
}

class _questionState extends State<question> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text("Questions", style: TextStyle(fontSize: 23.04,fontWeight:
          FontWeight.bold,fontFamily: 'Raleway',color: Color(0xFF292929),),),
          actions: [
            GestureDetector(
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => questionsearch1()),
              );
            },
                child: Image.asset("Assets/images/searchicon.jpg", width: 24, height: 24,)),
            SizedBox(width: 30,)
          ],

          bottom: PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: TabBar(
                dividerColor: Colors.white,
                labelColor: Color(0xFFFFFFFF),
                unselectedLabelColor: Color(0xFFB4B4B4),
                indicator: BoxDecoration(
                  color: Color(0xFF339D44),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                indicatorSize: TabBarIndicatorSize.tab,
                tabs: [
                  Tab(text: 'All'),
                  Tab(text: 'Pending'),
                  Tab(text: 'Answered'),
                ],
              ),
            ),
          ),

        ),
        body: TabBarView(
          children: [
            tabbar_all(),
            tabbar_pending(),
            tabbar_answered(),

          ],
        ),
      ),
    );
  }
}
