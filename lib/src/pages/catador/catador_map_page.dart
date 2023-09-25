import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ecocoleta/src/controllers/descarte_controller.dart';
import './catador_descarte_details_page.dart';
import 'package:ecocoleta/src/widgets/customMarker.dart';

class CatadorMapPage extends StatelessWidget {
  CatadorMapPage({super.key});

  final descarteController = Get.put(DescarteController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
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
                   /* onTap: (LatLng position) {
                      Navigator.of(context!).push(
                        MaterialPageRoute(
                          builder: (context) => CatadorDescarteDetailsPage(),
                        ),
                      );
                    },*/
                    markers: Set<Marker>.from(descarteController.markers.map((marker) {
                      return marker.copyWith(
                        onTapParam: () {
                          // Abra a nova página aqui quando o marcador for clicado
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => CatadorDescarteDetailsPage(name: marker.markerId.toString()),
                            ),
                          );
                        },

                      );
                    })),
                  )
          ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
