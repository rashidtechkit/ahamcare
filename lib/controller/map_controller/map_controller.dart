import 'dart:developer';

import 'package:ahamcare/model/map_model/map_model.dart';
import 'package:ahamcare/services/map_service/map_service.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MapController extends ChangeNotifier {
  GoogleMapController? mapController;
  LatLng oldAgeMap = const LatLng(45.521563, -122.677433);
  LatLng orphanageMap = const LatLng(10.1632, 76.6413);
  Location location = Location();
  LocationData? currentLocation;
  // Set<Marker> markers = {};
  List<MarkerModel> _markerList = [];
  List<MarkerModel> get markerList => _markerList;

  // void addMarkers() {
  //   markers.add(
  //     Marker(
  //       markerId: const MarkerId('marker1'),
  //       position: const LatLng(37.77483, -122.41942),
  //       infoWindow: const InfoWindow(
  //         title: 'Golden Gate Bridge',
  //         snippet: 'San Francisco, CA',
  //       ),
  //       icon: BitmapDescriptor.defaultMarker,
  //       onTap: () {
  //         onMarkerTapped('marker1');
  //       },
  //     ),
  //   );
  //   markers.add(
  //     Marker(
  //       markerId: const MarkerId('marker2'),
  //       position: const LatLng(40.68925, -74.0445),
  //       infoWindow: const InfoWindow(
  //         title: 'Statue of Liberty',
  //         snippet: 'New York, NY',
  //       ),
  //       icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
  //       onTap: () {
  //         onMarkerTapped('marker2');
  //       },
  //     ),
  //   );
  // }

  void onMapCreated(controller) {
    mapController = controller;
    log(currentLocation.toString());
    notifyListeners();
  }

  // void onMarkerTapped(String markerId) async {
  //   final controller = mapController;
  //   for (var marker in markers) {
  //     if (marker.markerId.value == markerId) {
  //       controller!.showMarkerInfoWindow(marker.markerId);
  //     }
  //   }
  // }

  void getMarker(context) async {
    final model = MarkerModel(
      lat: currentLocation!.latitude!,
      lng: currentLocation!.longitude!,
    );
    await MapService().getLocation(model, context).then((value) {
      if (value != null) {
        _markerList = value;
      }
    });
  }

  void getLocation(context) async {
    bool serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    PermissionStatus permissionStatus = await location.hasPermission();
    if (permissionStatus == PermissionStatus.denied) {
      permissionStatus = await location.requestPermission();
      if (permissionStatus != PermissionStatus.granted) {
        return;
      }
    }

    currentLocation = await location.getLocation();

    currentLocation = currentLocation;
    getMarker(context);
    notifyListeners();
  }
}
