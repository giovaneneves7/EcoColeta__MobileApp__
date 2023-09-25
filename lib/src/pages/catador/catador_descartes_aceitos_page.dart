import 'package:flutter/material.dart';

class CatadorDescartesAceitosPage extends StatelessWidget {
  const CatadorDescartesAceitosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
              children: [
                const Text("Descartes aceitos"),
              ]
          ),
        ),
      ),
    );
  }
}
