class EventModel {
  EventModel({
    required this.id,
    required this.event,
    required this.discription,
    required this.totalTickets,
    required this.startDateTime,
    required this.endDateTime,
    required this.remainingTickets,
    required this.totalPrice,
    required this.unitPrice,
    required this.status,
    required this.donations,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  String id;
  String event;
  String discription;
  dynamic totalTickets;
  dynamic startDateTime;
  dynamic endDateTime;
  dynamic remainingTickets;
  dynamic totalPrice;
  dynamic unitPrice;
  String status;
  List<String> donations;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic v;

  factory EventModel.fromJson(Map<String, dynamic> json) => EventModel(
        id: json["_id"],
        event: json["event"],
        discription: json["discription"],
        totalTickets: json["totalTickets"],
        startDateTime: json["startDateTime"],
        endDateTime: json["endDateTime"],
        remainingTickets: json["remainingTickets"],
        totalPrice: json["totalPrice"],
        unitPrice: json["unitPrice"],
        status: json["status"],
        donations: List<String>.from(json["donations"].map((x) => x)),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "event": event,
        "discription": discription,
        "totalTickets": totalTickets,
        "startDateTime": startDateTime.toIso8601String(),
        "endDateTime": endDateTime.toIso8601String(),
        "remainingTickets": remainingTickets,
        "totalPrice": totalPrice,
        "unitPrice": unitPrice,
        "status": status,
        "donations": List<dynamic>.from(donations.map((x) => x)),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
      };
}
