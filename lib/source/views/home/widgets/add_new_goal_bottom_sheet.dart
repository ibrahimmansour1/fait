import 'package:fait/source/localization/app_localization.dart';
import 'package:fait/source/theme/theme_helper.dart';
import 'package:fait/source/views/home/widgets/goals_popup.dart';
import 'package:fait/utils/app_export.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../widgets/custom_elevated_button.dart';
import '../../../widgets/custom_icon_button.dart';
import '../../../widgets/custom_text_form_field.dart';

final goalTypeProvider = StateProvider<String>((ref) {
  return 'Water achievement';
});

final targetProvider = StateProvider<String>((ref) {
  return '(n) Ml';
});

// ignore_for_file: must_be_immutable
class AddNewGoalBottomSheet extends StatelessWidget {
  AddNewGoalBottomSheet({Key? key}) : super(key: key);

  final TextEditingController targetInputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 24.h, vertical: 22.v),
        decoration: BoxDecoration(
          color: theme.colorScheme.onPrimaryContainer,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24.h),
            topRight: Radius.circular(24.h),
          ),
        ),
        child: Consumer(
          builder: (context, ref, child) => Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("lbl_add_new_goal".tr,
                          style: CustomTextStyles.headlineSmallRobotoSemiBold),
                      CustomIconButton(
                          height: 24.adaptSize,
                          width: 24.adaptSize,
                          decoration: BoxDecoration(
                              color: theme.colorScheme.primary,
                              borderRadius: BorderRadius.circular(4.h)),
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(
                            Icons.close_rounded,
                            color: theme.colorScheme.background,
                          ))
                    ]),
                SizedBox(height: 48.v),
                Padding(
                    padding: EdgeInsets.only(left: 13.h),
                    child: Text("lbl_goal_type".tr,
                        style: CustomTextStyles.titleMediumPrimary18)),
                SizedBox(height: 14.v),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 13.h),
                  child: InkWell(
                    onTap: () {
                      showCupertinoModalPopup(
                          context: context,
                          builder: (context) => Padding(
                                padding: EdgeInsets.only(
                                    bottom:
                                        mediaQueryData.size.height / 2 - 50.v),
                                child: const GoalsPopup(),
                              ));
                    },
                    child: CustomTextFormField(
                      hintText: ref.watch<String>(goalTypeProvider),
                      hintStyle: CustomTextStyles.bodyLargeBlack900_1,
                      alignment: Alignment.center,
                      suffix: SizedBox(
                        width: 12.h,
                        height: 6.v,
                        child: Icon(
                          Icons.keyboard_arrow_down,
                          color: appTheme.deepPurpleA200,
                        ),
                      ),
                      fillColor: Colors.white,
                      enabled: false,
                    ),
                  ),
                ),
                SizedBox(height: 20.v),
                Padding(
                    padding: EdgeInsets.only(left: 13.h),
                    child: Text("lbl_target".tr,
                        style: CustomTextStyles.titleMediumPrimary18)),
                SizedBox(height: 14.v),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 13.h),
                    child: CustomTextFormField(
                        controller: targetInputController,
                        hintText: ref.watch<String>(targetProvider),
                        hintStyle: CustomTextStyles.bodyLargeInterBlack900,
                        textInputAction: TextInputAction.done,
                        fillColor: Colors.white,
                        textInputType: TextInputType.number,
                        alignment: Alignment.center)),
                SizedBox(height: 19.v),
                CustomElevatedButton(
                    height: 47.v,
                    width: 210.h,
                    text: "lbl_save".tr,
                    buttonStyle: CustomButtonStyles.fillPrimaryTL20,
                    buttonTextStyle: CustomTextStyles
                        .titleMediumInterOnPrimaryContainerSemiBold,
                    onPressed: () {
                      onTapSave(context);
                    },
                    alignment: Alignment.center),
                SizedBox(height: 3.v)
              ]),
        ));
  }

  /// Navigates to the profileScreen when the action is triggered.
  onTapSave(BuildContext context) {
    Navigator.pop(context);
  }
}
