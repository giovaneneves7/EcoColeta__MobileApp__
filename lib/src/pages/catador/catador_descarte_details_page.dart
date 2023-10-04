import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CatadorDescarteDetailsPage extends StatefulWidget {

  CatadorDescarteDetailsPage({super.key, required this.descarteId});

  final int descarteId;

  @override
  State<CatadorDescarteDetailsPage> createState() => _CatadorDescarteDetailsPageState();
}

class _CatadorDescarteDetailsPageState extends State<CatadorDescarteDetailsPage> {
  Map<String, dynamic> descarteInfos = {};

  @override
  void initState() {
    super.initState();
    mockGetInfos();
  }
  


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: Column(

                children: [
                  Text("ID: ${descarteInfos['id'] ?? ''}"),
                  Text("Material: ${descarteInfos['tipoMaterial'] ?? ''}"),
                ],
              ),

            ),
          ]
        ),
      ),
    );
  }

  Future<void> getInfos() async{

    final String url = "http://localhost:8080/catador/get/${widget.descarteId}";
    http.Response response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {

      print("Response: $response");
      final responseBody = json.decode(response.body);
      print("ResponseBody: $responseBody");

      setState((){
        descarteInfos = responseBody;
      });

    }
  }

  Future<void> mockGetInfos() async{

    Map<String, dynamic> infos = {};

    infos.addAll({
      'latitude': -11.3022,
      'longitude': -41.8477,
      'tipoMaterial': 'papel',
      'id': 1,
    });

    setState((){
      descarteInfos = infos;
    });

  }
}
