// import 'package:responsive_sizer/responsive_sizer.dart';

// API
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

const String baseUrl = "http://fait2024-001-site1.gtempurl.com/api/v1/";
const String baseUrl2 = "http://fait.runasp.net/api/v1/";
const String bearerToken = "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYW1laWQiOiJFc2xhbTI1IiwiaHR0cDovL3NjaGVtYXMueG1sc29hcC5vcmcvd3MvMjAwNS8wNS9pZGVudGl0eS9jbGFpbXMvc2lkIjoiMmEwZmE3ZmEtNDI4NS00YjE3LTEyZmEtMDhkYzkyYjY3MzJkIiwibmJmIjoxNzE5MDg3MTM5LCJleHAiOjE3MTkwODk4MzksImlhdCI6MTcxOTA4NzEzOX0.QxtmM-lKAazIN4iMMYLorqH57h9f5kxKPfmc0aluiTw";
const String authUsername = "11173799";
const String authPassword = "60-dayfreetrial";

// Screen Size
// const double SCREEN_HIEGHT = 926;
// const double SCREEN_WIDTH = 428;

// double getResponsiveHieght(double hieght) {
//   return ((hieght * 100) / SCREEN_HIEGHT).h;
// }

// double getResponsiveWidth(double width) {
//   return ((width * 100) / SCREEN_WIDTH).w;
// }

// Animation
const animationDuration = Duration(milliseconds: 300);

Future<bool> getPermissionStatus(
    BuildContext context, Permission permission, String permissionName) async {
  PermissionStatus status = await permission.request();
  if (status == PermissionStatus.granted) {
    return true;
  } else {
    // Show dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Directionality(
            textDirection: TextDirection.ltr,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  'You need to give the $permissionName permission to the app. Please go to the app settings.',
                  style: const TextStyle(fontSize: 18, color: Colors.black),
                ),
                Align(
                  alignment: AlignmentDirectional.bottomEnd,
                  child: TextButton(
                    child: const Text(
                      'Go to App Settings',
                      style: TextStyle(color: Colors.lightBlue, fontSize: 18),
                    ),
                    onPressed: () {
                      openAppSettings();
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
  return false;
}
