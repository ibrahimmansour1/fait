class DietModel {
  int? dietId;
  int? numberOfRecipes;
  int? numberOfDays;
  String? image;
  bool? isFavourite;

  DietModel(
      {this.dietId,
      this.numberOfRecipes,
      this.numberOfDays,
      this.image,
      this.isFavourite});

  DietModel.fromJson(Map<String, dynamic> json) {
    dietId = json['dietId'];
    numberOfRecipes = json['numberOfRecipes'];
    numberOfDays = json['numberOfDays'];
    image = json['image'];
    isFavourite = json['isFavourite'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dietId'] = this.dietId;
    data['numberOfRecipes'] = this.numberOfRecipes;
    data['numberOfDays'] = this.numberOfDays;
    data['image'] = this.image;
    data['isFavourite'] = this.isFavourite;
    return data;
  }
}