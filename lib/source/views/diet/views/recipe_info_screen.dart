import 'package:animated_read_more_text/animated_read_more_text.dart';
import 'package:fait/source/views/diet/widgets/content4_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:fait/utils/app_export.dart';
import 'package:percent_indicator/percent_indicator.dart';

class RecipeInfoScreen extends StatelessWidget {
  const RecipeInfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String textForPreparation = """
1- Toss 2 cups berries with sugar.Let stand for 45 minutes, stirring occasionally

2-Transfer berry-sugar mixture to food processor

3- Add yogurt and lemon juice

4- Process until smooth

5- Transfer to a serving dish""";
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: double.maxFinite,
          child: SingleChildScrollView(
            child: Column(
              children: [
                _buildTopPart(context),
                _buildTextAndColorContent(context,
                    color: appTheme.blueA40002, text: "Protein", textG: "4 g"),
                _buildTextAndColorContent(context,
                    color: appTheme.orange300, text: "Carbs", textG: "44 g"),
                Padding(
                    padding: EdgeInsets.only(left: 32.h, right: 20.h),
                    child: _buildTextContent(context,
                        protein: "Fibers", weight: "4 g")),
                Padding(
                    padding: EdgeInsets.only(left: 32.h, right: 20.h),
                    child: _buildTextContent(context,
                        protein: "Sugars", weight: "40 g")),
                _buildTextAndColorContent(context,
                    color: theme.colorScheme.primary,
                    text: "Fats",
                    textG: "2 g"),
                Padding(
                    padding: EdgeInsets.only(left: 32.h, right: 20.h),
                    child: _buildTextContent(context,
                        protein: "Saturated Fat", weight: "1.2 g")),
                Padding(
                    padding: EdgeInsets.only(left: 32.h, right: 20.h),
                    child: _buildTextContent(context,
                        protein: "unSaturated Fat", weight: "0.8 g")),
                SizedBox(height: 33.v),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 32.h),
                    child: Row(
                      children: [
                        Text("Recipe Category",
                            style: CustomTextStyles.titleMediumMedium18),
                        Padding(
                          padding: EdgeInsets.only(left: 16.h),
                          child: Text("Prepration time ",
                              style: CustomTextStyles.titleMediumMedium18),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 13.v),
                _buildContentButton(context),
                SizedBox(height: 15.v),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 32.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Cook time ",
                            style: CustomTextStyles.titleMediumMedium18),
                        SizedBox(height: 15.v),
                        const Content4ItemWidget(
                          text: "25 Minutes",
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 27.v),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                        padding: EdgeInsets.only(left: 32.h),
                        child: Text("Recipe Ingredients",
                            style: CustomTextStyles.titleMediumMedium18))),
                SizedBox(height: 27.v),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                        padding: EdgeInsets.only(left: 32.h),
                        child: Row(children: [
                          SizedBox(
                              width: 118.h,
                              child: Row(children: [
                                Container(
                                    height: 8.adaptSize,
                                    width: 8.adaptSize,
                                    margin: EdgeInsets.symmetric(vertical: 5.v),
                                    decoration: BoxDecoration(
                                        color: appTheme.gray10001,
                                        borderRadius:
                                            BorderRadius.circular(4.h))),
                                Padding(
                                    padding: EdgeInsets.only(left: 14.h),
                                    child: Text("4 blueberries",
                                        style: CustomTextStyles
                                            .bodyLargeOnPrimaryContainer_3))
                              ])),
                          Container(
                              width: 122.h,
                              margin: EdgeInsets.only(left: 23.h),
                              child: Row(children: [
                                Container(
                                    height: 8.adaptSize,
                                    width: 8.adaptSize,
                                    margin: EdgeInsets.symmetric(vertical: 5.v),
                                    decoration: BoxDecoration(
                                        color: appTheme.gray10001,
                                        borderRadius:
                                            BorderRadius.circular(4.h))),
                                Padding(
                                    padding: EdgeInsets.only(left: 14.h),
                                    child: Text("A quarter cup",
                                        style: CustomTextStyles
                                            .bodyLargeOnPrimaryContainer_3))
                              ]))
                        ]))),
                SizedBox(height: 8.v),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 32.h, right: 50.h),
                    child: Row(
                      children: [
                        SizedBox(
                            width: 136.h,
                            child: Row(children: [
                              Container(
                                  height: 8.adaptSize,
                                  width: 8.adaptSize,
                                  margin: EdgeInsets.symmetric(vertical: 5.v),
                                  decoration: BoxDecoration(
                                      color: appTheme.gray10001,
                                      borderRadius:
                                          BorderRadius.circular(4.h))),
                              Padding(
                                  padding: EdgeInsets.only(left: 14.h),
                                  child: Text("1 vanilla yogart",
                                      style: CustomTextStyles
                                          .bodyLargeOnPrimaryContainer_3))
                            ])),
                        Container(
                          width: 176.h,
                          margin: EdgeInsets.only(left: 8.h),
                          child: Row(
                            children: [
                              Container(
                                  height: 8.adaptSize,
                                  width: 8.adaptSize,
                                  margin: EdgeInsets.symmetric(vertical: 5.v),
                                  decoration: BoxDecoration(
                                      color: appTheme.gray10001,
                                      borderRadius:
                                          BorderRadius.circular(4.h))),
                              Padding(
                                  padding: EdgeInsets.only(left: 14.h),
                                  child: Text("1 cup of lemon juice",
                                      style: CustomTextStyles
                                          .bodyLargeOnPrimaryContainer_3))
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 32.v),
                _buildRecipePreparation(context, textForPreparation),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildTopPart(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 22.h, vertical: 30.v),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 8.h),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 25.v),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: InkWell(
                      onTap: () {
                        onTapImgArrowLeft(context);
                      },
                      child: Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: theme.colorScheme.tertiary,
                      ),
                    ),
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(left: 85.h, top: 10.v),
                    child: Text(
                      "Recipe Info",
                      style: theme.textTheme.headlineLarge!.copyWith(
                        color: theme.colorScheme.tertiary,
                      ),
                    ))
              ],
            ),
          ),
          SizedBox(height: 45.v),
          Padding(
            padding: EdgeInsets.only(left: 17.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    CircularPercentIndicator(
                      progressColor: theme.primaryColor,
                      backgroundColor: theme.primaryColor.withOpacity(0.25),
                      radius: 35.0,
                      lineWidth: 10.0,
                      animation: true,
                      percent: 0.5,
                      center: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text("50%",
                            style:
                                CustomTextStyles.titleMediumOnPrimaryContainer),
                      ),
                      circularStrokeCap: CircularStrokeCap.round,
                    ),
                    SizedBox(height: 25.v),
                    Text(
                      "Fats",
                      style: CustomTextStyles.titleMediumOnPrimaryContainer,
                    ),
                  ],
                ),
                Column(
                  children: [
                    CircularPercentIndicator(
                      progressColor: appTheme.blueA40002,
                      backgroundColor: appTheme.blueA40003,
                      radius: 35.0,
                      lineWidth: 10.0,
                      animation: true,
                      percent: 0.95,
                      center: Text("95%",
                          style:
                              CustomTextStyles.titleMediumOnPrimaryContainer),
                      circularStrokeCap: CircularStrokeCap.round,
                    ),
                    SizedBox(height: 25.v),
                    Text(
                      "Protein",
                      style: CustomTextStyles.titleMediumOnPrimaryContainer,
                    ),
                  ],
                ),
                Column(
                  children: [
                    CircularPercentIndicator(
                      progressColor: appTheme.amber600,
                      backgroundColor: appTheme.yellow8003f,
                      radius: 35.0,
                      lineWidth: 10.0,
                      animation: true,
                      percent: 0.85,
                      center: Text("85%",
                          style:
                              CustomTextStyles.titleMediumOnPrimaryContainer),
                      circularStrokeCap: CircularStrokeCap.round,
                    ),
                    SizedBox(height: 25.v),
                    Text("Carbs",
                        style: CustomTextStyles.titleMediumOnPrimaryContainer),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 9.v)
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildTextAndColorContent(BuildContext context,
      {Color? color, String text = "", String textG = ""}) {
    return Container(
      margin: EdgeInsets.only(left: 32.h, right: 20.h),
      padding: EdgeInsets.fromLTRB(24.h, 15.v, 24.h, 13.v),
      decoration: AppDecoration.outlinePrimary3,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 110.h,
            margin: EdgeInsets.only(bottom: 1.v),
            child: Row(
              children: [
                Container(
                    height: 24.adaptSize,
                    width: 24.adaptSize,
                    decoration: BoxDecoration(
                        color: color,
                        borderRadius: BorderRadius.circular(4.h))),
                SizedBox(
                  width: 15.h,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 2.v),
                  child: Text(text, style: CustomTextStyles.titleMedium18),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 2.v, right: 1.h),
            child: Text(textG, style: CustomTextStyles.titleMedium18),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildContentButton(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: EdgeInsets.only(left: 32.h),
        child: Wrap(
          runSpacing: 16.v,
          spacing: 16.h,
          children: List<Widget>.generate(
            2,
            (index) => const Content4ItemWidget(
              text: 'Beverages',
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildRecipePreparation(
      BuildContext context, String textForPreparation) {
    return Padding(
      padding: EdgeInsets.only(left: 32.h, right: 18.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Recipe preparation steps", style: theme.textTheme.titleLarge),
          SizedBox(height: 24.v),
          AnimatedSize(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            child: Container(
              padding: EdgeInsets.all(16.h),
              decoration: AppDecoration.fillBluegray80004
                  .copyWith(borderRadius: BorderRadiusStyle.roundedBorder8),
              child: AnimatedReadMoreText(
                textForPreparation,
                maxLines: 4,
                // Set a custom text for the expand button. Defaults to Read more
                readMoreText: 'Show More',
                // Set a custom text for the collapse button. Defaults to Read less
                readLessText: 'Show Less',
                // Set a custom text style for the main block of text
                expandOnTextTap: true,
                textStyle: CustomTextStyles.bodyLargeOnPrimaryContainer_3,
                // Set a custom text style for the expand/collapse button
                buttonTextStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: theme.primaryColor,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 30.v,
          ),
        ],
      ),
    );
  }

  /// Common widget
  Widget _buildTextContent(
    BuildContext context, {
    required String protein,
    required String weight,
  }) {
    return Container(
      padding: EdgeInsets.fromLTRB(25.h, 14.v, 25.h, 12.v),
      decoration: AppDecoration.outlinePrimary3,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
              padding: EdgeInsets.only(left: 38.h, top: 4.v),
              child: Text(protein,
                  style: CustomTextStyles.titleMediumOnPrimaryContainer18
                      .copyWith(
                          color:
                              theme.colorScheme.onPrimary.withOpacity(0.75)))),
          Padding(
            padding: EdgeInsets.only(top: 3.v),
            child: Text(
              weight,
              style: CustomTextStyles.titleMedium18.copyWith(
                color: theme.colorScheme.onPrimary.withOpacity(1),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Navigates back to the previous screen.
  onTapImgArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }
}
