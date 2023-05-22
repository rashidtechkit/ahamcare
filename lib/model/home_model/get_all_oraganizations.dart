// To parse this JSON data, do
//
//     final getAllOrganizationsModel = getAllOrganizationsModelFromJson(jsonString);

class GetAllOrganizationsModel {
  List<dynamic> requirement;
  String id;
  String name;
  String? type;
  String typeId;
  String address;
  String photo;
  String discription;
  List<dynamic> galleryPhotos;
  List<dynamic> residence;
  String documents;
  String email;
  String phone;
  String place;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  GetAllOrganizationsModel({
    required this.requirement,
    required this.id,
    required this.name,
    this.type,
    required this.typeId,
    required this.address,
    required this.photo,
    required this.discription,
    required this.galleryPhotos,
    required this.residence,
    required this.documents,
    required this.email,
    required this.phone,
    required this.place,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory GetAllOrganizationsModel.fromJson(Map<String, dynamic> json) =>
      GetAllOrganizationsModel(
        requirement: List<dynamic>.from(json["requirement"].map((x) => x)),
        id: json["_id"],
        name: json["name"],
        type: json["type"],
        typeId: json["typeId"],
        address: json["address"],
        photo: json["photo"],
        discription: json["discription"],
        galleryPhotos: List<dynamic>.from(json["galleryPhotos"].map((x) => x)),
        residence: List<dynamic>.from(json["residence"].map((x) => x)),
        documents: json["documents"],
        email: json["email"],
        phone: json["phone"],
        place: json["place"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "requirement": List<dynamic>.from(requirement.map((x) => x)),
        "_id": id,
        "name": name,
        "type": type,
        "typeId": typeId,
        "address": address,
        "photo": photo,
        "discription": discription,
        "galleryPhotos": List<dynamic>.from(galleryPhotos.map((x) => x)),
        "residence": List<dynamic>.from(residence.map((x) => x)),
        "documents": documents,
        "email": email,
        "phone": phone,
        "place": place,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
      };
}
