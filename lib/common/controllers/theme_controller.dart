import 'package:ecocoleta/util/app_constants.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';

class ThemeController extends GetxController implements GetxService{

  final SharedPreferences sharedPreferences;

  ThemeController({required this.sharedPreferences}){

    _loadCurrentTheme();

  }

  bool _darkTheme = false;
  Color? _lightColor;
  Color? _darkColor;

  bool get darkTheme => _darkTheme;
  Color? get lightColor => _lightColor;
  Color? get darkColor => _darkColor;

  void toggleTheme(){

    _darkTheme = !_darkTheme;
    sharedPreferences.setBool(AppConstants.theme, _darkTheme);
    
    update();

  }

  void changeTheme(Color lightColor, Color darkColor){

    _lightColor = lightColor;
    _darkColor = darkColor;

    update();

  }

  void _loadCurrentTheme(){
    
    _darkTheme = sharedPreferences.getBool(AppConstants.theme) ?? false;

    update();

  }
}