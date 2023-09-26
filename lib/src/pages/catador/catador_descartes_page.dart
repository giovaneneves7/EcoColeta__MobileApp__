import 'package:flutter/material.dart';
import 'package:ecocoleta/src/pages/catador/catador_novos_descartes_page.dart';
import 'package:ecocoleta/src/pages/catador/catador_descartes_aceitos_page.dart';
import 'package:ecocoleta/src/pages/catador/catador_descartes_entregues_page.dart';

class CatadorDescartesPage extends StatefulWidget {
  CatadorDescartesPage({super.key});

  @override
  State<CatadorDescartesPage> createState() => _CatadorDescartesPageState();
}

class _CatadorDescartesPageState extends State<CatadorDescartesPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Descartes"),
            centerTitle: true,
            actions: [
              CircleAvatar(
                child: Icon(
                  Icons.person,
                ),
              ),
            ],
            elevation: 10.0,
            bottom: const TabBar(
              tabs: [
                Tab(text: 'Novos'),
                Tab(text: 'Aceitos'),
                Tab(text: 'Entregues'),
            ],
            ),
          ),
          body: TabBarView(
            children: [
              CatadorNovosDescartesPage(),
              CatadorDescartesAceitosPage(),
              CatadorDescartesEntreguesPage(),
            ],
          ),
        ),

      ),
    );
  }
}
