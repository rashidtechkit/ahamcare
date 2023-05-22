class SignupModel {
  final String name;
  final String email;
  final String phone;
  final String password;

  SignupModel({
    required this.name,
    required this.email,
    required this.phone,
    required this.password,
  });

  factory SignupModel.fromJson(Map<String, dynamic> json) {
    return SignupModel(
        name: json["name"] ?? '',
        email: json["email"] ?? '',
        phone: json["phone_no"] ?? '',
        password: json["password"] ?? '');
  }
  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "email": email,
      "phone_no": phone,
      "password": password,
    };
  }
}
