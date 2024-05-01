class FitnessPlanWorkoutModel {
  int? workoutId;
  String? name;
  int? numberOfExercises;
  String? playDate;
  int? weightLifted;
  int? durationInMinutes;

  FitnessPlanWorkoutModel(
      {this.workoutId,
      this.name,
      this.numberOfExercises,
      this.playDate,
      this.weightLifted,
      this.durationInMinutes});

  FitnessPlanWorkoutModel.fromJson(Map<String, dynamic> json) {
    workoutId = json['workoutId'];
    name = json['name'];
    numberOfExercises = json['numberOfExercises'];
    playDate = json['playDate'];
    weightLifted = json['weightLifted'];
    durationInMinutes = json['durationInMinutes'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['workoutId'] = workoutId;
    data['name'] = name;
    data['numberOfExercises'] = numberOfExercises;
    data['playDate'] = playDate;
    data['weightLifted'] = weightLifted;
    data['durationInMinutes'] = durationInMinutes;
    return data;
  }
}
