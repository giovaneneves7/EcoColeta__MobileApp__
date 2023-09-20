import 'package:flutter/material.dart';

class MoradorSettingsPage extends StatefulWidget {
  const MoradorSettingsPage({super.key});

  @override
  State<MoradorSettingsPage> createState() => _MoradorSettingsPageState();
}

class _MoradorSettingsPageState extends State<MoradorSettingsPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: const Text("Settings page"),
      ),
    );
  }
}
