import 'package:flutter/material.dart';
import 'package:fait/utils/app_export.dart';

class CustomBottomBar extends StatefulWidget {
  CustomBottomBar({super.key, this.onChanged});

  Function(BottomBarEnum)? onChanged;

  @override
  CustomBottomBarState createState() => CustomBottomBarState();
}

class CustomBottomBarState extends State<CustomBottomBar> {
  int selectedIndex = 0;

  List<BottomMenuModel> bottomMenuList = [
    BottomMenuModel(
      icon: ImageConstant.imgEnglish,
      activeIcon: ImageConstant.imgEnglish,
      type: BottomBarEnum.English,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgImage16,
      activeIcon: ImageConstant.imgImage16,
      type: BottomBarEnum.Image16,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgImage13,
      activeIcon: ImageConstant.imgImage13,
      type: BottomBarEnum.Image13,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgStrongLogo,
      activeIcon: ImageConstant.imgStrongLogo,
      type: BottomBarEnum.Stronglogo,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgNotify,
      activeIcon: ImageConstant.imgNotify,
      type: BottomBarEnum.Notify,
    )
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 92.v,
      child: BottomNavigationBar(
        backgroundColor: Colors.transparent,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedFontSize: 0,
        elevation: 0,
        currentIndex: selectedIndex,
        type: BottomNavigationBarType.fixed,
        items: List.generate(bottomMenuList.length, (index) {
          return BottomNavigationBarItem(
            icon: CustomImageView(
              imagePath: bottomMenuList[index].icon,
              height: 32.adaptSize,
              width: 32.adaptSize,
            ),
            activeIcon: CustomImageView(
              imagePath: bottomMenuList[index].activeIcon,
              height: 32.adaptSize,
              width: 32.adaptSize,
              color: appTheme.blueGray400,
            ),
            label: '',
          );
        }),
        onTap: (index) {
          selectedIndex = index;
          widget.onChanged?.call(bottomMenuList[index].type);
          setState(() {});
        },
      ),
    );
  }
}

enum BottomBarEnum {
  English,
  Image16,
  Image13,
  Stronglogo,
  Notify,
}

class BottomMenuModel {
  BottomMenuModel({
    required this.icon,
    required this.activeIcon,
    required this.type,
  });

  String icon;

  String activeIcon;

  BottomBarEnum type;
}

class DefaultWidget extends StatelessWidget {
  const DefaultWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(10),
      child: const Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Please replace the respective Widget here',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
