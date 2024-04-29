import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:fait/source/models/fitness/fitness_plan_model.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../../utils/constants.dart';

class FitnessPlanService {
  final intenetChecker = InternetConnectionChecker();

  getFitnessPlan() async {
    try {
      if (await intenetChecker.hasConnection) {
        final dio = Dio();
        final response = await dio.get(
          "${baseUrl}FitnessPlan",
          options: Options(headers: {
            "Content-Type": "application/json",
          }),
        );
        if (response.statusCode == 200 || response.statusCode == 201) {
          final data = jsonDecode(response.data);
          if (data.isEmpty) {
            return "No data found";
          }
          final fitnessPlanModel = FitnessPlanModel.fromJson(data[0]);
          return fitnessPlanModel;
        } else {
          return "Failed to load data";
        }
      } else {
        return "No Internet Connection";
      }
    } catch (e) {
      log(e.toString());
      return "Something went wrong";
    }
  }
}
