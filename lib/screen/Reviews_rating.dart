import 'package:agriexpert/models/review&rating.dart';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../Services/review&rating.dart';

class review_rating extends StatefulWidget {
  const review_rating({super.key});

  @override
  State<review_rating> createState() => _review_ratingState();
}

class _review_ratingState extends State<review_rating> {
  final RatingReviewService _service = RatingReviewService();

  List<RatingReviewModels> reviews = [];

  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchReviews();
  }

  Future<void> fetchReviews() async {
    final fetchedReviews = await _service.getReviews();
    setState(() {
      reviews = fetchedReviews.cast<RatingReviewModels>();
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back, color: Colors.green),
        ),
        title: const Text("Ratings & Reviews", style: TextStyle(fontSize: 23.04, fontWeight: FontWeight.bold,
            fontFamily: 'Raleway', color: Color(0xFF292929),),),
      ),

      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : reviews.isEmpty
          ? const Center(child: Text("No reviews yet"))
          : Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: ListView.builder(
          itemCount: reviews.length,
          itemBuilder: (context, index) {
            final review = reviews[index];

            return Padding(
              padding: const EdgeInsets.only(bottom: 10,top: 20),
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
                          mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                          children: [
                            // Name and Time
                            Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                Text(
                                  review.name,
                                  style: const TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Raleway',
                                    color: Color(0xFF292929),
                                  ),
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  DateFormat("dd MMM, hh:mm a")
                                      .format(
                                      review.time.toDate()),
                                  style: const TextStyle(
                                    fontSize: 10,
                                    color: Color(0xFFB4B4B4),
                                  ),
                                ),
                              ],
                            ),

                            // Green stars
                            Row(
                              children: List.generate(review.starCount,
                                      (i) {
                                    return const Icon(
                                      Icons.star_border,
                                      color: Color(0xFF339D44),
                                      size: 16,
                                    );
                                  }),
                            )
                          ],
                        ),

                        const SizedBox(height: 6),

                        // Comment
                        Text(
                          review.comment,
                          style: const TextStyle(
                            fontSize: 13,
                            fontFamily: 'Raleway',
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF292929),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
