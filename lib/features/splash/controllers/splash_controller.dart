import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashController extends GetxController implements GetxService{

	bool _firstTimeConnectionCheck = true;
	bool get firstTimeConnectionCheck => _firstTimeConnectionCheck;

	bool _hasConnection = true;
	bool get hasConnection => _hasConnection;
	
}