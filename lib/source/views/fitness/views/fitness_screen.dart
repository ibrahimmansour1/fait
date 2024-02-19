import 'package:fait/source/views/fitness/views/exercise_info_screen.dart';
import 'package:fait/source/views/fitness/views/favourites_screen.dart';
import 'package:fait/source/views/fitness/widgets/exercise_card_widget.dart';
import 'package:fait/utils/size_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../widgets/exercises_program_widget.dart';

class FitnessScreen extends StatelessWidget {
  const FitnessScreen({super.key});

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
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Exercise Program',
                      style: TextStyle(
                        fontSize: 32.fSize,
                        color: Colors.white,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        showModalBottomSheet(
                            context: context,
                            useRootNavigator: true,
                            isScrollControlled: true,
                            builder: (_) => const FavouritesScreen());
                      },
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          SvgPicture.asset(
                            // 'assets/images/hexapolygon.svg',
                            'assets/images/favorite_hexa_icon.svg',
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
                const SizedBox(height: 16),
                DefaultTabController(
                  length: 2,
                  child: Builder(
                    builder: (BuildContext context) {
                      final TabController tabController =
                          DefaultTabController.of(context);
                      return Column(
                        children: [
                          TabBar(
                            onTap: (index) {
                              tabController.animateTo(index);
                            },
                            dividerHeight: 0,
                            indicator: BoxDecoration(
                              color: const Color(0xff17D1E0),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            tabs: [
                              Tab(
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: const Center(
                                    child: Text(
                                      'Exercises',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Tab(
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: const Center(
                                    child: Text(
                                      'Programs',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.7,
                            child: TabBarView(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 20.h),
                                    Row(
                                      children: [
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.8,
                                          decoration: BoxDecoration(
                                            color: Colors.grey,
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(children: [
                                              const Icon(
                                                Icons.search_rounded,
                                                color: Colors.black,
                                              ),
                                              SizedBox(width: 8.v),
                                              Text("Search",
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 20.fSize,
                                                  )),
                                            ]),
                                          ),
                                        ),
                                        const SizedBox(width: 8),
                                        const Icon(
                                          Icons.filter_alt_rounded,
                                          color: Colors.white,
                                        )
                                      ],
                                    ),
                                    SizedBox(height: 20.h),
                                    Text("Exercises",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 32.fSize,
                                        )),
                                    SizedBox(height: 20.h),
                                    const ExerciseItemWidget(),
                                  ],
                                ),
                                const ExercisesProgramWidget(),
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
          ),
        ),
      ),
    );
  }
}

class ExerciseItemWidget extends StatelessWidget {
  const ExerciseItemWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 6,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: ExerciseCardWidget(
            replacable: false,
            onTap: () {
              showModalBottomSheet(
                  context: context,
                  useRootNavigator: true,
                  isScrollControlled: true,
                  builder: (_) => ExerciseInfoScreen(
                        tryIt: true,
                      ));
            },
          ),
        ),
      ),
    );
  }
}
