
class HomeModel {
    HomeModel({
        required this.id,
        required this.name,
        required this.discription,
        required this.status,
        required this.order,
        required this.createdAt,
        required this.updatedAt,
        required this.v,
    });

    String id;
    String name;
    String discription;
    String status;
    int order;
    DateTime createdAt;
    DateTime updatedAt;
    int v;

    factory HomeModel.fromJson(Map<String, dynamic> json) => HomeModel(
        id: json["_id"],
        name: json["name"],
        discription: json["discription"],
        status: json["status"],
        order: json["order"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "discription": discription,
        "status": status,
        "order": order,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
    };
}
