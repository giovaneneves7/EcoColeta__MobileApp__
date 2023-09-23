import 'package:flutter/material.dart';

class CatadorInicialPage extends StatelessWidget {
  const CatadorInicialPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
