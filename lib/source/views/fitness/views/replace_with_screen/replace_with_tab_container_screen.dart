import 'package:fait/utils/app_export.dart';
import 'package:flutter/material.dart';
import 'replace_with_liked_page.dart';

class ReplaceWithTabContainerScreen extends StatefulWidget {
  const ReplaceWithTabContainerScreen({Key? key}) : super(key: key);

  @override
  ReplaceWithTabContainerScreenState createState() =>
      ReplaceWithTabContainerScreenState();
}

// ignore_for_file: must_be_immutable
class ReplaceWithTabContainerScreenState
    extends State<ReplaceWithTabContainerScreen> with TickerProviderStateMixin {
  late TabController tabviewController;

  @override
  void initState() {
    super.initState();
    tabviewController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        decoration: AppDecoration.fillBlueGray.copyWith(
            borderRadius: BorderRadiusStyle.roundedBorder22
                .copyWith(bottomLeft: Radius.zero, bottomRight: Radius.zero)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Stack(
                children: [
                  Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(
                        Icons.arrow_back_ios_new,
                        color: Colors.white,
                        size: 24,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10.v),
                    child: Align(
                      alignment: AlignmentDirectional.center,
                      child: RichText(
                          text: TextSpan(children: [
                            TextSpan(
                                text: "Replace",
                                style: CustomTextStyles.displayMediumBold),
                            const TextSpan(text: " "),
                            TextSpan(
                                text: "with",
                                style: CustomTextStyles.displayMediumbfffffff)
                          ]),
                          textAlign: TextAlign.left),
                    ),
                  ),
                ],
              ),
              Padding(
                  padding: EdgeInsets.only(top: 45.v),
                  child: Column(children: [
                    _buildTabview(context),
                    SizedBox(
                        height: mediaQueryData.size.height * 0.7,
                        child: TabBarView(
                            controller: tabviewController,
                            children: const [
                              ReplaceWithLikedPage(),
                              ReplaceWithLikedPage(),
                              ReplaceWithLikedPage()
                            ]))
                  ])),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildTabview(BuildContext context) {
    return SizedBox(
        height: 48.v,
        width: 396.h,
        child: Theme(
          data: ThemeData(useMaterial3: false),
          child: TabBar(
              controller: tabviewController,
              labelPadding: EdgeInsets.zero,
              labelColor: theme.colorScheme.onPrimaryContainer.withOpacity(1),
              labelStyle: TextStyle(
                  fontSize: 20.fSize,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w600),
              unselectedLabelColor:
                  theme.colorScheme.onPrimaryContainer.withOpacity(1),
              unselectedLabelStyle: TextStyle(
                  fontSize: 20.fSize,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w600),
              indicator: BoxDecoration(
                  color: theme.colorScheme.primary,
                  borderRadius: BorderRadius.circular(8.h)),
              tabs: const [
                Tab(child: Text("Liked")),
                Tab(child: Text("Recent")),
                Tab(child: Text("Recommended"))
              ]),
        ));
  }
}
