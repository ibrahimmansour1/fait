import 'package:fait/source/views/home/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../utils/size_utils.dart';
import 'home/views/nav_bar_screens/home_screen.dart'; // Import the home screen

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    navigateToHomeScreenAfterDelay(); // Call the method to navigate after delay
  }

  void navigateToHomeScreenAfterDelay() {
    Future.delayed(const Duration(seconds: 10), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) =>
                const HomeView()), // Replace HomeScreen with your actual home screen widget
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      body: Container(
        width: mediaQueryData.size.width,
        height: mediaQueryData.size.height,
        decoration: const BoxDecoration(color: Color(0xFF282B4C)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 100.v,
            ),
            Center(
              child: LoadingAnimationWidget.dotsTriangle(
                color: Colors.white,
                size: 200,
              ),
            ),
            SizedBox(
              height: 150.v,
            ),
            const Text(
              'Wait',
              style: TextStyle(
                color: Colors.white,
                fontSize: 35,
              ),
            ),
            SizedBox(
              height: 20.v,
            ),
            const Text(
              'Your Programs Are Generating',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
