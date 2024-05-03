import 'dart:io';

import 'package:fait/source/views/chat_bot/views/chat_bot_view.dart';
import 'package:fait/source/views/home/views/home_view.dart';
import 'package:fait/source/views/home/views/nav_bar_screens/home_screen.dart';
import 'package:fait/source/views/register/widgets/pick_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:fait/utils/app_export.dart';
import 'package:fait/source/widgets/custom_elevated_button.dart';
import 'package:fait/source/widgets/custom_text_form_field.dart';

import '../../../../utils/transitions/fade_transition.dart';

// ignore_for_file: must_be_immutable
class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _OnBoardingSignUpScreenState();
}

class _OnBoardingSignUpScreenState extends State<SignUpScreen> {
  TextEditingController firstNameController = TextEditingController();

  TextEditingController lastNameController = TextEditingController();

  TextEditingController userNameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController confirmpasswordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  File? _image;
  late ImagePickerHandler _imagePickerHandler;

  @override
  void initState() {
    super.initState();
    _imagePickerHandler = ImagePickerHandler(onImageChanged: _onImageChanged);
  }

  void _onImageChanged(File image) {
    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return Scaffold(
        // extendBody: true,
        // extendBodyBehindAppBar: true,
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
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
              child: SingleChildScrollView(
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
                                SizedBox(height: 38.v),
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
                          Container(
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadiusStyle.roundedBorder8),
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
                                          InkWell(
                                            onTap: () => _imagePickerHandler
                                                .showOptions(context),
                                            child: SizedBox(
                                              height: 48.adaptSize,
                                              width: 48.adaptSize,
                                              // child: CustomImageView(
                                              //   imagePath: _image?.path ??
                                              //       ImageConstant.imgUser,
                                              // ),
                                              child: _image?.path == null
                                                  ? CustomImageView(
                                                      imagePath:
                                                          ImageConstant.imgUser,
                                                    )
                                                  : Image.file(
                                                      File(_image!.path)),
                                            ),
                                          )
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
                        ]))),
              )),
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
      borderDecoration: TextFormFieldStyleHelper.fillOnPrimaryContainer,
      fillColor: theme.colorScheme.onPrimaryContainer.withOpacity(1),
      isPassword: true,
    );
  }

  /// Section Widget
  Widget _buildConfirmpassword(BuildContext context) {
    return CustomTextFormField(
      controller: confirmpasswordController,
      hintText: "Confirm Password",
      textInputAction: TextInputAction.done,
      textInputType: TextInputType.visiblePassword,
      borderDecoration: TextFormFieldStyleHelper.fillOnPrimaryContainer,
      fillColor: theme.colorScheme.onPrimaryContainer.withOpacity(1),
      isPassword: true,
    );
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
    Navigator.push(
      context,
      FadePageRouteBuilder(
        page: const HomeView(),
        // TODO: replace this after linking sign up
        // page: const ChatBotView(),
        duration: const Duration(milliseconds: 800),
      ),
    );
  }
}
