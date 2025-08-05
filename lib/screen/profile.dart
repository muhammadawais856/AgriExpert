 import 'package:agriexpert/models/all_model.dart';
import 'package:agriexpert/screen/Reviews_rating.dart';
import 'package:agriexpert/screen/Setting.dart';
import 'package:agriexpert/screen/bottom_nav_bar.dart';
import 'package:agriexpert/screen/edit_profile.dart';
import 'package:flutter/material.dart';

import '../Services/User.dart';
import '../models/UserModel.dart';

class profile extends StatefulWidget {
  final String userId;
  const profile({super.key,required this.userId});
 
   @override
   State<profile> createState() => _profileState();
 }
 
 class _profileState extends State<profile> {
   @override

   List<RatingReviewModel> reviews = [
     RatingReviewModel(
       image: 'Assets/images/profile4.jpg',
       name: 'Fareeha Sadaqat',
       time: '20 mins ago',
       comment: 'Recommended Expert.',
       iconStar: Icons.star_border,
       starCount: 5,
     ),
     RatingReviewModel(
       image: 'Assets/images/profile3.jpg',
       name: 'Masab Mehmood',
       time: '20 mins ago',
       comment: 'Very Patient and Honest.',
       iconStar: Icons.star_border,
       starCount: 4,
     ),
     RatingReviewModel(
       image: 'Assets/images/profile2.jpg',
       name: 'Muhammad Ali',
       time: '20 mins ago',
       comment: 'Very patient.\nTotally Recommended Expert.',
       iconStar: Icons.star_border,
       starCount: 2,
     ),
   ];
   final UserService _userService = UserService();
   UserModel? user;
   bool isLoading = true;

   @override
   void initState() {
     super.initState();
     print("🟢 PROFILE: Loading user with ID: ${widget.userId}");
     loadUser();
   }

   Future<void> loadUser() async {
     user = await _userService.getCurrentUser(widget.userId);
     setState(() {
       isLoading = false;
     });
   }

   Widget build(BuildContext context) {
     return Scaffold(
       backgroundColor: Colors.white,
       appBar: AppBar(
         backgroundColor: Colors.white,
         title: Text("Profile", style: TextStyle(fontSize: 23.04,fontWeight:
         FontWeight.bold,fontFamily: 'Raleway',color: Color(0xFF292929),),),
         actions: [
           GestureDetector(
               onTap: (){
                 Navigator.push(
                   context,
                   MaterialPageRoute(builder: (context) => setting()),
                 );
               },
               child: Image.asset("Assets/images/setting.jpg", width: 24, height: 24,)),
           SizedBox(width: 30,),
         ],
       ),
       body:Padding(
         padding: const EdgeInsets.only(right: 30, left: 30, top: 10),
         child: Column(
           children: [
         user == null
         ? const Center(child: CircularProgressIndicator())
           : Column(
               children: [
                   Center(
                     child: ClipOval(
                            child: user!.profileImage != null && user!.profileImage!.isNotEmpty
                        ? Image.network(
                          user!.profileImage!, width: 82, height: 82, fit: BoxFit.cover,)
                        : Image.asset('Assets/images/profileimage.jpg', width: 82, height: 82, fit: BoxFit.cover,),),),

                 const SizedBox(height: 10),

                 Text(
                   user!.name ?? 'No Name',
                   style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500,
                     fontFamily: 'Raleway', color: Color(0xFF292929),),),

                 const SizedBox(height: 10),

                 Text(user!.email ?? 'No Email', style: const TextStyle(fontSize: 11.11, fontWeight: FontWeight.w400,
                   fontFamily: 'Raleway', color: Color(0xFF339D44),),),],),

             SizedBox(height: 18,),

             Center(
               child: SizedBox(
                 height: 40,
                 width: 170,
                 child: ElevatedButton(
                   onPressed: () {
                     Navigator.push(
                       context,
                       MaterialPageRoute(builder: (context) => edit_profile()),
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
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       Image.asset("Assets/images/edit.png", width: 24, height: 24,),
                       SizedBox(width: 10,),
                       Text("Edit Profile")

                     ],
                   )
                 ),
               ),
             ),
             SizedBox(height: 32,),

             // part 2

             Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 Text("Stats", style: TextStyle(fontSize: 13.33,fontWeight:
                 FontWeight.w500,fontFamily: 'Raleway',color: Color(0xFF292929),),),
                 GestureDetector(
                   onTap: (){
                     Navigator.push(
                       context,
                       MaterialPageRoute(builder: (context) => bottomnavbar()),
                     );
                   },
                   child: Text("See Dashboard", style: TextStyle(fontSize: 9.26,fontWeight:
                   FontWeight.w500,fontFamily: 'Raleway',color: Color(0xFF339D44),),),
                 ),
               ],
             ),
             SizedBox(height: 10,),

             // part3

             SingleChildScrollView(
               scrollDirection: Axis.horizontal,
               child: Row(
                 children: [

                   Container(
                     height: 40,
                     width: 119,
                     child: Text("252 Answered",  textAlign: TextAlign.center ,style: TextStyle(fontSize: 11.11,fontWeight:
                     FontWeight.w400,fontFamily: 'Raleway',color: Color(0xFF292929),),),
                   ),
                   SizedBox(width: 9,),

                   Container(
                     height: 40,
                     width: 119,
                     child: Text("71 Pending", textAlign: TextAlign.center ,style: TextStyle(fontSize: 11.11,fontWeight:
                     FontWeight.w400,fontFamily: 'Raleway',color: Color(0xFF292929),),),
                   ),
                   SizedBox(width: 9,),

                   Container(
                     height: 40,
                     width: 119,
                     child: Text("14 Video upload",textAlign: TextAlign.center , style: TextStyle(fontSize: 11.11,fontWeight:
                     FontWeight.w400,fontFamily: 'Raleway',color: Color(0xFF292929),),),
                   ),

               ],),
             ),
             SizedBox(height: 20,),

             //part 4

             Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 Text("Ratings & Reviews",textAlign: TextAlign.center , style: TextStyle(fontSize: 13.13,fontWeight:
                 FontWeight.w800,fontFamily: 'Raleway',color: Color(0xFF292929),),),
                 GestureDetector(
                   onTap: (){
                     Navigator.push(
                       context,
                       MaterialPageRoute(builder: (context) => review_rating()),
                     );
                   },
                   child: Text("See All",textAlign: TextAlign.center , style: TextStyle(fontSize: 9.26,fontWeight:
                   FontWeight.w400,fontFamily: 'Raleway',color: Color(0xFF339D44),),),
                 ),

               ],

             ),
             SizedBox(height: 24,),

             //last part

             Expanded(
               child: ListView.builder(
                 itemCount: reviews.length,
                 itemBuilder: (context, index) {
                   final review = reviews[index];

                   return Padding(
                     padding: const EdgeInsets.only(bottom: 48),
                     child: Row(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         // Profile image
                         CircleAvatar(
                           backgroundImage: AssetImage(review.image),
                           radius: 20,
                         ),
                         const SizedBox(width: 12),

                         // Name, Time, Stars and Comment
                         Expanded(
                           child: Column(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [

                               Row(
                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                 children: [
                                   // Name and Time
                                   Column(
                                     crossAxisAlignment: CrossAxisAlignment.start,
                                     children: [
                                       Text(review.name, style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600,
                                           fontFamily: 'Raleway', color: Color(0xFF292929),),),
                                       SizedBox(height: 2),
                                       Text(review.time, style: TextStyle(fontSize: 10, color: Color(0xFFB4B4B4),),),
                                     ],
                                   ),

                                   // Green stars only
                                   Row(
                                     children: List.generate(review.starCount, (i) {
                                       return Icon(review.iconStar, color: Color(0xFF339D44), size: 16,);
                                     }),
                                   )
                                 ],
                               ),

                               SizedBox(height: 6),

                               // Comment
                               Text(
                                 review.comment,
                                 style: TextStyle(fontSize: 13, fontFamily: 'Raleway', fontWeight: FontWeight.w400,
                                   color: Color(0xFF292929),),),
                             ],
                           ),
                         ),
                       ],
                     ),
                   );
                 },
               ),
             ),


           ],
         ),
       )
     );
   }
 }
 