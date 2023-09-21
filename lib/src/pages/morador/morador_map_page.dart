import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
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

            Expanded(
              child: GetBuilder<DescarteController>(
                init: descarteController,
                builder: (value) => GoogleMap(
                  mapType: MapType.normal,
                  zoomControlsEnabled: true,
                  initialCameraPosition: CameraPosition(
                    target: descarteController.position,
                    zoom: 13,
                  ),
                  onMapCreated: descarteController.onMapCreated,
                  myLocationEnabled: true,
                  markers: descarteController.markers,
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
