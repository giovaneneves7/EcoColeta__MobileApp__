import 'package:ecocoleta/src/models/position.dart';
import 'package:geolocator/geolocator.dart';

class Descarte{

  Descarte({required this.id, required this.material,});

  int id;
  String material;
  double? address;

  factory Descarte.fromJson(Map<String, dynamic> json) {

    return Descarte(id: json['id'], material: json['material']);

  }


}