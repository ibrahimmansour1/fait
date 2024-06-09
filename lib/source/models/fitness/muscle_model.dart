class MuscleModel {
  String? name;
  String? image;
  bool? isMain;

  MuscleModel({this.name, this.image, this.isMain});

  MuscleModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    image = json['image'];
    isMain = json['isMain'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['image'] = image;
    data['isMain'] = isMain;
    return data;
  }
}
