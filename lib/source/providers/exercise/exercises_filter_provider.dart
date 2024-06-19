import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final exercisesFilterProvider =
    ChangeNotifierProvider<ExercisesFilterNotifier>((ref) {
  return ExercisesFilterNotifier(ref);
});

class ExercisesFilterNotifier extends ChangeNotifier {
  Ref ref;
  late List<String> muscles;
  late List<String> equipments;
  late List<String> types;
  late List<String> difficulty;
  ExercisesFilterNotifier(this.ref) {
    muscles = [];
    equipments = [];
    types = [];
    difficulty = [];
  }

  toggleMuscle(String muscle) {
    if (muscles.contains(muscle)) {
      muscles.remove(muscle);
    } else {
      if (muscle == "All" || muscles.contains("All")) {
        muscles.clear();
      }
      muscles.add(muscle);
    }
    notifyListeners();
  }

  toggleEquipment(String equipment) {
    if (equipments.contains(equipment)) {
      equipments.remove(equipment);
    } else {
      if (equipment == "All" || equipments.contains("All")) {
        equipments.clear();
      }
      equipments.add(equipment);
    }
    notifyListeners();
  }

  toggleType(String type) {
    if (types.contains(type)) {
      types.remove(type);
    } else {
      if (type == "All" || types.contains("All")) {
        types.clear();
      }
      types.add(type);
    }
    notifyListeners();
  }

  toggleDifficulty(String newDifficulty) {
    if (difficulty.contains(newDifficulty)) {
      difficulty.remove(newDifficulty);
    } else {
      if (newDifficulty == "All" || difficulty.contains("All")) {
        difficulty.clear();
      }
      difficulty.add(newDifficulty);
    }
    notifyListeners();
  }

  reset() {
    muscles.clear();
    equipments.clear();
    types.clear();
    difficulty.clear();
    notifyListeners();
  }
}
