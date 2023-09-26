import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ecocoleta/src/pages/login_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(
        Duration(
          seconds: 3,
        ), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => LoginPage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              Image.asset("assets/images/logo.png"),
              SizedBox(),
              Text(
                "EcoColeta",
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.green[300],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
