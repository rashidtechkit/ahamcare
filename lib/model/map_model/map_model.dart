// class MapModel {
//     MapModel({
//         required this.name,
//         required this.address,
//         required this.rating,
//         required this.location,
//     });

//     String name;
//     String address;
//     double rating;
//     Location location;

//     factory MapModel.fromJson(Map<String, dynamic> json) => MapModel(
//         name: json["name"],
//         address: json["address"],
//         rating: json["rating"]?.toDouble(),
//         location: Location.fromJson(json["location"]),
//     );

//     Map<String, dynamic> toJson() => {
//         "name": name,
//         "address": address,
//         "rating": rating,
//         "location": location.toJson(),
//     };
// }

class MarkerModel {
  MarkerModel({
    required this.lat,
    required this.lng,
  });

  double lat;
  double lng;

  factory MarkerModel.fromJson(Map<String, dynamic> json) => MarkerModel(
        lat: json['location']["lat"],
        lng: json['location']["lng"],
      );

  Map<String, dynamic> toJson() => {
        "LocationData": {
          "lat": lat,
          "lng": lng,
        },
      };
}
