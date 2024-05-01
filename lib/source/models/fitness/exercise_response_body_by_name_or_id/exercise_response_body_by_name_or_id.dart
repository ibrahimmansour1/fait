import 'package:json_annotation/json_annotation.dart';
part 'exercise_response_body_by_name_or_id.g.dart';

@JsonSerializable()
class ExerciseResponseBodyByNameOrId {
  int? id;
  String? name;
  String? image;
  String? steps;
  int? category;
  int? difficulty;
  int? mechanism;
  int? tool;

  ExerciseResponseBodyByNameOrId({
    this.id,
    this.name,
    this.image,
    this.steps,
    this.category,
    this.difficulty,
    this.mechanism,
    this.tool,
  });

  factory ExerciseResponseBodyByNameOrId.fromJson(Map<String, dynamic> json) {
    return _$ExerciseResponseBodyByNameOrIdFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ExerciseResponseBodyByNameOrIdToJson(this);
  }
}
