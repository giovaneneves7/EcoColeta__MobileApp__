import 'dart:convert';
import 'package:ecocoleta/common/models/error_response.dart';
import 'package:ecocoleta/util/app_constants.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class ApiClient{

  final String baseUrl;
  final SharedPreferences sharedPreferences;
  final String noInternetMessage = "connection_to_api_server_failed".tr;
  final timeoutSeconds = 60;
  String? token;
  late Map<String, String> _mainHeaders;

  ApiClient({required this.baseUrl, required this.sharedPreferences}){

    token = sharedPreferences.getString(AppConstants.token);

    updateHeader(token);
  }

  Map<String, String> updateHeader(String? token, {bool setHeader = true}){

    Map<String, String> headers = {};

    headers.addAll({
      'Content-Type' : 'application/json',
      'Authorization' : 'Bearer $token'
    });


    if(setHeader){
      _mainHeaders = headers;
    }

    return headers;
    
  }

  Future<Response> getData(String uri, {Map<String, dynamic>? query, Map<String, String>? headers, handleError = true}) async{

    try{

      http.Response res = await http.get(
        Uri.parse(baseUrl+uri),
        headers: headers ?? _mainHeaders
      ).timeout(Duration(seconds: timeoutSeconds));

      return handleResponse(res, uri, handleError);

    } catch(e){

      return Response(statusCode: 1, statusText: noInternetMessage);
    
    }

  }

  Response handleResponse(http.Response res, String uri, bool handleError){

    dynamic body;

    try{
      body = jsonDecode(body);
    } catch(_){}

    Response response0 = Response(
      body: body ?? res.body, 
      bodyString: res.body.toString(),
      request: Request(headers: res.request!.headers, method: res.request!.method, url: res.request!.url),
      headers: res.headers, statusCode: res.statusCode, statusText: res.reasonPhrase,
    );

     if(response0.statusCode != 200 && response0.body != null && response0.body is !String) {

      if(response0.body.toString().startsWith('{errors: [{code:')) {

        ErrorResponse errorResponse = ErrorResponse.fromJson(response0.body);
        response0 = Response(statusCode: response0.statusCode, body: response0.body, statusText: errorResponse.errors![0].message);

      }else if(response0.body.toString().startsWith('{message')) {

        response0 = Response(statusCode: response0.statusCode, body: response0.body, statusText: response0.body['message']);

      }

    }else if(response0.statusCode != 200 && response0.body == null) {
      response0 = Response(statusCode: 0, statusText: noInternetMessage);
    }

    if(handleError) {

      if(response0.statusCode == 200) {

        return response0;

      } else {

        //ApiChecker.checkApi(response0);
        return const Response();

      }

    } else {

      return response0;
    
    }

  }




}