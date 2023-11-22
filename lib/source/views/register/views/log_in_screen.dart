import 'package:fait/source/providers/bottom_sheet_provider.dart';
import 'package:flutter/material.dart';
import 'package:fait/utils/app_export.dart';
import 'package:fait/source/widgets/custom_elevated_button.dart';
import 'package:fait/source/widgets/custom_text_form_field.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// ignore_for_file: must_be_immutable
class LogInScreen extends StatelessWidget {
  LogInScreen({Key? key}) : super(key: key);

  TextEditingController userNameController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            extendBody: true,
            extendBodyBehindAppBar: true,
            resizeToAvoidBottomInset: false,
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
                child: Form(
                    key: _formKey,
                    child: Container(
                        width: double.maxFinite,
                        padding: EdgeInsets.symmetric(
                            horizontal: 41.h, vertical: 60.v),
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
                                    style: CustomTextStyles.headlineSmallAquire)
                              ])),
                          SizedBox(height: 96.v),
                          _buildFilledInfoUnfilled(context),
                          SizedBox(height: 37.v),
                          Consumer(
                            builder: (context, ref, child) => InkWell(
                                onTap: () {
                                  onTapTxtForgotPassword(context, ref);
                                },
                                child: Text(" Forgot  password ? ",
                                    style: CustomTextStyles
                                        .bodySmallInterOnPrimaryContainer
                                        .copyWith(
                                            decorationColor: Colors.white,
                                            decoration:
                                                TextDecoration.underline))),
                          ),
                          SizedBox(height: 5.v)
                        ]))))));
  }

  /// Section Widget
  Widget _buildFilledInfoUnfilled(BuildContext context) {
    return Container(
        decoration: AppDecoration.gradientOnPrimaryToBlueGray,
        child: Column(children: [
          CustomTextFormField(
              controller: userNameController,
              hintText: "E-mail or User name",
              textInputType: TextInputType.emailAddress,
              borderDecoration: TextFormFieldStyleHelper.fillOnPrimaryContainer,
              fillColor: theme.colorScheme.onPrimaryContainer.withOpacity(1)),
          SizedBox(height: 16.v),
          CustomTextFormField(
              controller: passwordController,
              hintText: "Password",
              textInputAction: TextInputAction.done,
              textInputType: TextInputType.visiblePassword,
              obscureText: true,
              borderDecoration: TextFormFieldStyleHelper.fillOnPrimaryContainer,
              fillColor: theme.colorScheme.onPrimaryContainer.withOpacity(1)),
          SizedBox(height: 49.v),
          CustomElevatedButton(
              height: 48.v,
              text: "Log in",
              buttonStyle: CustomButtonStyles.fillPrimary,
              buttonTextStyle: CustomTextStyles.headlineSmallRobotoSemiBold,
              onPressed: () {
                onTapLogIn(context);
              })
        ]));
  }

  /// Navigates to the home2AfterLoginScreen when the action is triggered.
  onTapLogIn(BuildContext context) {
    // navigate
  }

  /// Navigates to the forgetCardoneScreen when the action is triggered.
  onTapTxtForgotPassword(BuildContext context, WidgetRef ref) {
    ref.watch(bottomSheetProvider).resetBottomSheet();
    showModalBottomSheet(
      context: context,
      builder: (context) => Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Consumer(
            builder: (context, ref, child) => AnimatedSwitcher(
              duration: const Duration(milliseconds: 700),
              child: ref.watch(bottomSheetProvider).bottomSheet,
            ),
          )),
      isScrollControlled: true,
    );
  }
}
