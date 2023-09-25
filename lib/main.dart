import 'package:flutter/material.dart';
import 'package:ecocoleta/src/pages/login_page.dart';
import './app_context.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    AppContext.context = context;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: const Color(0xFF4CAF50),
      ),
      home: new Login(),
    );
  }
}
