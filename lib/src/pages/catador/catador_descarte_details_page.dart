import 'package:flutter/material.dart';

class CatadorDescarteDetailsPage extends StatelessWidget {

  CatadorDescarteDetailsPage({super.key, required this.name});

  String name;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: Column(

                children: [
                  const Text("Endereço:"),
                  Text("Vila Boa Esperança."),
                ],
              ),

            ),
          ]
        ),
      ),
    );
  }
}
