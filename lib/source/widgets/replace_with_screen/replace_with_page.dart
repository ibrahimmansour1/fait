import 'package:fait/source/views/diet/widgets/dietcards_item_widget.dart';
import 'package:fait/source/views/fitness/widgets/exercise_card_widget.dart';
import 'package:fait/source/views/fitness/widgets/in_progress_exercise_card_widget.dart';
import 'package:flutter/material.dart';

import '../../../utils/app_export.dart';

class ReplaceWithPage extends StatefulWidget {
  final bool inProgressExercise;
  final bool isDiet;
  const ReplaceWithPage(
      {Key? key, this.inProgressExercise = false, this.isDiet = false})
      : super(key: key);

  @override
  ReplaceWithPageState createState() => ReplaceWithPageState();
}

class ReplaceWithPageState extends State<ReplaceWithPage>
    with AutomaticKeepAliveClientMixin<ReplaceWithPage> {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SingleChildScrollView(
      child: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(horizontal: 30.h, vertical: 22.v),
          child: Container(
            decoration: widget.isDiet
                ? AppDecoration.outlinePrimary2.copyWith(
                    border: const Border.fromBorderSide(BorderSide.none))
                : null,
            padding: widget.isDiet
                ? EdgeInsets.symmetric(horizontal: 20.h, vertical: 20.v)
                : null,
            child: Column(children: [
              ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    if (widget.isDiet) {
                      return DietcardsItemWidget(
                        replacable: false,
                      );
                    } else {
                      return widget.inProgressExercise
                          ? InProgressExerciseCardWidget(
                              replacable: false,
                            )
                          : ExerciseCardWidget(
                              replacable: false,
                            );
                    }
                  },
                  separatorBuilder: (context, index) => SizedBox(height: 32.v),
                  itemCount: 5),
            ]),
          )),
    );
  }
}
