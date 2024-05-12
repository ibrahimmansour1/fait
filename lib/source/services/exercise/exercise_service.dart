import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:fait/source/models/fitness/exercise_response_body/exercise_response_body.dart';
import 'package:fait/source/models/fitness/exercise_response_body_by_name_or_id/exercise_response_body_by_name_or_id.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../../utils/constants.dart';
import '../../api/api_response.dart';

class ExerciseService {
  final internetChecker = InternetConnectionChecker();
  final dio = Dio();
  Future<ApiResponse<List<ExerciseResponseBody>>> getExercises() async {
    try {
      if (await internetChecker.hasConnection) {
        final response = await dio.get(
          "${baseUrl}Exercise?PageIndex=0&PageSize=100",
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
          log("data is: ${response.data}");
          final exerciseModel = (response.data as List)
              .map((item) => ExerciseResponseBody.fromJson(item))
              .toList();
          return ApiResponse.completed(exerciseModel);
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

  Future<ApiResponse<ExerciseResponseBodyByNameOrId>> getExerciseByIdOrName(
      {int? id, String? name}) async {
    try {
      if (await internetChecker.hasConnection) {
        name ??= "";
        log("url: ${baseUrl}Exercise/$id$name");
        final response = await dio.get(
          "${baseUrl}Exercise/$id$name",
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
          final exerciseModel =
              ExerciseResponseBodyByNameOrId.fromJson(response.data);
          return ApiResponse.completed(exerciseModel);
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
  // TODO: the favorite list is null in the response and thats why i cannot make the model
  // Future<ApiResponse<MyFavoriteExerciseResponse>>
  //     getMyFavoriteExercise() async {
  //   try {
  //     if (await internetChecker.hasConnection) {
  //       final response = await dio.get(
  //         "${baseUrl}Exercise/MyFavoriteExercise",
  //         options: Options(
  //           headers: {
  //             "Content-Type": "application/json",
  //             "Authorization":
  //                 "Basic ${base64Encode(utf8.encode("$authUsername:$authPassword"))}",
  //           },
  //         ),
  //       );
  //       if (response.statusCode == 200 || response.statusCode == 201) {
  //         if (response.data.isEmpty) {
  //           return ApiResponse.error("No data found", response.statusCode);
  //         }
  //         final data = jsonDecode(response.data);
  //         final exerciseModel = MyFavoriteExerciseResponse.fromJson(data[0]);
  //         return ApiResponse.completed(exerciseModel);
  //       } else {
  //         return ApiResponse.error("Failed to load data", response.statusCode);
  //       }
  //     } else {
  //       return ApiResponse.error("No Internet Connection", 503);
  //     }
  //   } catch (e) {
  //     log(e.toString());
  //     return ApiResponse.error(e.toString(), 0);
  //   }
  // }
}
