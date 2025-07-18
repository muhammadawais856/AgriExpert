
import 'package:agriexpert/models/all_model.dart';
import 'package:flutter/material.dart';

class review_rating extends StatefulWidget {
  const review_rating({super.key});

  @override
  State<review_rating> createState() => _review_ratingState();
}

class _review_ratingState extends State<review_rating> {
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
      image: 'Assets/images/profile1.jpg',
      name: 'Fareeha Sadaqat',
      time: '20 mins ago',
      comment: 'Recommended Expert.',
      iconStar: Icons.star_border,
      starCount: 4,
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
      starCount: 3,
    ),
    RatingReviewModel(
      image: 'Assets/images/profile1.jpg',
      name: 'Muhammad Ali',
      time: '20 mins ago',
      comment: 'Very patient.\nTotally Recommended Expert.',
      iconStar: Icons.star_border,
      starCount: 2,
    ),
    RatingReviewModel(
      image: 'Assets/images/profile4.jpg',
      name: 'Muhammad Ali',
      time: '20 mins ago',
      comment: 'Very patient.\nTotally Recommended Expert.',
      iconStar: Icons.star_border,
      starCount: 2 ,
    ),
  ];
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.arrow_back, color: Colors.green,),),
        title: Text("Ratings & Reviews", style: TextStyle(fontSize: 23.04,fontWeight:
        FontWeight.bold,fontFamily: 'Raleway',color: Color(0xFF292929),),),
      ),

      body: Column(

        children: [
          SizedBox(height: 30,),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 30, left: 30,),
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
          ),
        ],
      ),
    );
  }
}
