import 'package:flutter/material.dart';
import 'package:fait/utils/app_export.dart';

// ignore: must_be_immutable
class CustomBottomBar extends StatefulWidget {
  CustomBottomBar({super.key, this.onChanged});

  Function(BottomBarEnum)? onChanged;

  @override
  CustomBottomBarState createState() => CustomBottomBarState();
}

class CustomBottomBarState extends State<CustomBottomBar> {
  int selectedIndex = 2;

  List<BottomMenuModel> bottomMenuList = [
    BottomMenuModel(
      icon: ImageConstant.imgProfileIcone,
      activeIcon: ImageConstant.imgProfileIcone,
      type: BottomBarEnum.profile,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgFitnessIcon,
      activeIcon: ImageConstant.imgFitnessIcon,
      type: BottomBarEnum.fitness,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgHomeIcon,
      activeIcon: ImageConstant.imgHomeIcon,
      type: BottomBarEnum.home,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgDietIcon,
      activeIcon: ImageConstant.imgDietIcon,
      type: BottomBarEnum.diet,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgNotify,
      activeIcon: ImageConstant.imgNotify,
      type: BottomBarEnum.notifications,
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
              height: bottomMenuList[index].type == BottomBarEnum.home
                  ? 48.adaptSize
                  : 32.adaptSize,
              width: bottomMenuList[index].type == BottomBarEnum.home
                  ? 48.adaptSize
                  : 32.adaptSize,
            ),
            activeIcon: CustomImageView(
              imagePath: bottomMenuList[index].activeIcon,
              height: bottomMenuList[index].type == BottomBarEnum.home
                  ? 48.adaptSize
                  : 32.adaptSize,
              width: bottomMenuList[index].type == BottomBarEnum.home
                  ? 48.adaptSize
                  : 32.adaptSize,
              color: bottomMenuList[index].type == BottomBarEnum.home
                  ? null
                  : theme.colorScheme.primary,
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
  profile,
  fitness,
  home,
  diet,
  notifications,
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
