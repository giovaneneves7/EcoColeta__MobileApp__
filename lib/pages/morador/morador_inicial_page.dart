import "package:flutter/material.dart";
import '../../widgets/morador/morador_drawer.dart';

class MoradorInicialPage extends StatelessWidget {
  const MoradorInicialPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: const MoradorDrawer(),
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text("EcoColeta"),
          actions: const [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.green,
                  child: Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(children: []),
          ),
        ),
      ),
    );
  }
}
