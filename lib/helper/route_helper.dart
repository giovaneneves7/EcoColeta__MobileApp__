import 'package:get/get_navigation/src/routes/get_route.dart';

class RouteHelper{

  static const String initial = '/';
  static const String splash = '/splash';
  static const String language = '/language';
  static const String signIn = '/sign-in';
  static const String signUp = '/sign-up';
  static const String verification = '/verification';
  static const String forgotPassword = '/forgot-password';
  static const String resetPassword = '/reset-password';
  static const String profile = '/profile';
  static const String updateProfile = '/update-profile';
  static const String map = '/map';

  static String getInitialRoute({bool fromSplash = false}) => '$initial?from-splash=$fromSplash';
  static String getSplashRoute() => '$splash';
  static String getLanguageRoute(String page) => '$language?page=$page';

  static List<GetPage> routes =  [
    
    GetPage(name: initial, page: () => getRoute),

  ];
}