import 'package:fait/source/providers/theme/theme_provider.dart';
import 'package:fait/utils/app_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomChatBotAppBar extends ConsumerWidget {
  const CustomChatBotAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeHelper = ref.watch(themeNotifierProvider);
    return Padding(
      padding: EdgeInsets.all(12.h),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: themeHelper.getThemeData().colorScheme.tertiary,
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
              style: theme.textTheme.headlineSmall!.copyWith(
                  fontSize: 36.fSize,
                  color: themeHelper.getThemeData().colorScheme.tertiary)),
        ],
      ),
    );
  }
}
