class OrdersModel {
  OrdersModel({
    required this.organaizationId,
    required this.userId,
    required this.totalPrice,
    required this.transactionId,
    required this.requirmentId,
    required this.paymentType,
    required this.products,
  });

  String organaizationId;
  String userId;
  String totalPrice;
  String transactionId;
  String requirmentId;
  String paymentType;
  List<Product> products;

  Map<String, dynamic> toJson() => {
        "organaizationId": organaizationId,
        "userId": userId,
        "totalPrice": totalPrice,
        "transactionId": transactionId,
        "requirmentId": requirmentId,
        "paymentType": paymentType,
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
      };
}

class Product {
  Product({
    required this.id,
  });

  String id;

  Map<String, dynamic> toJson() => {
        "id": id,
      };
}
