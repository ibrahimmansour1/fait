import 'package:fait/source/views/home/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../../utils/size_utils.dart';
import '../providers/theme/theme_provider.dart';
import '../theme/theme_helper.dart';

class LoadingScreen extends ConsumerStatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends ConsumerState<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    navigateToHomeScreenAfterDelay();
  }

  void navigateToHomeScreenAfterDelay() {
    Future.delayed(const Duration(seconds: 10), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeView()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeHelper = ref.watch(themeNotifierProvider);
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      body: Container(
        width: mediaQueryData.size.width,
        height: mediaQueryData.size.height,
        decoration: BoxDecoration(
          color: themeHelper.getThemeData().colorScheme.background,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 100.v,
            ),
            Center(
              child: LoadingAnimationWidget.dotsTriangle(
                color: theme.colorScheme.tertiary,
                size: 200,
              ),
            ),
            SizedBox(
              height: 150.v,
            ),
            Text(
              'Wait',
              style: TextStyle(
                color: theme.colorScheme.tertiary,
                fontSize: 35,
              ),
            ),
            SizedBox(
              height: 20.v,
            ),
            Text(
              'Your Programs Are Generating',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: theme.colorScheme.tertiary,
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
