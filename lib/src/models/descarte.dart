
class Descarte{

  Descarte({required this.id, required this.material, required this.quantidade, required this.latitude, required this.longitude});

  int id;
  String material;
  double? valor;
  double quantidade;
  double latitude;
  double longitude;

  factory Descarte.fromJson(Map<String, dynamic> json) {

    return Descarte(id: json['id'], material: json['material'], quantidade: json['quantidade'], latitude: json['latitude'], longitude: json['longitude'],);

  }


}