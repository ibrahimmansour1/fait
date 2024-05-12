import 'package:fait/source/views/diet/widgets/recipe_card_widget.dart';
import 'package:fait/utils/app_export.dart';
import 'package:flutter/material.dart';

import 'recipe_info_screen.dart';

class RecipesResultsScreen extends StatelessWidget {
  const RecipesResultsScreen({Key? key}) : super(key: key);

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
                      child: Text(
                        "Results",
                        style: CustomTextStyles.titleLargeBold
                            .copyWith(fontSize: 24.fSize),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                  width: double.maxFinite,
                  padding:
                      EdgeInsets.symmetric(horizontal: 30.h, vertical: 22.v),
                  child: Column(children: [
                    ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) => RecipeCardWidget(
                              onTap: () {
                                showModalBottomSheet(
                                    context: context,
                                    useRootNavigator: true,
                                    isScrollControlled: true,
                                    builder: (_) => const RecipeInfoScreen());
                              },
                            ),
                        separatorBuilder: (context, index) =>
                            SizedBox(height: 32.v),
                        itemCount: 5),
                  ])),
            ],
          ),
        ),
      ),
    );
  }
}
