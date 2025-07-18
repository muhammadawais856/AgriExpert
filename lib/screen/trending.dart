
import 'package:agriexpert/screen/add_video.dart';
import 'package:agriexpert/screen/tabbar_all_trending.dart';
import 'package:agriexpert/screen/tabbar_recentupload.dart';
import 'package:flutter/material.dart';

class trending extends StatefulWidget {
  const trending({super.key});

  @override
  State<trending> createState() => _trendingState();
}

class _trendingState extends State<trending> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text("Training Videos", style: TextStyle(fontSize: 23.04,fontWeight:
          FontWeight.bold,fontFamily: 'Raleway',color: Color(0xFF292929),),),
          actions: [
            Row(
              children: [
                GestureDetector(
                    onTap: (){
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => questionsearch1()),
                      // );
                    },
                    child: Image.asset("Assets/images/searchicon.jpg", width: 24, height: 24,)),

                SizedBox(width: 10,),

                GestureDetector(
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => add_video()),
                      );
                    },
                    child: Image.asset("Assets/images/plus.jpg", width: 24, height: 24,)),

                SizedBox(width: 30,)

              ],
            )


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
                  Tab(text: 'Recent Upload'),
                ],
              ),
            ),
          ),

        ),
        body: TabBarView(
          children: [
            tabbar_all_trending(),
            tabbar_recentupload(),

          ],
        ),
      ),
    );
  }
}
