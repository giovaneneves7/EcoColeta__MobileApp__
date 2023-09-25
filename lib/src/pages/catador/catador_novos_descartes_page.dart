import 'package:flutter/material.dart';

class CatadorNovosDescartesPage extends StatelessWidget {
  const CatadorNovosDescartesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              const Text("NovosDescartes"),
            ]
          ),
        ),
      ),
    );
  }
}
