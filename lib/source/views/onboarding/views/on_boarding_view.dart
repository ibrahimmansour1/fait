import 'package:fait/source/views/onboarding/widgets/onboarding_item_widget.dart';
import 'package:flutter/material.dart';

class MainOnboardingScreen extends StatelessWidget {
  const MainOnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final getStartedButton = TextButton(
      onPressed: () {
        Navigator.pushNamed(context, '/on_boarding_screen');
      },
      child: const Text(
        'Get Started',
        style: TextStyle(color: Colors.white),
      ),
    );
    final screens = [
      OnboardingScreenWidget(0),
      OnboardingScreenWidget(1),
      OnboardingScreenWidget(2),
    ];

    return SafeArea(
      child: Scaffold(
        body: PageView(
          controller: onboardingController,
          children: screens,
        ),
      ),
    );
  }
}
