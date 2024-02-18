import 'package:fait/utils/size_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../widget/exercises_program_widget.dart';

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
        ),
        body: Padding(
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
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/images/hexapolygon.svg',
                        width: 64.h,
                        height: 64.v,
                      ),
                      Icon(Icons.add_rounded,
                          color: Colors.white, size: 32.fSize),
                    ],
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
                                        width:
                                            MediaQuery.of(context).size.width *
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
                                        Icons.sort,
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
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xff353767),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                      "https://www.healthdigest.com/img/gallery/the-male-celebrity-workout-routine-people-are-most-likely-to-try-exclusive-survey/intro-1663175120.jpg",
                      fit: BoxFit.cover,
                      height: 90.v,
                      width: 90.h,
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.65,
                    child: ListTile(
                      title: Text(
                        'Chest',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24.fSize,
                        ),
                      ),
                      subtitle: Text(
                        '5 Exercises',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.fSize,
                        ),
                      ),
                      trailing: const Icon(
                        Icons.favorite_outline_rounded,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
