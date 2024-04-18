import 'package:ecocoleta/api/api_client.dart';
import 'package:ecocoleta/features/splash/domain/repositories/splash_repository_interface.dart';
import 'package:ecocoleta/util/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashRepository implements SplashRepositoryInterface{

  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;

  SplashRepository({required this.apiClient,  required this.sharedPreferences});
  
  @override
  Future<void> initSharedData() async {

    if(!sharedPreferences.containsKey(AppConstants.theme)){

      sharedPreferences.setBool(AppConstants.theme, false);
    
    }

  }

}