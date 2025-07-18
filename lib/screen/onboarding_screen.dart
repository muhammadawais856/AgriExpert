
import 'package:agriexpert/screen/Register1.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../models/onboarding.dart';

class onboarding_screen extends StatefulWidget {
  const onboarding_screen({super.key});

  @override
  State<onboarding_screen> createState() => _onboarding_screenState();
}

class _onboarding_screenState extends State<onboarding_screen> {
  final PageController pageController = PageController();
  int currentPage = 0;
  @override
  final List<OnboardingModel> onboardingdata = [
    OnboardingModel(
      image: 'Assets/images/onboarding1.jpg',
      shadowPath: 'Assets/images/background.jpg',
      title: 'Get Rid of Third Person',
      description: 'Using this application you can get rid of paying commission fee to third person. Now you can directly chat with sellers and deal with them.',
    ),
    OnboardingModel(
      image: 'Assets/images/onboarding2.jpg',
      shadowPath: 'Assets/images/background.jpg',
      title: 'Help in Market Analysis',
      description: 'Monitor your crops in real-time and receive instant updates about soil and weather conditions.',
    ),
    OnboardingModel(
      image: 'Assets/images/onboarding3.jpg',
      shadowPath: 'Assets/images/background.jpg',
      title: 'Multilingual',
      description: 'Easily register your store on the platform and start selling your items, or if you are a buyer search for your desired items and purchase them directly.',
    ),
    // Add more screens here...
  ];
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: pageController,
                itemCount: onboardingdata.length,
                onPageChanged: (index) {
                  setState(() => currentPage = index);
                },
                itemBuilder: (context, index) {
                  final model = onboardingdata[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      children: [
                        const SizedBox(height: 40),
                        Stack(

                            children:[ Padding(
                              padding: const EdgeInsets.only(left: 70,top: 110),
                              child: Image.asset(model.shadowPath.toString(),height: 300,width: 400,),
                            ),
                              Padding(
                                padding: const EdgeInsets.only(left: 22,top: 74),
                                child: Image.asset(model.image.toString()),
                              ),
                            ]
                        ),
                         SizedBox(height: 40),

                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            model.title,textAlign: TextAlign.left, style: TextStyle(fontSize: 33,fontWeight:
                          FontWeight.w700,fontFamily: 'Raleway',color: Color(0xFF292929),),
                          ),
                        ),
                         SizedBox(height: 12),
                        Text(
                          model.description, style: TextStyle(fontSize: 19.2,fontWeight:
                        FontWeight.w400,fontFamily: 'Raleway',color: Color(0xFFB4B4B4),),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 20,left: 150),
                  child: SmoothPageIndicator(
                    controller: pageController, // PageController
                    count:  onboardingdata.length,
                    axisDirection: Axis.horizontal,
                    effect:  WormEffect(
                      dotHeight: 6,
                      dotWidth: 6,
                      activeDotColor: Color(0xFF339D44),
                      dotColor: Color(0xB2D4D4D4),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 130,bottom: 20),
                  child:TextButton(onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Register1()),
                    );
                  }, child:
                  Text("Skip", style: TextStyle(fontSize: 14,fontWeight:
                  FontWeight.w400,fontFamily: 'Raleway',color: Color(0xFF339D44),),),
                ),)
              ],
            )
        
        
        
          ],
        ),

    );
  }
}
