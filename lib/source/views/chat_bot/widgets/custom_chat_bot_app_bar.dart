import 'package:fait/utils/app_export.dart';
import 'package:flutter/material.dart';

class CustomChatBotAppBar extends StatelessWidget {
  const CustomChatBotAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12.h),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
          ),
          SizedBox(
            width: 10.v,
          ),
          CustomImageView(
              imagePath: ImageConstant.imgFait128x128,
              height: 46.adaptSize,
              width: 46.adaptSize,
              radius: BorderRadius.circular(64.h)),
          SizedBox(
            width: 30.v,
          ),
          Text("FAIT",
              style:
                  theme.textTheme.headlineSmall!.copyWith(fontSize: 36.fSize)),
        ],
      ),
    );
  }
}
