class SocialModel {
  SocialModel({
    required this.id,
    required this.userId,
    this.image,
    this.discription,
    required this.like,
    required this.dislike,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  String id;
  String userId;
  String? image;
  String? discription;
  List<dynamic> like;
  List<dynamic> dislike;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  factory SocialModel.fromJson(Map<String, dynamic> json) => SocialModel(
        id: json["_id"],
        userId: json["userId"],
        image: json["image"] != null ? json["image"] : '',
        discription: json["discription"] != null ? json["discription"] : '',
        like: List<dynamic>.from(json["like"].map((x) => x)),
        dislike: List<dynamic>.from(json["dislike"].map((x) => x)),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "userId": userId,
        "image": image,
        "discription": discription,
        "like": List<dynamic>.from(like.map((x) => x)),
        "dislike": List<dynamic>.from(dislike.map((x) => x)),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
      };
}
