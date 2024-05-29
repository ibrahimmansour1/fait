import 'package:json_annotation/json_annotation.dart';

part 'exercise_response_body.g.dart';

@JsonSerializable()
class ExerciseResponseBody {
  int? id;
  String? name;
  String? image;
  bool? isInFavorite;
  int? steps;

  ExerciseResponseBody(
      {this.id, this.name, this.image, this.isInFavorite, this.steps});

  factory ExerciseResponseBody.fromJson(Map<String, dynamic> json) {
    return _$ExerciseResponseBodyFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ExerciseResponseBodyToJson(this);
}
