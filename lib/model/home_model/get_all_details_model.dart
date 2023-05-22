class AllDetailsModel {
  String id;
  String name;
  String type;
  String typeId;
  String address;
  String photo;
  String discription;
  List<dynamic> galleryPhotos;
  List<Residence> residence;
  List<Requirement> requirement;
  String documents;
  String email;
  String phone;
  String place;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  AllDetailsModel({
    required this.id,
    required this.name,
    required this.type,
    required this.typeId,
    required this.address,
    required this.photo,
    required this.discription,
    required this.galleryPhotos,
    required this.residence,
    required this.requirement,
    required this.documents,
    required this.email,
    required this.phone,
    required this.place,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory AllDetailsModel.fromJson(Map<String, dynamic> json) =>
      AllDetailsModel(
        id: json["_id"],
        name: json["name"],
        type: json["type"],
        typeId: json["typeId"],
        address: json["address"],
        photo: json["photo"],
        discription: json["discription"],
        galleryPhotos: List<dynamic>.from(json["galleryPhotos"].map((x) => x)),
        residence: List<Residence>.from(
            json["residence"].map((x) => Residence.fromJson(x))),
        requirement: List<Requirement>.from(
            json["requirement"].map((x) => Requirement.fromJson(x))),
        documents: json["documents"],
        email: json["email"],
        phone: json["phone"],
        place: json["place"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "type": type,
        "typeId": typeId,
        "address": address,
        "photo": photo,
        "discription": discription,
        "galleryPhotos": List<dynamic>.from(galleryPhotos.map((x) => x)),
        "residence": List<dynamic>.from(residence.map((x) => x.toJson())),
        "requirement": List<dynamic>.from(requirement.map((x) => x.toJson())),
        "documents": documents,
        "email": email,
        "phone": phone,
        "place": place,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
      };
}

class Requirement {
  String id;
  String organization;
  String item;
  int requirement;
  String requirementUnit;
  int totalPrice;
  int unitPrice;
  String needs;
  DateTime createdAt;
  DateTime updatedAt;
  int v;
  String status;

  Requirement({
    required this.id,
    required this.organization,
    required this.item,
    required this.requirement,
    required this.requirementUnit,
    required this.totalPrice,
    required this.unitPrice,
    required this.needs,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.status,
  });

  factory Requirement.fromJson(Map<String, dynamic> json) => Requirement(
        id: json["_id"],
        organization: json["organization"],
        item: json["item"],
        requirement: json["requirement"],
        requirementUnit: json["requirementUnit"],
        totalPrice: json["totalPrice"],
        unitPrice: json["unitPrice"],
        needs: json["needs"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "organization": organization,
        "item": item,
        "requirement": requirement,
        "requirementUnit": requirementUnit,
        "totalPrice": totalPrice,
        "unitPrice": unitPrice,
        "needs": needs,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
        "status": status,
      };
}

class Residence {
  String id;
  String organaization;
  String name;
  int age;
  String place;
  String photo;
  String status;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  Residence({
    required this.id,
    required this.organaization,
    required this.name,
    required this.age,
    required this.place,
    required this.photo,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory Residence.fromJson(Map<String, dynamic> json) => Residence(
        id: json["_id"],
        organaization: json["organaization"],
        name: json["name"],
        age: json["age"],
        place: json["place"],
        photo: json["photo"],
        status: json["status"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "organaization": organaization,
        "name": name,
        "age": age,
        "place": place,
        "photo": photo,
        "status": status,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
      };
}
