import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ecocoleta/src/widgets/novo_descarte.dart';
import 'package:ecocoleta/src/models/descarte.dart';
import 'package:ecocoleta/src/pages/catador/catador_descarte_details_page.dart';

class CatadorNovosDescartesPage extends StatefulWidget {
  CatadorNovosDescartesPage({super.key});

  @override
  State<CatadorNovosDescartesPage> createState() =>
      _CatadorNovosDescartesPageState();
}

class _CatadorNovosDescartesPageState extends State<CatadorNovosDescartesPage> {
  List<NovoDescarte> descartesList = [];

  void acceptDescarte(Descarte descarte) {
    // Implementar lógica que atualizará o status do descarte para 'aceito'.
    setState(() {
      descartesList.removeWhere((descarteContainer) =>
      descarteContainer.descarte.id == descarte.id);
    });
  }

  void refuseDescarte(Descarte descarte) {
    // Implementar lógica que recusará o descarte.
    setState(() {
      descartesList.removeWhere((descarteContainer) =>
      descarteContainer.descarte.id == descarte.id);
    });
  }

  void detailDescarte(int descarteId){

    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => CatadorDescarteDetailsPage(descarteId: descarteId)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FutureBuilder<List<Descarte>>(
                  future: getDescartes(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return Text('Erro: ${snapshot.error}');
                    } else {
                      List<NovoDescarte> descartesList = snapshot.data
                          ?.map((descarte) =>
                          NovoDescarte(
                            descarte: descarte,
                            onAccept: () => acceptDescarte(descarte),
                            onRefuse: () => refuseDescarte(descarte),
                            onDetail: () => detailDescarte(descarte.id),
                          ))
                          .toList() ?? [];

                      return Flexible(
                        child: ListView(
                          shrinkWrap: true,
                          children: descartesList,
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
          ),),
      ),
    );
  }

  Future<List<Descarte>> getDescartes() async {
    List<Descarte> descartes = [];
    String url = "ecocoleta.free.beeceptor.com/descartes/novos";

    http.Response response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {

      print("Response: $response");

      final List<dynamic> responseBody = json.decode(Utf8Codec().decode(response.bodyBytes));

      for (var descarteJson in responseBody) {
        Descarte descarte = Descarte.fromJson(descarteJson);
        descartes.add(descarte);
      }
    }

    return descartes;
  }
}
