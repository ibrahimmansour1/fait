// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exercise_response_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExerciseResponseBody _$ExerciseResponseBodyFromJson(
        Map<String, dynamic> json) =>
    ExerciseResponseBody(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      image: json['image'] as String?,
      isInFavorite: json['isInFavorite'] as bool?,
    );

Map<String, dynamic> _$ExerciseResponseBodyToJson(
        ExerciseResponseBody instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
      'isInFavorite': instance.isInFavorite,
    };
