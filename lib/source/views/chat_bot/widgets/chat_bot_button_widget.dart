import 'package:fait/utils/size_utils.dart';
import 'package:flutter/material.dart';

import '../../../../utils/app_export.dart';
import '../../../widgets/custom_elevated_button.dart';

class ChatBotButtonWidget extends StatelessWidget {
  final String route;
  const ChatBotButtonWidget({
    super.key,
    required this.route,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 32.0.h, vertical: 8.v),
      child: CustomElevatedButton(
          height: 58.v,
          text: "Continue",
          rightIcon: Row(
            children: [
              SizedBox(
                width: 80.v,
              ),
              const Icon(
                Icons.arrow_forward,
                color: Colors.white,
              ),
            ],
          ),
          buttonStyle: CustomButtonStyles.fillPrimary,
          buttonTextStyle: CustomTextStyles.titleLargeInter,
          onPressed: () {
            Navigator.pushNamed(context, route);
          }),
    );
  }
}
