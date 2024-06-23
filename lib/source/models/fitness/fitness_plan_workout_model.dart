class FitnessPlanWorkoutModel {
  int? workoutId;
  String? name;
  int? numberOfExercises;
  String? playDate;
  int? weightLifted;
  int? durationInMinutes;
  int? calories; // New field for calories
  String? image; // New field for image

  FitnessPlanWorkoutModel({
    this.workoutId,
    this.name,
    this.numberOfExercises,
    this.playDate,
    this.weightLifted,
    this.durationInMinutes,
    this.calories,
    this.image,
  });

  FitnessPlanWorkoutModel.fromJson(Map<String, dynamic> json) {
    workoutId = json['workoutId'];
    name = json['name'];
    numberOfExercises = json['numberOfExercises'];
    playDate = json['playDate'];
    weightLifted = json['weightLifted'];
    durationInMinutes = json['durationInMinutes'];
    calories = json['calories']; // Update to include calories field
    image = json['image']; // Update to include image field
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['workoutId'] = workoutId;
    data['name'] = name;
    data['numberOfExercises'] = numberOfExercises;
    data['playDate'] = playDate;
    data['weightLifted'] = weightLifted;
    data['durationInMinutes'] = durationInMinutes;
    data['calories'] = calories; // Update to include calories field
    data['image'] = image; // Update to include image field
    return data;
  }
}
