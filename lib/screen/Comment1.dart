
import 'package:agriexpert/screen/comment_all.dart';
import 'package:agriexpert/screen/comment_recent.dart';
import 'package:agriexpert/screen/comment_relevent.dart';
import 'package:flutter/material.dart';

class comment1 extends StatefulWidget {
  const comment1({super.key});

  @override
  State<comment1> createState() => _comment1State();
}

class _comment1State extends State<comment1> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(onPressed: (){
            Navigator.pop(context);
          }, icon: Icon(Icons.arrow_back,color: Colors.green,)),
          title: Text("Comments", style: TextStyle(fontSize: 23.04,fontWeight:
          FontWeight.bold,fontFamily: 'Raleway',color: Color(0xFF292929),),),
          
          

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
                  Tab(text: 'Most Recent'),
                  Tab(text: 'Relevent'),
                ],
              ),
            ),
          ),

        ),
        body: TabBarView(
          children: [
            comment_all(),
            comment_recent(),
            comment_relevent()

          ],
        ),
      ),
    );
  }
}
