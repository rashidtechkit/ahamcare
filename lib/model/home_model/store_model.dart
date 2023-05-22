class StoreModel {
  StoreModel({
    required this.id,
    required this.item,
    required this.discription,
    required this.requirement,
    required this.unit,
    required this.unitPrice,
    required this.totalPrice,
    required this.remaining,
    required this.status,
    required this.donations,
    required this.photo,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.needs,
  });

  String id;
  String item;
  String discription;
  dynamic requirement;
  String unit;
  dynamic unitPrice;
  dynamic totalPrice;
  dynamic remaining;
  String status;
  List<dynamic> donations;
  String? photo;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic v;
  dynamic needs;

  factory StoreModel.fromJson(Map<String, dynamic> json) => StoreModel(
        id: json["_id"],
        item: json["item"],
        discription: json["discription"],
        requirement: json["requirement"],
        unit: json["unit"],
        unitPrice: json["unitPrice"],
        totalPrice: json["totalPrice"],
        remaining: json["remaining"],
        status: json["status"],
        donations: List<dynamic>.from(json["donations"].map((x) => x)),
        
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        needs: json["needs"], photo: json["photo"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "item": item,
        "discription": discription,
        "requirement": requirement,
        "unit": unit,
        "unitPrice": unitPrice,
        "totalPrice": totalPrice,
        "remaining": remaining,
        "status": status,
        "donations": List<dynamic>.from(donations.map((x) => x)),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
        "needs": needs,
      };
}
