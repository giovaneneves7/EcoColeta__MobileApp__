import 'dart:convert';
import 'package:http/http.dart' as http;

class LoginService{


  Future<bool> isValidUser({required String email, required String password}) async{

    return true;
    /*String url = "http://localhost:8080/catador/getAll";

    http.Response response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {

      print("Response: $response");
      final responseBody = json.decode(response.body);
      print("ResponseBody: $responseBody");

      for(var item in responseBody){

        if(email == item['email'] && password == item['senha']){
          return true;
        }
      }

    }

    return false;*/
  }

}