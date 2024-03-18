import 'package:fait/source/views/diet/views/recipes_results_screen.dart';
import 'package:fait/utils/app_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../widgets/app_bar/appbar_subtitle_three.dart';
import '../../../widgets/custom_elevated_button.dart';
import '../../../widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class RecipesFilterScreen extends StatelessWidget {
  RecipesFilterScreen({Key? key}) : super(key: key);

  TextEditingController fatTextController = TextEditingController();

  TextEditingController protienTextController = TextEditingController();

  TextEditingController carbsTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
          decoration: AppDecoration.fillBlueGray.copyWith(
              borderRadius: BorderRadiusStyle.roundedBorder22
                  .copyWith(bottomLeft: Radius.zero, bottomRight: Radius.zero)),
          padding: const EdgeInsets.all(8),
          child: Consumer(builder: (context, ref, child) {
            return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Align(
                        alignment: AlignmentDirectional.centerStart,
                        child: IconButton(
                          onPressed: () => onTapArrowLeft(context),
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
                            "Filters",
                            style: CustomTextStyles.titleLargeBold
                                .copyWith(fontSize: 24.fSize),
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional.centerEnd,
                        child: AppbarSubtitleThree(
                            text: "Rest",
                            margin: EdgeInsets.fromLTRB(32.h, 15.v, 32.h, 23.v),
                            onTap: () {
                              onTapReset(context);
                            }),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 22.v,
                  ),
                  SizedBox(height: 7.v),
                  _buildDietFilterCard(context),
                  SizedBox(height: 24.v),
                  _buildDietFilterCard1(context),
                  SizedBox(height: 24.v),
                  _buildDietFilterCard2(context),
                  SizedBox(height: 20.v),
                  Padding(
                    padding: EdgeInsets.all(30.adaptSize),
                    child: CustomElevatedButton(
                        height: 48.v,
                        text: "See Results",
                        buttonStyle: CustomButtonStyles.fillPrimaryTL12,
                        buttonTextStyle: theme.textTheme.titleLarge!,
                        onPressed: () {
                          onTapSeeResults(context);
                        }),
                  ),
                ]);
          })),
    );
  }

  /// Navigates back to the previous screen.
  onTapArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }

  /// Navigates to the filterOneScreen when the action is triggered.
  onTapReset(BuildContext context) {
    fatTextController.clear();
    protienTextController.clear();
    carbsTextController.clear();
  }

  /// Section Widget
  Widget _buildDietFilterCard(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.h),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text("Fat Quantity:", style: theme.textTheme.titleLarge),
          SizedBox(height: 14.v),
          CustomTextFormField(
              controller: fatTextController,
              textInputType: TextInputType.number,
              textStyle:
                  theme.textTheme.bodyLarge!.copyWith(color: Colors.white),
              borderDecoration: TextFormFieldStyleHelper.fillBlueGrayTL8,
              fillColor: appTheme.blueGray80004)
        ]));
  }

  /// Section Widget
  Widget _buildDietFilterCard1(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.h),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text("Protien Quantity:", style: theme.textTheme.titleLarge),
          SizedBox(height: 14.v),
          CustomTextFormField(
              controller: protienTextController,
              textInputType: TextInputType.number,
              textStyle:
                  theme.textTheme.bodyLarge!.copyWith(color: Colors.white),
              borderDecoration: TextFormFieldStyleHelper.fillBlueGrayTL8,
              fillColor: appTheme.blueGray80004)
        ]));
  }

  /// Section Widget
  Widget _buildDietFilterCard2(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.h),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text("Carbs Quantity:", style: theme.textTheme.titleLarge),
          SizedBox(height: 14.v),
          CustomTextFormField(
              controller: carbsTextController,
              textInputAction: TextInputAction.done,
              textInputType: TextInputType.number,
              textStyle:
                  theme.textTheme.bodyLarge!.copyWith(color: Colors.white),
              borderDecoration: TextFormFieldStyleHelper.fillBlueGrayTL8,
              fillColor: appTheme.blueGray80004)
        ]));
  }

  /// Navigates to the resultsScreen when the action is triggered.
  onTapSeeResults(BuildContext context) {
    showModalBottomSheet(
        context: context,
        useRootNavigator: true,
        isScrollControlled: true,
        builder: (_) => const RecipesResultsScreen());
  }
}
