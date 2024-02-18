
import 'package:fait/utils/size_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExercisesProgramWidget extends StatelessWidget {
  const ExercisesProgramWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20.h),
        Text(
          'My Program',
          style: TextStyle(
            fontSize: 32.fSize,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 20),
        Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                "https://www.eatthis.com/wp-content/uploads/sites/4/2023/04/muscular-man-lifting-weights-1.jpg?quality=82&strip=1",
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(
                            '5 Workout',
                            style: TextStyle(
                              fontSize: 20.fSize,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            '15 Exercise',
                            style: TextStyle(
                              fontSize: 18.fSize,
                              color: Colors.white.withOpacity(0.75),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 160.h),
                      const CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.menu_rounded,
                          color: Colors.black,
                        ),
                      )
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(height: 10.h),
                      const Icon(
                        CupertinoIcons.heart,
                        color: Colors.white,
                      ),
                      SizedBox(height: 160.h),
                      Container(
                        decoration: BoxDecoration(
                            color: const Color(0xff17D1E0),
                            borderRadius: BorderRadius.circular(35)),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            children: [
                              Text(
                                'Start',
                                style: TextStyle(
                                  fontSize: 20.fSize,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                              const Icon(
                                (Icons.arrow_forward_ios_rounded),
                                color: Colors.white,
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
