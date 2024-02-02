import 'package:fait/source/widgets/exercise_card_widget.dart';
import 'package:flutter/material.dart';

import '../../../../../utils/app_export.dart';

class ReplaceWithLikedPage extends StatefulWidget {
  const ReplaceWithLikedPage({Key? key}) : super(key: key);

  @override
  ReplaceWithLikedPageState createState() => ReplaceWithLikedPageState();
}

class ReplaceWithLikedPageState extends State<ReplaceWithLikedPage>
    with AutomaticKeepAliveClientMixin<ReplaceWithLikedPage> {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SingleChildScrollView(
      child: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(horizontal: 30.h, vertical: 22.v),
          child: Column(children: [
            ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => ExerciseCardWidget(
                      replacable: false,
                    ),
                separatorBuilder: (context, index) => SizedBox(height: 32.v),
                itemCount: 5),
          ])),
    );
  }
}
