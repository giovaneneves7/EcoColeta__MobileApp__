import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ecocoleta/src/widgets/novo_descarte.dart';
import 'package:ecocoleta/src/models/descarte.dart';

class CatadorNovosDescartesPage extends StatelessWidget {

  CatadorNovosDescartesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: FutureBuilder<List<Descarte>>(
            future: getDescartes(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('Erro: ${snapshot.error}');
              } else {
                List<NovoDescarte> descartesList = snapshot.data?.map((descarte) =>
                    NovoDescarte(descarte: descarte,)
                ).toList() ?? [];

                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: descartesList,
                );
              }
            },
          )
        ),
      ),
    );
  }

  Future<List<Descarte>> getDescartes() async{

    List<Descarte> descartes = [];
    String url = "https://ecocoleta.free.beeceptor.com/descartes/novos";

    http.Response response = await http.get(Uri.parse(url));

    if(response.statusCode == 200){
      print("Response: $response");
      final List<dynamic> responseBody = json.decode(Utf8Codec().decode(response.bodyBytes));

      for(var descarteJson in responseBody){

        Descarte descarte = Descarte.fromJson(descarteJson);
        descartes.add(descarte);

      }
    }

    return descartes;

  }
}
