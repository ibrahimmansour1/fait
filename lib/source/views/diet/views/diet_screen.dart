import 'package:fait/source/views/fitness/views/exercise_info_screen.dart';
import 'package:fait/source/views/fitness/views/exercises_favourites_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../utils/app_export.dart';
import '../../../widgets/custom_search_view.dart';
import '../../../widgets/info_popup.dart';
import '../widgets/diet_program_widget.dart';
import '../widgets/recipe_card_widget.dart';
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
                              showModalBottomSheet(
                                  context: context,
                                  useRootNavigator: true,
                                  isScrollControlled: true,
                                  builder: (_) =>
                                      const ExercisesFavouritesScreen()); // TODO: Navigate to recipes fav screen
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
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(height: 20.h),
                                        Row(
                                          children: [
                                            Expanded(
                                                child: CustomSearchView(
                                                    autofocus: false,
                                                    controller:
                                                        searchController,
                                                    hintText: "Search")),
                                            const SizedBox(width: 8),
                                            InkWell(
                                              onTap: () {
                                                showModalBottomSheet(
                                                    context: context,
                                                    useRootNavigator: true,
                                                    isScrollControlled: true,
                                                    builder:
                                                        (context) => Padding(
                                                              padding: EdgeInsets.only(
                                                                  bottom: MediaQuery.of(
                                                                          context)
                                                                      .viewInsets
                                                                      .bottom),
                                                              child:
                                                                  RecipesFilterScreen(),
                                                            ));
                                              },
                                              child: const Icon(
                                                Icons.filter_alt_rounded,
                                                color: Colors.white,
                                              ),
                                            )
                                          ],
                                        ),
                                        SizedBox(height: 20.h),
                                        Text("Recipes",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 32.fSize,
                                            )),
                                        SizedBox(height: 20.h),
                                        const RecipeItemWidget(),
                                      ],
                                    ),
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

class RecipeItemWidget extends StatelessWidget {
  const RecipeItemWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 6,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: RecipeCardWidget(
            onTap: () {
              showModalBottomSheet(
                  context: context,
                  useRootNavigator: true,
                  isScrollControlled: true,
                  builder: (_) => ExerciseInfoScreen(
                        tryIt: true,
                      )); // TODO: Navigate to recipes info screen
            },
          ),
        ),
      ),
    );
  }
}
