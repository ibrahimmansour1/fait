import 'package:fait/source/providers/register/bottom_sheet_provider.dart';
import 'package:fait/source/views/register/widgets/reset_pass_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:fait/utils/app_export.dart';
import 'package:fait/source/widgets/custom_elevated_button.dart';
import 'package:fait/source/widgets/custom_pin_code_text_field.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class VerificationCodeBottomSheet extends StatelessWidget {
  const VerificationCodeBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SizedBox(
        width: double.maxFinite,
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: 26.h, vertical: 24.v),
            decoration: AppDecoration.fillOnPrimaryContainer
                .copyWith(borderRadius: BorderRadiusStyle.customBorderTL20),
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              Container(
                  height: 9.v,
                  width: 150.h,
                  decoration: BoxDecoration(
                      color: appTheme.black900,
                      borderRadius: BorderRadius.circular(4.h))),
              SizedBox(height: 22.v),
              Text("Enter Verification code",
                  style: CustomTextStyles.headlineSmallInterBlack900),
              SizedBox(height: 23.v),
              Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                      width: 370.h,
                      child: Text(
                          "Enter the 4 digit code that You recieved on Your email",
                          maxLines: 2,
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          style: CustomTextStyles.bodyLargeInterBlack900))),
              SizedBox(height: 75.v),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 59.h),
                  child: CustomPinCodeTextField(
                      context: context, onChanged: (value) {})),
              SizedBox(height: 64.v),
              Consumer(
                builder: (context, ref, child) => CustomElevatedButton(
                    height: 48.v,
                    text: "Continue",
                    margin: EdgeInsets.symmetric(horizontal: 32.h),
                    buttonStyle: CustomButtonStyles.fillGreenA,
                    buttonTextStyle:
                        CustomTextStyles.titleMediumInterOnPrimaryContainer,
                    onPressed: () {
                      onTapContinue(context, ref);
                    }),
              ),
              SizedBox(height: 36.v)
            ])));
  }

  /// Navigates to the forgetCardthreeScreen when the action is triggered.
  onTapContinue(BuildContext context, WidgetRef ref) {
    ref
        .watch(bottomSheetProvider.notifier)
        .updateBottomSheet(ResetPassBottomSheet());
  }
}
