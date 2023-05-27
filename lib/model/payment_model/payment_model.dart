// To parse this JSON data, do
//
//     final paymentmodel = paymentmodelFromJson(jsonString);

import 'dart:convert';

EventPaymentmodel paymentmodelFromJson(String str) =>
    EventPaymentmodel.fromJson(json.decode(str));

String paymentmodelToJson(EventPaymentmodel data) => json.encode(data.toJson());

class EventPaymentmodel {
  String storeId;
  int count;
  String paymentId;

  EventPaymentmodel({
    required this.storeId,
    required this.count,
    required this.paymentId,
  });

  factory EventPaymentmodel.fromJson(Map<String, dynamic> json) =>
      EventPaymentmodel(
        storeId: json["storeId"],
        count: json["count"],
        paymentId: json["paymentId"],
      );

  Map<String, dynamic> toJson() => {
        "storeId": storeId,
        "count": count,
        "paymentId": paymentId,
      };
}
