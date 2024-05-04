import 'package:ecocoleta/common/controllers/theme_controller.dart';
import 'package:ecocoleta/theme/dark_theme.dart';
import 'package:ecocoleta/theme/light_theme.dart';
import 'package:ecocoleta/features/splash/controllers/splash_controller.dart';
import 'package:ecocoleta/util/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:ecocoleta/helper/get_di.dart' as di;
import 'package:get/get.dart';
import 'package:ecocoleta/helper/route_helper.dart';

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
          //translations: Messages(languages: widget.languages),
          initialRoute: RouteHelper.getInitialRoute(), /*TODO: Adicionar rota splash*/
          getPages: RouteHelper.routes,
          defaultTransition: Transition.topLevel,
          transitionDuration: const Duration(milliseconds: 500),
          builder: (BuildContext context, widget){

            return MediaQuery(

              data: MediaQuery.of(context).copyWith(textScaler: const TextScaler.linear(1)), 
              child: Material(

                child: Stack(
                
                  children: [
                    
                    widget!,
                    GetBuilder<SplashController>(builder: (SplashController){

                      return const SizedBox();

                    }),

                  ],
                ),
              ),
            );

          });

      });

    });
    
  }

}
