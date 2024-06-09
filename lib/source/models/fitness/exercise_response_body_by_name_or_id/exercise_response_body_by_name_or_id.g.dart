// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exercise_response_body_by_name_or_id.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExerciseResponseBodyByNameOrId _$ExerciseResponseBodyByNameOrIdFromJson(
        Map<String, dynamic> json) =>
    ExerciseResponseBodyByNameOrId(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      image: json['image'] as String?,
      steps: json['steps'] as String?,
      category: (json['category'] as num?)?.toInt(),
      difficulty: (json['difficulty'] as num?)?.toInt(),
      mechanism: (json['mechanism'] as num?)?.toInt(),
      tool: (json['tool'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ExerciseResponseBodyByNameOrIdToJson(
        ExerciseResponseBodyByNameOrId instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
      'steps': instance.steps,
      'category': instance.category,
      'difficulty': instance.difficulty,
      'mechanism': instance.mechanism,
      'tool': instance.tool,
    };
