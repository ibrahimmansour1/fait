import 'package:flutter/material.dart';
import 'package:fait/utils/app_export.dart';
import 'package:fait/source/widgets/custom_elevated_button.dart';
import 'package:fait/source/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class OnBoardingSignUpScreen extends StatelessWidget {
  OnBoardingSignUpScreen({Key? key}) : super(key: key);

  TextEditingController firstNameController = TextEditingController();

  TextEditingController lastNameController = TextEditingController();

  TextEditingController userNameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController confirmpasswordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Container(
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
              child: Form(
                  key: _formKey,
                  child: Container(
                      width: double.maxFinite,
                      padding: EdgeInsets.symmetric(
                          horizontal: 41.h, vertical: 60.v),
                      child: Column(children: [
                        Padding(
                            padding: EdgeInsets.symmetric(horizontal: 35.h),
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
                        SizedBox(height: 96.v),
                        Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadiusStyle.roundedBorder8),
                            child: Column(children: [
                              Padding(
                                  padding: EdgeInsets.only(right: 5.h),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                            padding: EdgeInsets.only(
                                                top: 11.v, bottom: 7.v),
                                            child: Text("Add your photo",
                                                style: CustomTextStyles
                                                    .headlineSmallRobotoSemiBold)),
                                        CustomImageView(
                                            imagePath: ImageConstant.imgUser,
                                            height: 48.adaptSize,
                                            width: 48.adaptSize)
                                      ])),
                              SizedBox(height: 16.v),
                              _buildName(context),
                              SizedBox(height: 16.v),
                              _buildUserName(context),
                              SizedBox(height: 16.v),
                              _buildEmail(context),
                              SizedBox(height: 16.v),
                              _buildPassword(context),
                              SizedBox(height: 16.v),
                              _buildConfirmpassword(context),
                              SizedBox(height: 48.v),
                              _buildSignUp(context)
                            ])),
                        SizedBox(height: 5.v)
                      ])))),
        ));
  }

  /// Section Widget
  Widget _buildFirstName(BuildContext context) {
    return Expanded(
        child: Padding(
            padding: EdgeInsets.only(right: 4.h),
            child: CustomTextFormField(
                controller: firstNameController,
                hintText: "First Name",
                borderDecoration:
                    TextFormFieldStyleHelper.fillOnPrimaryContainer,
                fillColor:
                    theme.colorScheme.onPrimaryContainer.withOpacity(1))));
  }

  /// Section Widget
  Widget _buildLastName(BuildContext context) {
    return Expanded(
        child: Padding(
            padding: EdgeInsets.only(left: 4.h),
            child: CustomTextFormField(
                controller: lastNameController,
                hintText: "Last Name",
                borderDecoration:
                    TextFormFieldStyleHelper.fillOnPrimaryContainer,
                fillColor:
                    theme.colorScheme.onPrimaryContainer.withOpacity(1))));
  }

  /// Section Widget
  Widget _buildName(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [_buildFirstName(context), _buildLastName(context)]);
  }

  /// Section Widget
  Widget _buildUserName(BuildContext context) {
    return CustomTextFormField(
        controller: userNameController,
        hintText: "Username",
        borderDecoration: TextFormFieldStyleHelper.fillOnPrimaryContainer,
        fillColor: theme.colorScheme.onPrimaryContainer.withOpacity(1));
  }

  /// Section Widget
  Widget _buildEmail(BuildContext context) {
    return CustomTextFormField(
        controller: emailController,
        hintText: "E-mail",
        textInputType: TextInputType.emailAddress,
        borderDecoration: TextFormFieldStyleHelper.fillOnPrimaryContainer,
        fillColor: theme.colorScheme.onPrimaryContainer.withOpacity(1));
  }

  /// Section Widget
  Widget _buildPassword(BuildContext context) {
    return CustomTextFormField(
        controller: passwordController,
        hintText: "Password",
        textInputType: TextInputType.visiblePassword,
        obscureText: true,
        borderDecoration: TextFormFieldStyleHelper.fillOnPrimaryContainer,
        fillColor: theme.colorScheme.onPrimaryContainer.withOpacity(1));
  }

  /// Section Widget
  Widget _buildConfirmpassword(BuildContext context) {
    return CustomTextFormField(
        controller: confirmpasswordController,
        hintText: "Confirm Password",
        textInputAction: TextInputAction.done,
        textInputType: TextInputType.visiblePassword,
        obscureText: true,
        borderDecoration: TextFormFieldStyleHelper.fillOnPrimaryContainer,
        fillColor: theme.colorScheme.onPrimaryContainer.withOpacity(1));
  }

  /// Section Widget
  Widget _buildSignUp(BuildContext context) {
    return CustomElevatedButton(
        height: 48.v,
        text: "Sign Up",
        buttonStyle: CustomButtonStyles.fillPrimary,
        buttonTextStyle: CustomTextStyles.titleLargeInter,
        onPressed: () {
          onTapSignUp(context);
        });
  }

  /// Navigates to the onboardingoneScreen when the action is triggered.
  onTapSignUp(BuildContext context) {
    // Navigator.pushNamed(context, AppRoutes.onboardingoneScreen);
  }
}
