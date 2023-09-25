import 'dart:async';

import 'package:ecocoleta/src/pages/catador/catador_descarte_details_page.dart';
import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ecocoleta/app_context.dart';

class DescarteController extends GetxController {

  // ================================================ //
  //                     | ATTRIBUTES |               //
  // ================================================ //

  final latitude = 0.0.obs;
  final longitude = 0.0.obs;
  final markers = Set<Marker>();
  final context = AppContext.context;

  late List<Marker> markersList = [];
  late StreamSubscription<Position> positionStream;
  late GoogleMapController _mapsController;
  LatLng _position = LatLng(-11.3022, -41.8477);

  // ================================================ //
  //                     | GETTERS |                  //
  // ================================================ //
  static DescarteController get to => Get.find<DescarteController>();

  get position => _position;

  get mapController => _mapsController;

  // ================================================ //
  //                     | EVENTS |                   //
  // ================================================ //

  /**
   * @author Giovane Neves
   * @since v1.0.0
   *
   * Disparado quando o mapa é criado.
   *
   * @param gmc - O GoogleMapController que será atribuido à variável '_mapsController'.
   */
  void onMapCreated(GoogleMapController gmc) async {

    _mapsController = gmc;

    getPosition();
    loadDescartes();

    // Muda o estilo do mapa para qualquer estilo no padrão 'assets/maps/*.json'.
    var mapStyle = await rootBundle.loadString("assets/maps/night.json");
    _mapsController.setMapStyle(mapStyle);

  }

  // ================================================ //
  //                     | METHODS |                  //
  // ================================================ //
  /**
   * @author Giovane Neves
   * @since v1.0.0
   *
   * Acompanha a posição atual do usuário.
   */
  void watchPosition() async {
    positionStream = Geolocator.getPositionStream().listen((position) {
      if (position != null) {
        latitude.value = position.latitude;
        longitude.value = position.longitude;
      }
    });
  }

  /**
   * Fecha o positionStream para evitar o uso desnecessário de memória.
   */
  @override
  void onClose() {
    positionStream.cancel();
    super.onClose();
  }

  /**
   * @author Giovane Neves
   * @since  v1.0.0
   *
   * Pega a posição atual do usuário.
   */
  Future<Position> _currentPosition() async {
    LocationPermission permission;
    bool isActive = await Geolocator.isLocationServiceEnabled();

    if (!isActive) {
      return Future.error(
          "Por favor, habilite a localização no seu smartphone.");
    }

    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied) {
        return Future.error("Você precisa autorizar o acesso à localização");
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error("Autorize o acesso à localização nas configurações.");
    }

    return await Geolocator.getCurrentPosition();
  }

  /**
   * @author Giovane Neves
   * @since v1.0.0
   *
   * Pega posição atual do usuário.
   */
  getPosition() async {
    try {
      final position = await _currentPosition();

      latitude.value = position.latitude;
      longitude.value = position.longitude;

      _mapsController.animateCamera(
        CameraUpdate.newLatLng(
          LatLng(latitude.value, longitude.value),
        ),
      );
    } catch (e) {
      Get.snackbar(
        'Erro',
        e.toString(),
        backgroundColor: Colors.grey[900],
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  /**
   * @author Giovane Neves
   * @since v1.0.0
   *
   * Carrega os descartes da base de dados.
   */
  void loadDescartes() async {
    // Recupera os descartes
    List<GeoPoint> descartes = [
      GeoPoint(
          name: "Descarte 01",
          id: "30",
          latitude: -11.3022,
          longitude: -41.8477),
      GeoPoint(
          name: "Descarte 02",
          id: "31",
          latitude: -11.3030,
          longitude: -41.8476),
    ];

    descartes.forEach((descarte) => addDescarte(descarte));
    // Passa os dados para o método 'addDescarte':

  }

  /**
   * @author Giovane Neves
   * @since v1.0.0
   *
   * Adiciona um marker de descarte no mapa.
   *
   * @param descarte - O descarte que será adicionado ao mapa.
   */
  void addDescarte(GeoPoint descarte) async {
    LatLng point = LatLng(descarte.latitude, descarte.longitude);

    markers.add(
      Marker(
        markerId: MarkerId(descarte.id),
        position: LatLng(
          point.latitude,
          point.longitude,
        ),
        /*infoWindow: InfoWindow(
          title: descarte.name,
        ),*/
        icon: await BitmapDescriptor.fromAssetImage(
          const ImageConfiguration(size: Size(20.0, 20.0,)),
          'assets/images/marker_coleta_vidro.png',
        ),

      ),
    );

    markersList = markers.toList();

    update();
  }

  /**
   * @author Giovane Neves
   * @since v1.0.0
   *
   */
  void showDescarteDetails(GeoPoint descarte){

    try{

      print('descarte ${descarte.name}');
      

       
    } catch(e, stacktrace){

      Get.snackbar(
        'Erro',
        e.toString(),
        backgroundColor: Colors.grey[900],
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
      print("Erro $e");
      print("\nStackTrace: $stacktrace");
    }

  }
}

class GeoPoint {
  GeoPoint(
      {required this.name,
      required this.id,
      required this.latitude,
      required this.longitude});

  String name;
  String id;
  double latitude;
  double longitude;
}
