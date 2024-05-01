// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout_response_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WorkoutResponseBody _$WorkoutResponseBodyFromJson(Map<String, dynamic> json) =>
    WorkoutResponseBody(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      nextPlayDate: json['nextPlayDate'] == null
          ? null
          : DateTime.parse(json['nextPlayDate'] as String),
      stretch: (json['stretch'] as num?)?.toInt(),
      strength: (json['strength'] as num?)?.toInt(),
      cardio: (json['cardio'] as num?)?.toInt(),
      caloriesBurned: (json['caloriesBurned'] as num?)?.toInt(),
      weightLifted: (json['weightLifted'] as num?)?.toInt(),
      duration: (json['duration'] as num?)?.toInt(),
    );

Map<String, dynamic> _$WorkoutResponseBodyToJson(
        WorkoutResponseBody instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'nextPlayDate': instance.nextPlayDate?.toIso8601String(),
      'stretch': instance.stretch,
      'strength': instance.strength,
      'cardio': instance.cardio,
      'caloriesBurned': instance.caloriesBurned,
      'weightLifted': instance.weightLifted,
      'duration': instance.duration,
    };
