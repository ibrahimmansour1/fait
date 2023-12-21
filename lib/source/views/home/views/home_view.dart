import 'package:fait/source/widgets/custom_bottom_bar.dart';
import 'package:fait/utils/size_utils.dart';
import 'package:flutter/material.dart';

import 'nav_bar_screens/home_screen.dart';
import 'nav_bar_screens/notifcations_screen.dart';

// ignore_for_file: must_be_immutable
class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            body: Navigator(
                key: navigatorKey,
                initialRoute: '/home',
                onGenerateRoute: (routeSetting) => PageRouteBuilder(
                    pageBuilder: (ctx, ani, ani1) =>
                        getCurrentPage(routeSetting.name!),
                    transitionDuration: const Duration(seconds: 0))),
            bottomNavigationBar: _buildBottomBar(context)));
  }

  /// Section Widget
  Widget _buildBottomBar(BuildContext context) {
    return CustomBottomBar(onChanged: (BottomBarEnum type) {
      Navigator.pushNamed(navigatorKey.currentContext!, getCurrentRoute(type));
    });
  }

  ///Handling route based on bottom click actions
  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.profile:
        return '/';
      case BottomBarEnum.fitness:
        return "/";
      case BottomBarEnum.home:
        return "/home";
      case BottomBarEnum.diet:
        return "/";
      case BottomBarEnum.notifications:
        return '/notifications';
      default:
        return "/";
    }
  }

  ///Handling page based on route
  Widget getCurrentPage(String currentRoute) {
    switch (currentRoute) {
      case '/home':
        return const HomeScreen();
      case '/notifications':
        return const NotifcationsScreen();
      default:
        return const DefaultWidget();
    }
  }
}
