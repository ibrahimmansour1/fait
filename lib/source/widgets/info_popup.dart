import 'package:fait/utils/app_export.dart';
import 'package:flutter/material.dart';

class InfoPopup extends StatelessWidget {
  final String infoText;
  const InfoPopup({super.key, required this.infoText});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 352.h,
      height: 156.v,
      padding: EdgeInsets.all(16.adaptSize),
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color: const Color(0xBF121212),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Align(
            alignment: AlignmentDirectional.centerStart,
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                width: 16.adaptSize,
                height: 16.adaptSize,
                decoration: ShapeDecoration(
                  color: theme.colorScheme.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.only(start: 4.adaptSize),
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 12.adaptSize,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                infoText,
                style: CustomTextStyles.titleMediumOnPrimaryContainer,
              ),
              SizedBox(
                height: 20.v,
              ),
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Container(
                  decoration: AppDecoration.fillPrimary.copyWith(
                      borderRadius: BorderRadiusStyle.roundedBorder22),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                    child: Text(
                      'OK',
                      style: CustomTextStyles.titleMediumOnPrimaryContainer,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
