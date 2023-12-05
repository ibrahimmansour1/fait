import 'dart:io';

import 'package:fait/source/theme/theme_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerHandler {
  late File _image;

  ImagePickerHandler({required void Function(File) onImageChanged})
      : _onImageChanged = onImageChanged;

  final void Function(File) _onImageChanged;

  Future<void> pickImage(BuildContext context) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      _image = File(pickedFile.path);
      _onImageChanged(_image);
    }
  }

  Future<void> pickImageFromCamera(BuildContext context) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      _image = File(pickedFile.path);
      _onImageChanged(_image);
    }
  }

  Future<void> showOptions(BuildContext context) async {
    showCupertinoModalPopup(
      context: context,
      builder: (context) => CupertinoActionSheet(
        actions: [
          Container(
            color: Colors.black,
            child: CupertinoActionSheetAction(
              child: Text(
                'Photo Gallery',
                style: TextStyle(color: theme.colorScheme.primary),
              ),
              onPressed: () {
                Navigator.of(context).pop();
                pickImage(context);
              },
            ),
          ),
          Container(
            color: Colors.black,
            child: CupertinoActionSheetAction(
              child: Text(
                'Camera',
                style: TextStyle(color: theme.colorScheme.primary),
              ),
              onPressed: () {
                Navigator.of(context).pop();
                pickImageFromCamera(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
