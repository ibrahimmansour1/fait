import 'package:fait/source/providers/bottom_sheet_provider.dart';
import 'package:fait/source/views/register/widgets/verification_code_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:fait/utils/app_export.dart';
import 'package:fait/source/widgets/custom_elevated_button.dart';
import 'package:fait/source/widgets/custom_outlined_button.dart';
import 'package:fait/source/widgets/custom_text_form_field.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// ignore_for_file: must_be_immutable
class ForgetPassBottomSheet extends StatelessWidget {
  ForgetPassBottomSheet({Key? key}) : super(key: key);

  TextEditingController emailController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return Form(
        key: _formKey,
        child: SizedBox(
            width: double.maxFinite,
            child: Container(
                width: double.maxFinite,
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
                  SizedBox(height: 25.v),
                  Text("Forget Password?",
                      style: CustomTextStyles.headlineSmallInterBlack900),
                  SizedBox(height: 21.v),
                  Align(
                      alignment: Alignment.center,
                      child: Text(
                          "Enter Your email for the verification process",
                          style: CustomTextStyles.bodyLargeInterBlack900)),
                  SizedBox(height: 11.v),
                  Align(
                      alignment: Alignment.center,
                      child: Text("We will sent 4 digits code to your email",
                          style: CustomTextStyles.bodyLargeInterBlack900)),
                  SizedBox(height: 62.v),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.h),
                      child: CustomTextFormField(
                          controller: emailController,
                          hintText: "Email",
                          hintStyle: CustomTextStyles.bodySmallInterBlack900,
                          textInputAction: TextInputAction.done,
                          textInputType: TextInputType.emailAddress,
                          borderDecoration: TextFormFieldStyleHelper.fillGray,
                          fillColor: appTheme.gray10001)),
                  SizedBox(height: 64.v),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 47.h),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Consumer(
                              builder: (context, ref, child) =>
                                  CustomElevatedButton(
                                      width: 133.h,
                                      text: "Continue",
                                      buttonStyle:
                                          CustomButtonStyles.fillGreenA,
                                      buttonTextStyle:
                                          CustomTextStyles.bodyLargeInter,
                                      onPressed: () {
                                        onTapContinue(context, ref);
                                      }),
                            ),
                            CustomOutlinedButton(
                                onPressed: () => Navigator.pop(context),
                                height: 51.v,
                                width: 117.h,
                                text: "Cancel",
                                margin: EdgeInsets.only(left: 32.h),
                                buttonStyle: CustomButtonStyles.outlineRed,
                                buttonTextStyle:
                                    CustomTextStyles.bodyLargeInterBlack900)
                          ])),
                  SizedBox(height: 40.v)
                ]))));
  }

  /// Navigates to the forgetCardtwoScreen when the action is triggered.
  onTapContinue(BuildContext context, WidgetRef ref) {
    ref
        .watch(bottomSheetProvider)
        .updateBottomSheet(const VerificationCodeBottomSheet());
  }
}
