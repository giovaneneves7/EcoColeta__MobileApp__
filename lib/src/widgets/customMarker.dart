import 'package:google_maps_flutter/google_maps_flutter.dart';

class CustomMarker {
  final MarkerId id;
  final LatLng position;
  final String title;

  CustomMarker({
    required this.id,
    required this.position,
    required this.title,
  });
}
