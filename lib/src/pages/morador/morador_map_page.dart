import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecocoleta/src/controllers/descarte_controller.dart';

class MoradorMapPage extends StatelessWidget {
  MoradorMapPage({super.key});

  final descarteController = Get.put(DescarteController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(children: [
            TextButton(
              onPressed: () {
                descarteController.watchPosition();
              },
              child: const Text("Click me"),
            ),
            Obx(
              () => Text(
                "Latitude: ${descarteController.latitude.value} | Longitude ${descarteController.longitude.value}",
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
