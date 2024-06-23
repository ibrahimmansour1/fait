class ProfileModel {
  String? id;
  String? firstName;
  String? lastName;
  String? nickName;
  String? userName;
  String? email;
  String? image;
  String? bio;

  ProfileModel({
    this.id,
    this.firstName,
    this.lastName,
    this.nickName,
    this.userName,
    this.email,
    this.image,
    this.bio,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      id: json['id'] ?? "",
      firstName: json['firstName'] ?? "",
      lastName: json['lastName'] ?? "",
      nickName: json['nickName'] ?? "",
      userName: json['userName'] ?? "",
      email: json['email'] ?? "",
      image: json['image'] ?? "",
      bio: json['bio'] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'nickName': nickName,
      'userName': userName,
      'email': email,
      'image': image,
      'bio': bio,
    };
  }
}