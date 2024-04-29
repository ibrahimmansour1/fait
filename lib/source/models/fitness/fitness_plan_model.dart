class FitnessPlanModel {
  int? id;
  String? name;
  String? nextPlayDate;
  int? stretch;
  int? strength;
  int? cardio;
  int? caloriesBurned;
  int? weightLifted;
  int? duration;
  bool? isSelected;
  String? image;
  int? numberOfExercises;
  int? numberOfWorkouts;
  bool? isInFavorite;

  FitnessPlanModel({
    this.id,
    this.name,
    this.nextPlayDate,
    this.stretch,
    this.strength,
    this.cardio,
    this.caloriesBurned,
    this.weightLifted,
    this.duration,
    this.isSelected,
    this.image,
    this.numberOfExercises,
    this.numberOfWorkouts,
    this.isInFavorite,
  });

  FitnessPlanModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    nextPlayDate = json['nextPlayDate'];
    stretch = json['stretch'];
    strength = json['strength'];
    cardio = json['cardio'];
    caloriesBurned = json['caloriesBurned'];
    weightLifted = json['weightLifted'];
    duration = json['duration'];
    isSelected = json['isSelected'];
    image = json['image'];
    numberOfExercises = json['numberOfExercises'];
    numberOfWorkouts = json['numberOfWorkouts'];
    isInFavorite = json['isInFavorite'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['nextPlayDate'] = nextPlayDate;
    data['stretch'] = stretch;
    data['strength'] = strength;
    data['cardio'] = cardio;
    data['caloriesBurned'] = caloriesBurned;
    data['weightLifted'] = weightLifted;
    data['duration'] = duration;
    data['isSelected'] = isSelected;
    data['image'] = image;
    data['numberOfExercises'] = numberOfExercises;
    data['numberOfWorkouts'] = numberOfWorkouts;
    data['isInFavorite'] = isInFavorite;
    return data;
  }
}