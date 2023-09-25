import 'package:flutter/material.dart';

class CatadorDescartesEntreguesPage extends StatelessWidget {
  const CatadorDescartesEntreguesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
              children: [
                const Text("Descartes entregues"),
              ]
          ),
        ),
      ),
    );
  }
}
