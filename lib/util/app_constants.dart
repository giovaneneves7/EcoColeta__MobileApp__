import 'package:ecocoleta/features/language/domain/models/language_model.dart';

class AppConstants{

  // App infos
  static const String appName = "EcoColeta";
  static const double appVersion = 0.1;

  // Api
  static const String apiHostName = 'ecocoleta.com.br';

  static const String landingPageUri = 'flutter-landing-page';

  static List<LanguageModel> languages = [
    LanguageModel(image: null, name: 'Português', code: 'PT', countryCode: 'br'),
    LanguageModel(image: null, name: 'English', code: 'US', countryCode: 'eng')
  ];

  // Theme
  static const String theme = "ecocoleta_theme";
  
  static const String token = "onlytotesttoken";
}