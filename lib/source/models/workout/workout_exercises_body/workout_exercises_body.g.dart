// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout_exercises_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WorkoutExercisesBody _$WorkoutExercisesBodyFromJson(
        Map<String, dynamic> json) =>
    WorkoutExercisesBody(
      workoutExerciseId: (json['workoutExerciseId'] as num?)?.toInt(),
      exerciseId: (json['exerciseId'] as num?)?.toInt(),
      sets: (json['sets'] as num?)?.toInt(),
      reps: (json['reps'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
      durationInMinutes: (json['durationInMinutes'] as num?)?.toInt(),
      restInSeconds: (json['restInSeconds'] as num?)?.toInt(),
      image: json['image'] as String?,
      isInFavorite: json['isInFavorite'] as bool?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$WorkoutExercisesBodyToJson(
        WorkoutExercisesBody instance) =>
    <String, dynamic>{
      'workoutExerciseId': instance.workoutExerciseId,
      'exerciseId': instance.exerciseId,
      'sets': instance.sets,
      'reps': instance.reps,
      'durationInMinutes': instance.durationInMinutes,
      'restInSeconds': instance.restInSeconds,
      'image': instance.image,
      'isInFavorite': instance.isInFavorite,
      'name': instance.name,
    };
