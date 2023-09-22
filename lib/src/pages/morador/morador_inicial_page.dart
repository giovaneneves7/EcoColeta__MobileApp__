import 'package:flutter/material.dart';

import '../../widgets/morador/morador_drawer.dart';

class MoradorInicialPage extends StatefulWidget {
  const MoradorInicialPage({super.key});

  @override
  State<MoradorInicialPage> createState() => _MoradorInicialPageState();
}

class _MoradorInicialPageState extends State<MoradorInicialPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: const MoradorDrawer(),
        appBar: AppBar(
          title: const Text("EcoColeta"),
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
