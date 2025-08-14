
import 'package:agriexpert/models/all_model.dart';
import 'package:agriexpert/screen/Comment1.dart';
import 'package:agriexpert/screen/video_player_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../Services/video.dart';
import '../models/video_model.dart';

class tabbar_recentupload extends StatefulWidget {
  const tabbar_recentupload({super.key});

  @override
  State<tabbar_recentupload> createState() => _tabbar_recentuploadState();
}

class _tabbar_recentuploadState extends State<tabbar_recentupload> {
  @override
  List<TrainingVideoAllModel> model = [
    TrainingVideoAllModel(
      title: "How to Start A Tractor",
      subtitle: "Upload Date",
      uploadTime: "15 mins ago",
      menuOptions: ['Edit', 'Delete', 'Share'],
      Image: "Assets/images/tractor2.jpg",
      viewImage: "Assets/images/viewimage.jpg",
      views: "139 Views",
      commentImage: "Assets/images/commentimage.jpg",
      comments: "22 Comments",
      commentPageRoute: comment1(),
    ),
    TrainingVideoAllModel(
      title: "How to Buy a Crane",
      subtitle: "Upload Date",
      uploadTime: "21 Oct, 2021 Monday",
      menuOptions: ['Edit', 'Delete', 'Share'],
      Image: "Assets/images/crane.jpg",
      viewImage: "Assets/images/viewimage.jpg",
      views: "72 Views",
      commentImage: "Assets/images/commentimage.jpg",
      comments: "14 Comments",

    ),
  ];
  List<videomodel> videoList = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }
  Future<void> fetchData() async {
    final videos = await VideoService().getAllVideos();
    setState(() {
      videoList = videos;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [

          Expanded(
            child: ListView.builder(
              itemCount: videoList.length,
              itemBuilder: (context, i) {
                final video = videoList[i];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 30, left: 30, top: 25),
                      child: Text(
                        video.title ?? '',
                        style: TextStyle(
                          fontSize: 13.33,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Raleway',
                          color: Color(0xFF292929),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 30, left: 30),
                      child: Row(
                        children: [
                          Text(
                            "Upload Date",
                            style: TextStyle(
                              fontSize: 9.26,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Raleway',
                              color: Color(0xFFB4B4B4),
                            ),
                          ),
                          SizedBox(width: 5),
                          Text(
                            video.createdAt != null
                                ? DateFormat('dd MMM yyyy').format(video.createdAt!.toDate())
                                : '',
                            style: TextStyle(
                              fontSize: 9.26,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Raleway',
                              color: Color(0xFF292929),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 14,),
                    GestureDetector(
                      onTap: () {
                        if (video.video != null && video.video!.isNotEmpty) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => VideoPlayerScreen(videoUrl: video.video!),
                            ),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Video URL not available")),
                          );
                        }
                      },
                      child: Container(
                        height: 179,
                        width: MediaQuery.of(context).size.width,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Image.asset(
                              video.image?.isNotEmpty == true
                                  ? video.image!
                                  : 'Assets/images/error.jpg',
                              width: MediaQuery.of(context).size.width,
                              fit: BoxFit.cover,
                            ),
                            Image.asset(
                              'Assets/images/play2.png',
                              width: 48,
                              height: 48,
                              fit: BoxFit.contain,
                            ),
                          ],
                        ),
                      ),
                    ),



                    // local model

                    Padding(
                      padding: const EdgeInsets.only(right: 30, left: 30, top: 13.5),
                      child: Row(
                        children: [
                          Image.asset(model[i].viewImage, width: 18,height: 18,),
                          SizedBox(width: 6,),
                          Text(model[i].views,style: TextStyle(fontSize: 9.26,fontWeight:
                          FontWeight.w400,fontFamily: 'Raleway',color: Color(0xFF292929),),),
                          SizedBox(width: 29,),
                          GestureDetector(
                              onTap: (){
                                if (model[i].commentPageRoute!= null) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => model[i].commentPageRoute!),
                                  );
                                }
                              },
                              child: Image.asset(model[i].commentImage, width: 18,height: 18,)),
                          SizedBox(width: 6,),
                          GestureDetector(
                            onTap: (){
                              if (model[i].commentPageRoute!= null) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => model[i].commentPageRoute!),
                                );
                              }
                            },
                            child: Text(model[i].comments,style: TextStyle(fontSize: 9.26,fontWeight:
                            FontWeight.w400,fontFamily: 'Raleway',color: Color(0xFF292929),),),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),

        ],
      ),

    );
  }
}
