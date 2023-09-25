import 'package:flutter/material.dart';
import 'package:ecocoleta/src/pages/catador/catador_descartes_page.dart';

class CatadorInicialPage extends StatelessWidget {
  const CatadorInicialPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: Drawer(
            child: SingleChildScrollView(
              child: Container(
                  child: Column( children: [
                      Container(
                        padding: const EdgeInsets.only(top: 15.0),
                        child: InkWell(
                          child: const Padding(
                            padding: EdgeInsets.all(15.0),
                            child: Row(
                              children: [
                                Text("Descartes Novos"),
                              ],
                            ),
                          ),
                          onTap: () {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(builder: (context) => CatadorDescartesPage()),
                            );
                          }
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 15.0),

                        child: InkWell(
                          onTap: () {},
                          child: const Padding(
                            padding: EdgeInsets.all(15.0),
                            child: Row(
                              children: [
                                Text("Descartes Aceitos"),
                              ],
                            ),
                          ),
                        ),
                      ),
                    Container(
                      padding: const EdgeInsets.only(top: 15.0),

                      child: InkWell(
                        onTap: () {},
                        child: const Padding(
                          padding: EdgeInsets.all(15.0),
                          child: Row(
                            children: [
                              Text("Descartes Entregues"),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 15.0),

                      child: InkWell(
                        onTap: () {},
                        child: const Padding(
                          padding: EdgeInsets.all(15.0),
                          child: Row(
                            children: [
                              Text("Minha Conta"),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 15.0),

                      child: InkWell(
                        onTap: () {},
                        child: const Padding(
                          padding: EdgeInsets.all(15.0),
                          child: Row(
                            children: [
                              Text("Sair"),
                            ],
                          ),
                        ),
                      ),
                    ),
                    ],
                  )
              ),
            )
        ),
        appBar: AppBar(
          actions: const [
            Row(
              children: [
                CircleAvatar(
                  child: Icon(
                    Icons.person,
                  ),
                ),
              ],
            ),
          ],
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(children: [
              Container(
                color: const Color(0xFF03860AFF),
                child: Column(
                  children: const [
                    Text("Coleta Seletiva"),
                    Text("é a maneira ecológica mais adequada para o descarte.")
                  ],
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
