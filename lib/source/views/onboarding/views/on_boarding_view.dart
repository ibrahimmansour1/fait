import 'package:fait/source/views/onboarding/widgets/onboarding_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../utils/constants.dart';
import '../../../providers/register/user_provider.dart';

class MainOnboardingScreen extends ConsumerStatefulWidget {
  const MainOnboardingScreen({super.key});

  @override
  ConsumerState<MainOnboardingScreen> createState() =>
      _MainOnboardingScreenState();
}

class _MainOnboardingScreenState extends ConsumerState<MainOnboardingScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref
          .read(userProvider)
          .login(username, password, deviceToken: deviceToken);
    });
    super.initState();
  }

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
