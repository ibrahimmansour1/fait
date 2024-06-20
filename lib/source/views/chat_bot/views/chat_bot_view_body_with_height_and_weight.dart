import 'package:fait/source/routes.dart';
import 'package:fait/source/views/chat_bot/views/chat_bot_view_body_with_name.dart';
import 'package:fait/source/views/chat_bot/widgets/chat_bot_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../utils/size_utils.dart';
import '../../../providers/theme/theme_provider.dart';
import '../../../widgets/custom_future_animated_opacity_widget.dart';
import '../widgets/chat_message_widget.dart';
import '../widgets/custom_chat_bot_app_bar.dart';
import '../widgets/select_your_height_widget.dart';
import '../widgets/select_your_weight_widget.dart';

var messageController = TextEditingController();

class ChatBotViewBodyWithHeightAndWeight extends ConsumerStatefulWidget {
  const ChatBotViewBodyWithHeightAndWeight({super.key});

  @override
  ConsumerState<ChatBotViewBodyWithHeightAndWeight> createState() =>
      _ChatBotViewBodyWithHeightAndWeightState();
}

class _ChatBotViewBodyWithHeightAndWeightState
    extends ConsumerState<ChatBotViewBodyWithHeightAndWeight> {
  bool isHeightSelected = false;
  bool isWeightSelected = false;
  @override
  Widget build(BuildContext context) {
    final themeHelper = ref.watch(themeNotifierProvider);
    mediaQueryData = MediaQuery.of(context);
    return Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        resizeToAvoidBottomInset: false,
        body: Container(
          width: mediaQueryData.size.width,
          height: mediaQueryData.size.height,
          decoration: BoxDecoration(
            color: themeHelper.getThemeData().colorScheme.background,
          ),
          child: SafeArea(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomChatBotAppBar(),
                  SizedBox(height: 10.v),
                  CustomFutureAnimatedOpacityWidget(
                    waitingDurationInMilliSeconds: 1000,
                    child: ChatMessageWidget(
                      message: 'Please detect your Height $name',
                    ),
                  ),
                  SizedBox(height: 10.v),
                  CustomFutureAnimatedOpacityWidget(
                    waitingDurationInMilliSeconds: 2000,
                    child: SelectYourHeightWidget(
                      onHeightSelected: () {
                        setState(() {
                          isHeightSelected = true;
                        });
                      },
                    ),
                  ),
                  isHeightSelected
                      ? CustomFutureAnimatedOpacityWidget(
                          waitingDurationInMilliSeconds: 1000,
                          child: const ChatMessageWidget(
                            message: "Great! Let's detect your weight",
                          ),
                        )
                      : const SizedBox(),
                  SizedBox(height: 10.v),
                  isHeightSelected
                      ? CustomFutureAnimatedOpacityWidget(
                          waitingDurationInMilliSeconds: 2000,
                          child: SelectYourWeightWidget(
                            onWeightSelected: () {
                              setState(() {
                                isWeightSelected = true;
                              });
                            },
                          ),
                        )
                      : const SizedBox(),
                  const Spacer(),
                  if (isHeightSelected && isWeightSelected)
                    CustomFutureAnimatedOpacityWidget(
                        waitingDurationInMilliSeconds: 1000,
                        child: const ChatBotButtonWidget(
                          route: AppRoutes.chatBotGoalScreen,
                        )),
                  SizedBox(
                    height: 10.v,
                  ),
                  // BuildSendMessageWidget(
                  //   messageController: messageController,
                  // ),
                ],
              ),
            ),
          ),
        ));
  }
}
