import 'package:fait/utils/app_export.dart';
import 'package:flutter/material.dart';

class NoteWidget extends StatelessWidget {
  const NoteWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.h),
      padding: EdgeInsets.symmetric(horizontal: 32.h, vertical: 28.v),
      decoration: AppDecoration.fillGray900
          .copyWith(borderRadius: BorderRadiusStyle.roundedBorder12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgIconamoonAtten,
            height: 24.adaptSize,
            width: 24.adaptSize,
            margin: EdgeInsets.symmetric(vertical: 10.v),
          ),
          Expanded(
            child: Container(
              width: 256.h,
              margin: EdgeInsets.only(left: 16.h, top: 2.v, right: 3.h),
              child: Text(
                  "You are 75% more focusedafter at least 8 hours of sleep. You recover...",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.bodyLarge),
            ),
          ),
        ],
      ),
    );
  }
}
