// import 'package:flutter/material.dart';
// import 'package:mohammed_mamdouh_s_application3/core/app_export.dart';
// import 'package:mohammed_mamdouh_s_application3/presentation/notifcations_page/notifcations_page.dart';
// import 'package:mohammed_mamdouh_s_application3/presentation/profile_page/profile_page.dart';
// import 'package:mohammed_mamdouh_s_application3/presentation/workout_active_page/workout_active_page.dart';
// import 'package:mohammed_mamdouh_s_application3/widgets/app_bar/appbar_leading_image.dart';
// import 'package:mohammed_mamdouh_s_application3/widgets/app_bar/custom_app_bar.dart';
// import 'package:mohammed_mamdouh_s_application3/widgets/custom_bottom_bar.dart';

// class WorkoutActiveTabContainerScreen extends StatefulWidget {
//   const WorkoutActiveTabContainerScreen({Key? key}) : super(key: key);

//   @override
//   WorkoutActiveTabContainerScreenState createState() =>
//       WorkoutActiveTabContainerScreenState();
// }

// // ignore_for_file: must_be_immutable
// class WorkoutActiveTabContainerScreenState
//     extends State<WorkoutActiveTabContainerScreen>
//     with TickerProviderStateMixin {
//   late TabController tabviewController;

//   GlobalKey<NavigatorState> navigatorKey = GlobalKey();

//   @override
//   void initState() {
//     super.initState();
//     tabviewController = TabController(length: 3, vsync: this);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//         child: Scaffold(
//             appBar: _buildAppBar(context),
//             body: SizedBox(
//                 width: double.maxFinite,
//                 child: Column(children: [
//                   SizedBox(height: 36.v),
//                   Expanded(
//                       child: SingleChildScrollView(
//                           child: Column(children: [
//                     _buildTitleDate(context),
//                     SizedBox(height: 31.v),
//                     _buildTabview(context),
//                     SizedBox(
//                         height: 549.v,
//                         child: TabBarView(
//                             controller: tabviewController,
//                             children: [
//                               WorkoutActivePage(),
//                               WorkoutActivePage(),
//                               WorkoutActivePage()
//                             ]))
//                   ])))
//                 ])),
//             bottomNavigationBar: _buildBottomBar(context)));
//   }

//   /// Section Widget
//   PreferredSizeWidget _buildAppBar(BuildContext context) {
//     return CustomAppBar(
//         leadingWidth: double.maxFinite,
//         leading: AppbarLeadingImage(
//             imagePath: ImageConstant.imgArrowLeft,
//             margin: EdgeInsets.fromLTRB(32.h, 16.v, 380.h, 16.v),
//             onTap: () {
//               onTapArrowLeft(context);
//             }));
//   }

//   /// Section Widget
//   Widget _buildTitleDate(BuildContext context) {
//     return Padding(
//         padding: EdgeInsets.only(left: 32.h, right: 39.h),
//         child: Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Padding(
//                   padding: EdgeInsets.only(top: 2.v),
//                   child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         RichText(
//                             text: TextSpan(children: [
//                               TextSpan(
//                                   text: "Build",
//                                   style: theme.textTheme.displayMedium),
//                               TextSpan(text: " ")
//                             ]),
//                             textAlign: TextAlign.left),
//                         SizedBox(height: 14.v),
//                         Text("your body",
//                             style: CustomTextStyles
//                                 .displayMediumOnPrimaryContainerRegular)
//                       ])),
//               Spacer(),
//               SizedBox(
//                   height: 99.v,
//                   child: VerticalDivider(
//                       width: 2.h,
//                       thickness: 2.v,
//                       indent: 5.h,
//                       endIndent: 45.h)),
//               Padding(
//                   padding: EdgeInsets.only(left: 19.h, bottom: 42.v),
//                   child: Column(children: [
//                     Text("AUG",
//                         style: CustomTextStyles.bodyLargeOnPrimaryContainer_2),
//                     SizedBox(height: 1.v),
//                     Text("21-25", style: CustomTextStyles.headlineLargeRegular)
//                   ]))
//             ]));
//   }

//   /// Section Widget
//   Widget _buildTabview(BuildContext context) {
//     return Container(
//         height: 48.v,
//         width: 367.h,
//         child: TabBar(
//             controller: tabviewController,
//             labelPadding: EdgeInsets.zero,
//             labelColor: theme.colorScheme.onPrimaryContainer.withOpacity(1),
//             labelStyle: TextStyle(
//                 fontSize: 20.fSize,
//                 fontFamily: 'Roboto',
//                 fontWeight: FontWeight.w600),
//             unselectedLabelColor:
//                 theme.colorScheme.onPrimaryContainer.withOpacity(1),
//             unselectedLabelStyle: TextStyle(
//                 fontSize: 20.fSize,
//                 fontFamily: 'Roboto',
//                 fontWeight: FontWeight.w600),
//             indicator: BoxDecoration(
//                 color: theme.colorScheme.primary,
//                 borderRadius: BorderRadius.circular(8.h)),
//             tabs: [
//               Tab(child: Text("Overview")),
//               Tab(child: Text("Workout")),
//               Tab(child: Text("Muscles"))
//             ]));
//   }

//   /// Section Widget
//   Widget _buildBottomBar(BuildContext context) {
//     return CustomBottomBar(onChanged: (BottomBarEnum type) {
//       Navigator.pushNamed(navigatorKey.currentContext!, getCurrentRoute(type));
//     });
//   }

//   ///Handling route based on bottom click actions
//   String getCurrentRoute(BottomBarEnum type) {
//     switch (type) {
//       case BottomBarEnum.Refresh32x32:
//         return AppRoutes.profilePage;
//       case BottomBarEnum.Vectoricon:
//         return "/";
//       case BottomBarEnum.Image13removebgpreview:
//         return "/";
//       case BottomBarEnum.Notifyicon:
//         return AppRoutes.notifcationsPage;
//       default:
//         return "/";
//     }
//   }

//   ///Handling page based on route
//   Widget getCurrentPage(String currentRoute) {
//     switch (currentRoute) {
//       case AppRoutes.profilePage:
//         return ProfilePage();
//       case AppRoutes.notifcationsPage:
//         return NotifcationsPage();
//       default:
//         return DefaultWidget();
//     }
//   }

//   /// Navigates back to the previous screen.
//   onTapArrowLeft(BuildContext context) {
//     Navigator.pop(context);
//   }
// }
