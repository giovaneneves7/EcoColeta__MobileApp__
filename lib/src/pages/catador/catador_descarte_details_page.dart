import 'dart:convert';
import 'package:ecocoleta/src/pages/chat_screen_page.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:http/http.dart' as http;

class CatadorDescarteDetailsPage extends StatefulWidget {
  CatadorDescarteDetailsPage({super.key, required this.descarteId});

  final int descarteId;

  @override
  State<CatadorDescarteDetailsPage> createState() =>
      _CatadorDescarteDetailsPageState();
}

class _CatadorDescarteDetailsPageState
    extends State<CatadorDescarteDetailsPage> {
  Map<String, dynamic> descarteInfos = {};
  String address = "";

  @override
  void initState() {
    super.initState();
    mockGetInfos();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF71be78),
        body: Column(children: [
          Expanded(
            child: Column(
              children: [
                const Text(
                  "Endereço:",
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
                Text(
                  address,
                ),
                Text("ID: ${descarteInfos['id'] ?? ''}"),
                const Text(
                  "Observações",
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
                const Text(
                  "Tipo de Material:",
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
                Text("Material: ${descarteInfos['tipoMaterial'] ?? ''}"),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => ChatScreenPage()));
                  },
                  child: Text("Chat Morador"),
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }

  Future<void> getInfos() async {
    final String url = "http://localhost:8080/catador/get/${widget.descarteId}";
    http.Response response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      print("Response: $response");
      final responseBody = json.decode(response.body);
      print("ResponseBody: $responseBody");

      setState(() {
        descarteInfos = responseBody;
      });
    }
  }

  Future<void> mockGetInfos() async {
    Map<String, dynamic> infos = {};

    infos.addAll({
      'latitude': -11.3022,
      'longitude': -41.8477,
      'tipoMaterial': 'papel',
      'id': 1,
    });

    setState(() {
      descarteInfos = infos;
    });

    await getAddress(
      infos['latitude'],
      infos['longitude'],
    );
  }

  Future<void> getAddress(double latitude, double longitude) async {
    try {
      List<Placemark> placemarks =
          await placemarkFromCoordinates(latitude, longitude);

      if (placemarks.isNotEmpty) {
        Placemark placemark = placemarks[0];
        String fullAddress =
            "${placemark.street}, ${placemark.subLocality}, ${placemark.locality}";

        setState(() {
          address = fullAddress;
        });
      }
    } catch (e) {
      print("Erro ao obter o endereço, verifique as coordenadas: $e");
    }
  }
}
