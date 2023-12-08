import 'package:fait/source/app.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Future.delayed(const Duration(
      seconds: 1)); 
  runApp(const MyApp());
}
