import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:fait/source/api/api_response.dart';
import 'package:fait/source/models/workout/workout_exercises_body/workout_exercises_body.dart';
import 'package:fait/source/models/workout/workout_response_body/workout_response_body.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../../utils/constants.dart';

class WorkoutService {
  final internetChecker = InternetConnectionChecker();
  final dio = Dio();

  Future<ApiResponse<WorkoutResponseBody>> getWorkoutById({int? id}) async {
    try {
      if (await internetChecker.hasConnection) {
        final response = await dio.get(
          "${baseUrl}Workout/$id",
          options: Options(
            headers: {
              "Content-Type": "application/json",
              "Authorization":
                  "Basic ${base64Encode(utf8.encode("$authUsername:$authPassword"))}",
            },
          ),
        );
        if (response.statusCode == 200 || response.statusCode == 201) {
          if (response.data.isEmpty) {
            return ApiResponse.error("No data found", response.statusCode);
          }
          final data = jsonDecode(response.data);
          final workoutModel = WorkoutResponseBody.fromJson(data[0]);
          return ApiResponse.completed(workoutModel);
        } else {
          return ApiResponse.error("Failed to load data", response.statusCode);
        }
      } else {
        return ApiResponse.error("No Internet Connection", 503);
      }
    } catch (e) {
      log(e.toString());
      return ApiResponse.error(e.toString(), 0);
    }
  }

  Future<ApiResponse<WorkoutExercisesBody>> getWorkoutExercisesById(
      {int? id}) async {
    try {
      if (await internetChecker.hasConnection) {
        final response = await dio.get(
          "${baseUrl}Workout/$id/exercises",
          options: Options(
            headers: {
              "Content-Type": "application/json",
              "Authorization":
                  "Basic ${base64Encode(utf8.encode("$authUsername:$authPassword"))}",
            },
          ),
        );
        if (response.statusCode == 200 || response.statusCode == 201) {
          if (response.data.isEmpty) {
            return ApiResponse.error("No data found", response.statusCode);
          }
          final data = jsonDecode(response.data);
          final workoutExercisesModel = WorkoutExercisesBody.fromJson(data[0]);
          return ApiResponse.completed(workoutExercisesModel);
        } else {
          return ApiResponse.error("Failed to load data", response.statusCode);
        }
      } else {
        return ApiResponse.error("No Internet Connection", 503);
      }
    } catch (e) {
      log(e.toString());
      return ApiResponse.error(e.toString(), 0);
    }
  }
}
