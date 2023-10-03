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
    getInfos();
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
                  Text("${descarteInfos['id'] ?? ''}"),
                ],
              ),

            ),
          ]
        ),
      ),
    );
  }

  Future<List<String>> getInfos() async{

    final String url = "http://localhost:8080/catador/get/${widget.descarteId}";
    http.Response response = await http.get(Uri.parse(url));


    if (response.statusCode == 200) {

      print("Response: $response");
      final responseBody = json.decode(response.body);
      print("ResponseBody: $responseBody");

      infos['latitude'] = responseBody['latitude'];

    }
  }
}
