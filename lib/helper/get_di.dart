import 'dart:convert';
import 'package:ecocoleta/common/controllers/theme_controller.dart';
import 'package:flutter/services.dart';
import 'package:ecocoleta/util/app_constants.dart';
import 'package:ecocoleta/features/language/domain/models/language_model.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<Map<String, Map<String, String>>> init() async{

  final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

  // Core
  Get.lazyPut(() => sharedPreferences);

  // Controllers
  Get.lazyPut(() => ThemeController(sharedPreferences: Get.find()));

  // Local data
  Map<String, Map<String, String>> languages = {};

  for(LanguageModel language in AppConstants.languages){

    String jsonStringValues = await rootBundle.loadString('assets/langs/${language.code}.json');
    Map<String, dynamic> mappedJson = jsonDecode(jsonStringValues);
    Map<String, String> json = {};
    
    mappedJson.forEach((key, value) {

      json[key] = value.toString();

    });

    languages['${language.code}_${language.countryCode}'] = json;

  }

  return languages;

}