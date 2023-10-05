import 'package:ecocoleta/src/pages/user/user_settings_page.dart';
import 'package:flutter/material.dart';
import 'package:ecocoleta/src/pages/user/user_profile_page.dart';
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
              child: Column(
            children: [
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
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => CatadorDescartesPage()),
                      );
                    }),
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
          )),
        )),
        appBar: AppBar(
          actions: [
            IconButton(
              icon: const Icon(Icons.person),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => UserSettingsPage()));
              },
            ),
          ],
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xFF71be78),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5.0,
                        blurRadius: 7.0,
                        offset: Offset(0, 3.0),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: const [
                        Text(
                          "Coleta Seletiva",
                          style: TextStyle(color: Colors.white, fontSize: 18.0),
                        ),
                        Text(
                          "é a maneira ecológica mais adequada para o descarte.",
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
