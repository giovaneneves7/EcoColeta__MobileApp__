import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter/material.dart';

class DescarteController extends GetxController {

  final latitude = 0.0.obs;
  final longitude = 0.0.obs;

  static DescarteController get to => Get.find<DescarteController>();

  /**
   * @author Giovane Neves
   * @since 2023-09-19 12:12
   *
   * Pega a posição atual do usuário.
   */
  Future<Position> _currentPosition() async {

    LocationPermission permission;
    bool isActive = await Geolocator.isLocationServiceEnabled();

    if (!isActive) {
      return Future.error("Por favor, habilite a localização no seu smartphone.");
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

  getPosition() async {

    try {

      final position = await _currentPosition();

      latitude.value = position.latitude;
      longitude.value = position.longitude;

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
}