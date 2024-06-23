import 'package:fait/source/views/fitness/views/fitness_screen.dart';
import 'package:fait/source/views/home/views/nav_bar_screens/profile_screen.dart';
import 'package:fait/source/widgets/custom_bottom_bar.dart';
import 'package:fait/utils/size_utils.dart';
import 'package:flutter/material.dart';

import '../../diet/views/diet_screen.dart';
import '../../gemini_chat/gemini_chat_screen.dart';
import 'nav_bar_screens/home_screen.dart';
import 'nav_bar_screens/notifcations_screen.dart';

// ignore_for_file: must_be_immutable
class HomeView extends StatefulWidget {
  const HomeView({Key? key, this.pageIndex}) : super(key: key);

  final int? pageIndex;

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  // GlobalKey<NavigatorState> navigatorKey = GlobalKey();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  late PageController _pageController;
  // late int _currentIndex;
  final List<Widget> _pages = [
    const HomeScreen(),
    const NotifcationsScreen(),
    FitnessScreen(),
    const ProfileScreen(),
    DietScreen(),
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: widget.pageIndex ?? 0);
    // _currentIndex = widget.pageIndex ?? 0;
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Image.asset('assets/icons/gpt-robot.png'),
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const GeminiChatScreen(),
            ),
          ),
        ),
        key: _scaffoldKey,
        drawer: Container(),
        bottomNavigationBar: _buildBottomBar(context),
        body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: _pageController,
          children: _pages,
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildBottomBar(BuildContext context) {
    return CustomBottomBar(onChanged: (BottomBarEnum type) {
      // setState(() {
      //         _currentIndex = index;
      //       });
      _pageController.jumpToPage(getCurrentindex(type));
    });
  }

  ///Handling route based on bottom click actions
  int getCurrentindex(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.notifications:
        return 1;

      case BottomBarEnum.profile:
        return 3;

      case BottomBarEnum.fitness:
        return 2;

      case BottomBarEnum.diet:
        return 4;

      case BottomBarEnum.home:
      default:
        return 0;
    }
  }

  ///Handling page based on route
  // Widget getCurrentPage(String currentRoute) {
  //   switch (currentRoute) {
  //     case '/home':
  //       return const HomeScreen();
  //     case '/notifications':
  //       return const NotifcationsScreen();
  //     case '/profile':
  //       return const ProfileScreen();
  //     case '/fitness':
  //       return const FitnessScreen();
  //     default:
  //       return const DefaultWidget();
  //   }
  // }
}
