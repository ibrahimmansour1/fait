class WrongStepModel {
  String? text;
  String? model3D;

  WrongStepModel({this.text, this.model3D});

  WrongStepModel.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    model3D = json['model3D'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['text'] = text;
    data['model3D'] = model3D;
    return data;
  }
}
