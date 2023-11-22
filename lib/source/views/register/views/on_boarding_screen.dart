import 'package:fait/source/views/register/views/on_boarding_sign_up_screen.dart';
import 'package:fait/utils/transitions/Fade_transition.dart';
import 'package:flutter/material.dart';
import 'package:fait/utils/app_export.dart';
import 'package:fait/source/widgets/custom_elevated_button.dart';
import 'package:fait/source/widgets/custom_outlined_button.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            extendBody: true,
            extendBodyBehindAppBar: true,
            body: Container(
                width: mediaQueryData.size.width,
                height: mediaQueryData.size.height,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: const Alignment(0, 0.51),
                        end: const Alignment(0.95, 0.66),
                        colors: [
                      theme.colorScheme.onPrimary,
                      appTheme.blueGray800,
                      appTheme.blueGray80001
                    ])),
                child: Container(
                    width: double.maxFinite,
                    padding:
                        EdgeInsets.symmetric(horizontal: 35.h, vertical: 60.v),
                    child: Column(children: [
                      Padding(
                          padding: EdgeInsets.symmetric(horizontal: 43.h),
                          child: Column(children: [
                            CustomImageView(
                                imagePath: ImageConstant.imgFait128x128,
                                height: 128.adaptSize,
                                width: 128.adaptSize,
                                radius: BorderRadius.circular(64.h)),
                            SizedBox(height: 23.v),
                            Text("Fitness AI Trainer",
                                style: theme.textTheme.headlineSmall)
                          ])),
                      SizedBox(height: 80.v),
                      CustomElevatedButton(
                          height: 60.v,
                          text: "Sign Up Now",
                          margin: EdgeInsets.only(left: 37.h, right: 38.h),
                          buttonStyle: CustomButtonStyles.fillPrimary,
                          buttonTextStyle:
                              CustomTextStyles.headlineSmallRobotoSemiBold,
                          onPressed: () {
                            onTapSignUpNow(context);
                          }),
                      SizedBox(height: 17.v),
                      GestureDetector(
                          onTap: () {
                            onTapTxtDoyouhaveanaccount(context);
                          },
                          child: RichText(
                              text: TextSpan(children: [
                                TextSpan(
                                    text: "Do You have an account ? ",
                                    style: theme.textTheme.bodyLarge),
                                TextSpan(
                                    text: "Login",
                                    style: theme.textTheme.bodyLarge!.copyWith(
                                        decorationColor:
                                            theme.textTheme.bodyLarge!.color,
                                        decoration: TextDecoration.underline))
                              ]),
                              textAlign: TextAlign.left)),
                      SizedBox(height: 21.v),
                      _buildORFrame(context),
                      SizedBox(height: 24.v),
                      CustomOutlinedButton(
                          text: "Login With Google",
                          margin: EdgeInsets.symmetric(horizontal: 24.h),
                          leftIcon: Container(
                              margin: EdgeInsets.only(right: 8.h),
                              child: CustomImageView(
                                  imagePath: ImageConstant.imgGoogle,
                                  height: 24.adaptSize,
                                  width: 24.adaptSize)),
                          onPressed: () {
                            onTapLoginWithGoogle(context);
                          }),
                      SizedBox(height: 24.v),
                      CustomOutlinedButton(
                          text: "Login With Facebook",
                          margin: EdgeInsets.symmetric(horizontal: 24.h),
                          leftIcon: Container(
                              margin: EdgeInsets.only(right: 8.h),
                              child: CustomImageView(
                                  imagePath: ImageConstant.imgFacebook,
                                  height: 24.adaptSize,
                                  width: 24.adaptSize)),
                          onPressed: () {
                            onTapLoginWithFacebook(context);
                          }),
                      SizedBox(height: 5.v)
                    ])))));
  }

  /// Section Widget
  Widget _buildORFrame(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
              padding: EdgeInsets.only(top: 14.v, bottom: 12.v),
              child: SizedBox(width: 127.h, child: const Divider())),
          Text("Or", style: CustomTextStyles.headlineSmallRobotoRegular),
          Padding(
              padding: EdgeInsets.only(top: 14.v, bottom: 12.v),
              child: SizedBox(width: 127.h, child: const Divider()))
        ]);
  }

  /// Navigates to the onBoardingSignUpScreen when the action is triggered.
  onTapSignUpNow(BuildContext context) {
    // Navigator.pushNamed(context, AppRoutes.onBoardingSignUpScreen);
    Navigator.push(
      context,
      FadePageRouteBuilder(page: OnBoardingSignUpScreen()),
    );
  }

  /// Navigates to the onBoardingLogInScreen when the action is triggered.
  onTapTxtDoyouhaveanaccount(BuildContext context) {
    // Navigator.pushNamed(context, AppRoutes.onBoardingLogInScreen);
  }

  /// Navigates to the onboardingoneScreen when the action is triggered.
  onTapLoginWithGoogle(BuildContext context) {
    // Navigator.pushNamed(context, AppRoutes.onboardingoneScreen);
  }

  /// Navigates to the onboardingoneScreen when the action is triggered.
  onTapLoginWithFacebook(BuildContext context) {
    // Navigator.pushNamed(context, AppRoutes.onboardingoneScreen);
  }
}
