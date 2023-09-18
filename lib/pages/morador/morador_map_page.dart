import 'package:flutter/material.dart';

class MoradorMapPage extends StatefulWidget {
  const MoradorMapPage({super.key});

  @override
  State<MoradorMapPage> createState() => _MoradorMapPageState();
}

class _MoradorMapPageState extends State<MoradorMapPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: const Text("Map page"),
      ),
    );
  }
}
