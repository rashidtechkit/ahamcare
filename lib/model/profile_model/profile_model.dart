class ProfileModel {
  ProfileModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phoneNo,
    required this.password,
    required this.v,
    required this.updatedAt,
    required this.profilePicture,
  });

  String id;
  String name;
  String email;
  String phoneNo;
  String password;
  int v;
  DateTime updatedAt;
  String profilePicture;

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        id: json["_id"],
        name: json["name"],
        email: json["email"],
        phoneNo: json["phone_no"],
        password: json["password"],
        v: json["__v"],
        updatedAt: DateTime.parse(json["updatedAt"]),
        profilePicture: json["profilePicture"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "email": email,
        "phone_no": phoneNo,
        "password": password,
        "__v": v,
        "updatedAt": updatedAt.toIso8601String(),
        "profilePicture": profilePicture,
      };
}
