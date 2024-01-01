import 'package:fait/source/theme/app_decoration.dart';
import 'package:fait/source/theme/custom_button_style.dart';
import 'package:fait/source/theme/custom_text_style.dart';
import 'package:fait/source/theme/theme_helper.dart';
import 'package:fait/source/views/onboarding/widgets/onboarding_item_widget.dart';
import 'package:fait/source/widgets/custom_elevated_button.dart';
import 'package:fait/source/widgets/custom_image_view.dart';
import 'package:fait/utils/image_constant.dart';
import 'package:fait/utils/size_utils.dart';
import 'package:flutter/material.dart';

class ChatBotView extends StatelessWidget {
  const ChatBotView({super.key});

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
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
                  ],
                ),
              ),
              child: SingleChildScrollView(
                child: Container(
                    width: double.maxFinite,
                    padding:
                        EdgeInsets.symmetric(horizontal: 41.h, vertical: 60.v),
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
                            SizedBox(height: 38.v),
                            Text("Fitness AI Trainer",
                                style: theme.textTheme.headlineSmall)
                          ])),
                      SizedBox(height: 160.v),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Welcome in",
                              style: theme.textTheme.bodyLarge!
                                  .copyWith(fontSize: 36.fSize)),
                          SizedBox(width: 10.v),
                          Text("FAIT",
                              style: theme.textTheme.headlineSmall!
                                  .copyWith(fontSize: 36.fSize)),
                        ],
                      ),
                      SizedBox(height: 20.v),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 36.v),
                        child: Text(
                            "Let's start with a simple chat to know you better",
                            textAlign: TextAlign.center,
                            style: theme.textTheme.bodyMedium!
                                .copyWith(fontSize: 16)),
                      ),
                      SizedBox(height: 220.v),
                      Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadiusStyle.roundedBorder8),
                          child: Column(children: [
                            Padding(
                                padding: EdgeInsets.only(right: 5.h),
                                child: const Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [])),
                            SizedBox(height: 16.v),
                            _buildGoToChat(context)
                          ])),
                      SizedBox(height: 5.v)
                    ])),
              )),
        ));
  }
}

/// Section Widget
Widget _buildGoToChat(BuildContext context) {
  return CustomElevatedButton(
      height: 56.v,
      width: 260.h,
      text: "Go to Chat",
      buttonStyle: CustomButtonStyles.fillPrimary,
      rightIcon: Row(
        children: [
          SizedBox(width: 30.h),
          const Icon(
            Icons.arrow_forward_rounded,
            color: Colors.white,
          ),
        ],
      ),
      buttonTextStyle: CustomTextStyles.titleLargeInter,
      onPressed: () {
        onTapGoToChat(context);
      });
}

onTapGoToChat(BuildContext context) {
  Navigator.pushNamed(context, '/chat_bot');
}
