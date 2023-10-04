import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ecocoleta/src/controllers/descarte_controller.dart';
import './catador_descarte_details_page.dart';
import 'package:ecocoleta/src/widgets/customMarker.dart';

class CatadorMapPage extends StatefulWidget {
  CatadorMapPage({super.key, this.onMapDragStart, this.onMapDragEnd});

  final VoidCallback? onMapDragStart;
  final VoidCallback? onMapDragEnd;

  @override
  State<CatadorMapPage> createState() => _CatadorMapPageState();
}

class _CatadorMapPageState extends State<CatadorMapPage> {
  final descarteController = Get.put(DescarteController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Stack(
            children: [
              Column(
                children: [
                  Expanded(
                    child: GetBuilder<DescarteController>(
                      init: descarteController,
                      builder: (value) =>
                          GoogleMap(
                            mapType: MapType.normal,
                            zoomControlsEnabled: true,
                            initialCameraPosition: CameraPosition(
                              target: descarteController.position,
                              zoom: 13,
                            ),
                            onMapCreated: descarteController.onMapCreated,
                            myLocationEnabled: true,
                            onCameraMoveStarted: () {
                              // Chame a função de callback quando o mapa começar a ser arrastado
                              widget.onMapDragStart?.call();
                            },
                            onCameraIdle: () {
                              // Chame a função de callback quando o arrasto do mapa terminar
                              widget.onMapDragEnd?.call();
                            },

                            markers: Set<Marker>.from(
                                descarteController.markers.map((marker) {
                                  return marker.copyWith(
                                    onTapParam: () {
                                      // Abra a nova página aqui quando o marcador for clicado
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              CatadorDescarteDetailsPage(
                                                  descarteId: int.parse(marker.markerId
                                                      .toString())),
                                        ),
                                      );
                                    },
                                  );
                                },),),
                          ),
                    ),
                  ),
                  Container(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Arraste até o local que deseja ir"),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
