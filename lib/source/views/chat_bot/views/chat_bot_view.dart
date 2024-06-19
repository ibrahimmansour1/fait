import 'dart:developer';
import 'package:fait/source/views/chat_bot/views/chat_bot_view_body_with_name.dart';
import 'package:fait/source/widgets/custom_elevated_button.dart';
import 'package:fait/utils/app_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../utils/transitions/fade_transition.dart';
import '../../../providers/theme/theme_provider.dart';

class ChatBotView extends ConsumerWidget {
  const ChatBotView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeHelper = ref.watch(themeNotifierProvider);

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
                color: themeHelper.getThemeData().colorScheme.background,
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
                            IconButton(
                              icon: Icon(
                                themeHelper.currentTheme == 'light'
                                    ? Icons.dark_mode
                                    : Icons.light_mode,
                              ),
                              onPressed: () {
                                final newTheme =
                                    themeHelper.currentTheme == 'light'
                                        ? 'dark'
                                        : 'light';
                                log("Before Change Theme: ${themeHelper.currentTheme}");
                                ref
                                    .read(themeNotifierProvider.notifier)
                                    .changeTheme(newTheme);
                                log("After Change Theme: ${themeHelper.currentTheme}");
                              },
                            ),
                            SizedBox(height: 38.v),
                            CustomImageView(
                                imagePath: ImageConstant.imgFait128x128,
                                height: 128.adaptSize,
                                width: 128.adaptSize,
                                radius: BorderRadius.circular(64.h)),
                            SizedBox(height: 38.v),
                            Text("Fitness AI Trainer",
                                style: theme.textTheme.headlineSmall!.copyWith(
                                    color: Theme.of(context).brightness ==
                                            Brightness.dark
                                        ? Colors.white
                                        : Colors.black))
                          ])),
                      SizedBox(height: 160.v),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Welcome in",
                              style: theme.textTheme.bodyLarge!.copyWith(
                                  fontSize: 36.fSize,
                                  color: Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? Colors.white
                                      : Colors.black)),
                          SizedBox(width: 10.v),
                          Text("FAIT",
                              style: theme.textTheme.headlineSmall!.copyWith(
                                  fontSize: 36.fSize,
                                  color: Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? Colors.white
                                      : Colors.black)),
                        ],
                      ),
                      SizedBox(height: 20.v),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 36.v),
                        child: Text(
                            "Let's start with a simple chat to know you better",
                            textAlign: TextAlign.center,
                            style: theme.textTheme.bodyMedium!.copyWith(
                                fontSize: 16,
                                color: Theme.of(context).brightness ==
                                        Brightness.dark
                                    ? Colors.white
                                    : Colors.black)),
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
                            _buildGoToChat(context, themeHelper)
                          ])),
                      SizedBox(height: 5.v)
                    ])),
              )),
        ));
  }
}

/// Section Widget
Widget _buildGoToChat(BuildContext context, ThemeHelper themeHelper) {
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
  Navigator.push(
    context,
    FadePageRouteBuilder(
      page: const ChatBotViewBodyName(),
      duration: const Duration(milliseconds: 800),
    ),
  );
}
