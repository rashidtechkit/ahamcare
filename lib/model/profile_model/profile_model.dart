class ProfileModel {
  String id;
  String name;
  String email;
  String phoneNo;
  String password;
  DateTime createdAt;
  DateTime updatedAt;
  int v;
  String? aadharNo;
  String? address;
  String? dateOfBirth;
  String? panCardNo;
  String? work;
  String? profilePicture;

  ProfileModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phoneNo,
    required this.password,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    this.aadharNo,
    this.address,
    this.dateOfBirth,
    this.panCardNo,
    this.work,
    this.profilePicture,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        id: json["_id"],
        name: json["name"],
        email: json["email"],
        phoneNo: json["phone_no"],
        password: json["password"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        aadharNo: json["aadharNo"],
        address: json["address"],
        dateOfBirth: json["dateOfBirth"],
        panCardNo: json["panCardNo"],
        work: json["work"],
        profilePicture: json["profilePicture"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "email": email,
        "phone_no": phoneNo,
        "password": password,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
        "aadharNo": aadharNo,
        "address": address,
        "dateOfBirth": dateOfBirth,
        "panCardNo": panCardNo,
        "work": work,
        "profilePicture": profilePicture,
      };
}
