import 'package:fait/source/providers/bottom_sheet_provider.dart';
import 'package:flutter/material.dart';
import 'package:fait/utils/app_export.dart';
import 'package:fait/source/widgets/custom_elevated_button.dart';
import 'package:fait/source/widgets/custom_text_form_field.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// ignore_for_file: must_be_immutable
class ResetPassBottomSheet extends StatelessWidget {
  ResetPassBottomSheet({Key? key}) : super(key: key);

  TextEditingController passwordController = TextEditingController();

  TextEditingController confirmpasswordController = TextEditingController();

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
                padding: EdgeInsets.symmetric(horizontal: 25.h, vertical: 24.v),
                decoration: AppDecoration.fillOnPrimaryContainer
                    .copyWith(borderRadius: BorderRadiusStyle.customBorderTL20),
                child: Column(mainAxisSize: MainAxisSize.min, children: [
                  Container(
                      height: 9.v,
                      width: 150.h,
                      decoration: BoxDecoration(
                          color: appTheme.black900,
                          borderRadius: BorderRadius.circular(4.h))),
                  SizedBox(height: 23.v),
                  Text("Reset Password",
                      style: CustomTextStyles.headlineSmallInterBlack900),
                  SizedBox(height: 22.v),
                  Align(
                      alignment: Alignment.center,
                      child: SizedBox(
                          width: 310.h,
                          child: Text(
                              "Set the new password for your account to log in with it...",
                              maxLines: 2,
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                              style: CustomTextStyles.bodyLargeInterBlack900))),
                  SizedBox(height: 44.v),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.h),
                      child: CustomTextFormField(
                          controller: passwordController,
                          hintText: "password",
                          hintStyle: CustomTextStyles.bodyLargeInterBlack900_1,
                          textInputType: TextInputType.visiblePassword,
                          isPassword: true,
                          borderDecoration: TextFormFieldStyleHelper.fillGray,
                          fillColor: appTheme.gray10001)),
                  SizedBox(height: 16.v),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.h),
                      child: CustomTextFormField(
                          controller: confirmpasswordController,
                          hintText: "confirm password",
                          hintStyle: CustomTextStyles.bodyLargeInterBlack900_1,
                          textInputAction: TextInputAction.done,
                          textInputType: TextInputType.visiblePassword,
                          isPassword: true,
                          borderDecoration: TextFormFieldStyleHelper.fillGray,
                          fillColor: appTheme.gray10001)),
                  SizedBox(height: 48.v),
                  Consumer(
                    builder: (context, ref, child) => CustomElevatedButton(
                        height: 48.v,
                        text: "Reset Password",
                        margin: EdgeInsets.symmetric(horizontal: 33.h),
                        buttonStyle: CustomButtonStyles.fillGreenA,
                        buttonTextStyle:
                            CustomTextStyles.titleMediumInterOnPrimaryContainer,
                        onPressed: () {
                          onTapResetPassword(context, ref);
                        }),
                  ),
                  SizedBox(height: 22.v)
                ]))));
  }

  /// Navigates to the onBoardingLogInScreen when the action is triggered.
  onTapResetPassword(BuildContext context, WidgetRef ref) {
    Navigator.pop(context);
    ref.watch(bottomSheetProvider).resetBottomSheet();
  }
}
