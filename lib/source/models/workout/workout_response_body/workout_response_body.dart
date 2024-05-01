import 'package:json_annotation/json_annotation.dart';

part 'workout_response_body.g.dart';

@JsonSerializable()
class WorkoutResponseBody {
  int? id;
  String? name;
  DateTime? nextPlayDate;
  int? stretch;
  int? strength;
  int? cardio;
  int? caloriesBurned;
  int? weightLifted;
  int? duration;

  WorkoutResponseBody({
    this.id,
    this.name,
    this.nextPlayDate,
    this.stretch,
    this.strength,
    this.cardio,
    this.caloriesBurned,
    this.weightLifted,
    this.duration,
  });

  factory WorkoutResponseBody.fromJson(Map<String, dynamic> json) {
    return _$WorkoutResponseBodyFromJson(json);
  }

  Map<String, dynamic> toJson() => _$WorkoutResponseBodyToJson(this);
}
