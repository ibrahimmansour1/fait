import 'package:fait/source/views/register/views/sign_up_methods_screen.dart';
import 'package:fait/utils/size_utils.dart';
import 'package:fait/utils/transitions/Fade_transition.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

final onboardingController = PageController();

class OnboardingScreenWidget extends StatelessWidget {
  final int index;

  OnboardingScreenWidget(this.index, {super.key});
  final List<String> imagesList = [
    'assets/images/on_boarding_1.png',
    'assets/images/on_boarding_2.png',
    'assets/images/on_boarding_3.png',
  ];
  final List<String> titlesList = [
    'Join the movement',
    'Push your Limits',
    'The future is yours',
  ];
  final List<String> descriptionsList = [
    'Save your progress in one application Track your fitness level.',
    'Let our AI trainer be your virtual companion in achieving your fitness aspirations.',
    'FAIT Your fellow in the journey to be fully fit Just DO IT !\n 🇫🇷 FAIT\n 🇬🇧 DOIT',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFF131B28), Color(0xFF274255)],
        ),
      ),
      child: Stack(
        children: [
          Image.asset(
            imagesList[index],
            fit: BoxFit.cover,
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.6,
          ),
          Column(
            children: [
              const Spacer(),
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.4,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xFF131B28), Color(0xFF274255)],
                  ),
                  border: Border(
                    top: BorderSide(
                      color: Color(
                          0xff17D1E0), // Replace with your desired border color
                      width: 4.0, // Replace with your desired border width
                    ),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ListView(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 12.h,
                      ),
                      Text(
                        titlesList[index],
                        textAlign: TextAlign.start,
                        style: const TextStyle(
                          fontSize: 42,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          height: 1.1,
                        ),
                      ),
                      SizedBox(height: 12.h),
                      Text(
                        descriptionsList[index],
                        textAlign: TextAlign.start,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),

                      // // SizedBox(height: 32.h),
                      // SizedBox(height: 50.h),
                      // Center(
                      //   child: SmoothPageIndicator(
                      //     controller: onboardingController,
                      //     count: 3,
                      //     onDotClicked: (index) {
                      //       onboardingController.animateToPage(
                      //         index,
                      //         duration: const Duration(milliseconds: 500),
                      //         curve: Curves.ease,
                      //       );
                      //     },
                      //     effect: const WormEffect(
                      //         activeDotColor: Color(0xff17D1E0)),
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 40.0.adaptSize,
            left: 16.0.adaptSize,
            right: 16.0.adaptSize,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  // END: be15d9bcejpp
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () {
                if (index == 2) {
                  Navigator.push(
                    context,
                    FadePageRouteBuilder(
                      page: const SignUpMethodsScreen(),
                      duration: const Duration(milliseconds: 800),
                    ),
                  );
                } else {
                  onboardingController.nextPage(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.ease);
                }
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  index == 2 ? 'Get Started' : 'Next',
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 120.0.adaptSize,
            left: 0.0.adaptSize,
            right: 0.0.adaptSize,
            child: Center(
              child: SmoothPageIndicator(
                controller: onboardingController,
                count: 3,
                onDotClicked: (index) {
                  onboardingController.animateToPage(
                    index,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.ease,
                  );
                },
                effect: const WormEffect(
                  activeDotColor: Color(0xff17D1E0),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
