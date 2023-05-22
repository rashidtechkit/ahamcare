import 'package:ahamcare/controller/map_controller/map_controller.dart';
import 'package:ahamcare/view/widgets/loading_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<MapController>(context, listen: false).getLocation(context);
    });
    return Scaffold(
      body: Consumer<MapController>(
        builder: (context, value, child) {
          return value.currentLocation != null
              ? GoogleMap(
                  onMapCreated: value.onMapCreated,
                  initialCameraPosition: CameraPosition(
                    target: LatLng(value.currentLocation!.latitude!,
                        value.currentLocation!.longitude!),
                    zoom: 11.0,
                  ),
                  gestureRecognizers: Set()
                    ..add(
                      Factory<PanGestureRecognizer>(
                        () => PanGestureRecognizer(),
                      ),
                    )
                    ..add(
                      Factory<ScaleGestureRecognizer>(
                        () => ScaleGestureRecognizer(),
                      ),
                    ),
                  mapToolbarEnabled: true,
                  markers: Set<Marker>.of(
                    value.markerList.map(
                      (e) => Marker(
                        markerId: const MarkerId('marker1'),
                        position: LatLng(
                          e.lat,
                          e.lng,
                        ),
                      ),
                    ),
                  ),
                )
              : const LoadingWidget();
        },
      ),
    );
  }
}
