import 'package:ecocoleta/common/controllers/theme_controller.dart';
import 'package:ecocoleta/features/splash/controllers/splash_controller.dart';
import 'package:ecocoleta/util/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:ecocoleta/helper/get_di.dart' as di;
import 'package:get/get.dart';

Future<void> main() async {

  Map<String, Map<String, String>> languages = await di.init();

  runApp(MyApp(languages: languages,));
}

class MyApp extends StatefulWidget {

  Map<String, Map<String, String>>? languages;

  MyApp({super.key, required this.languages});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  
  @override
  Widget build(BuildContext context) {

    return GetBuilder<ThemeController>(builder: (themeController) {
      
      return GetBuilder<SplashController>(builder: (splashController){

        return GetMaterialApp(
          title: AppConstants.appName,
          debugShowCheckedModeBanner: false,
          navigatorKey: Get.key,
          theme: themeController.darkTheme ? dark() : light(),
          // locale: /* TODO: Create a localizeController */
          translations: Messages(languages: widget.languages),

        );

      });

    });
    
  }

}
