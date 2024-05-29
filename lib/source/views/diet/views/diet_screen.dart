import 'package:fait/source/views/diet/views/bookmark_screen.dart';
import 'package:fait/source/views/fitness/views/exercises_favourites_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../utils/app_export.dart';
import '../../../../utils/transitions/fade_transition.dart';
import '../../../widgets/custom_search_view.dart';
import '../../../widgets/info_popup.dart';
import '../widgets/diet_program_widget.dart';
import '../widgets/recipe_card_widget.dart';
import '../widgets/recipes_widget.dart';
import 'recipe_info_screen.dart';
import 'recipes_filter_screen.dart';

class DietScreen extends StatelessWidget {
  DietScreen({super.key});

  final TextEditingController searchController = TextEditingController();
  final isProgramsTabProvider = StateProvider<bool>((ref) {
    return false;
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          forceMaterialTransparency: true,
          iconTheme: const IconThemeData(color: Colors.white),
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new),
            onPressed: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/home');
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Consumer(
            builder: (context, ref, child) {
              bool isProgramsTab = ref.watch(isProgramsTabProvider);
              return Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          isProgramsTab ? 'Diet Program' : 'Select Recipes',
                          style: TextStyle(
                            fontSize: 32.fSize,
                            color: Colors.white,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            if (isProgramsTab) {
                              showCupertinoModalPopup(
                                  context: context,
                                  builder: (context) => Padding(
                                        padding: EdgeInsets.only(
                                            bottom:
                                                mediaQueryData.size.height / 2 -
                                                    50.v),
                                        child: const InfoPopup(
                                            infoText:
                                                'Add program manually, Coming Soon...'),
                                      ));
                            } else {
                              Navigator.push(
                                context,
                                FadePageRouteBuilder(
                                  page: const BookmarkScreen(),
                                  duration: const Duration(milliseconds: 800),
                                ),
                              );
                            }
                          },
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              SvgPicture.asset(
                                isProgramsTab
                                    ? 'assets/images/hexapolygon.svg'
                                    : 'assets/images/favorite_hexa_icon.svg',
                                width: 64.h,
                                height: 64.v,
                              ),
                              Icon(Icons.add_rounded,
                                  color: Colors.white, size: 32.fSize),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 50.v),
                    DefaultTabController(
                      length: 2,
                      child: Builder(
                        builder: (BuildContext context) {
                          final tabController =
                              DefaultTabController.of(context);
                          return Column(
                            children: [
                              TabBar(
                                controller: tabController,
                                onTap: (index) {
                                  tabController.animateTo(index);

                                  ref
                                      .watch(isProgramsTabProvider.notifier)
                                      .update(
                                          (state) => index == 1 ? true : false);
                                },
                                dividerHeight: 0,
                                indicator: AppDecoration.fillPrimary.copyWith(
                                    borderRadius:
                                        BorderRadiusStyle.roundedBorder22),
                                tabs: [
                                  Tab(
                                    height: 72.v,
                                    child: Container(
                                      decoration: isProgramsTab
                                          ? AppDecoration.fillBluegray80004
                                              .copyWith(
                                              borderRadius: BorderRadiusStyle
                                                  .roundedBorder22,
                                            )
                                          : null,
                                      child: Center(
                                        child: Text(
                                          'Recipes',
                                          style: CustomTextStyles
                                              .headlineSmallRoboto
                                              .copyWith(
                                                  fontWeight:
                                                      FontWeight.normal),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Tab(
                                    height: 72.v,
                                    child: Container(
                                      decoration: !isProgramsTab
                                          ? AppDecoration.fillBluegray80004
                                              .copyWith(
                                              borderRadius: BorderRadiusStyle
                                                  .roundedBorder22,
                                            )
                                          : null,
                                      child: Center(
                                        child: Text(
                                          'Programs',
                                          style: CustomTextStyles
                                              .headlineSmallRoboto
                                              .copyWith(
                                                  fontWeight:
                                                      FontWeight.normal),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 30.v,
                              ),
                              Divider(
                                color: theme.colorScheme.primary,
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.7,
                                child: TabBarView(
                                  physics: const NeverScrollableScrollPhysics(),
                                  controller: tabController,
                                  children: [
                                    RecipesWidget(searchController: searchController),
                                    const DietProgramWidget(),
                                  ],
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
