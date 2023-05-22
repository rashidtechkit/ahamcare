import 'dart:io';

class PostSocialModel {
  final File photo;
  final String description;

  PostSocialModel({
    required this.photo,
    required this.description,
  });

  Map<String, dynamic> toJson() {
    return {
      'image': photo,
      'discription': description,
    };
  }
}
