import 'package:json_annotation/json_annotation.dart';

part 'workout_exercises_body.g.dart';

@JsonSerializable()
class WorkoutExercisesBody {
  int? workoutExerciseId;
  int? exerciseId;
  int? sets;
  List<int>? reps;
  int? durationInMinutes;
  int? restInSeconds;
  String? image;
  bool? isInFavorite;
  String? name;

  WorkoutExercisesBody({
    this.workoutExerciseId,
    this.exerciseId,
    this.sets,
    this.reps,
    this.durationInMinutes,
    this.restInSeconds,
    this.image,
    this.isInFavorite,
    this.name,
  });

  factory WorkoutExercisesBody.fromJson(Map<String, dynamic> json) {
    return _$WorkoutExercisesBodyFromJson(json);
  }

  Map<String, dynamic> toJson() => _$WorkoutExercisesBodyToJson(this);
}
