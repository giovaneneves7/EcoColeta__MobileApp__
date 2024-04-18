import 'dart:ffi';

class ErrorResponse{

  List<Error>? _errors;

  List<Error>? get errors => _errors;

  ErrorResponse({List<Error>? errors}){

    _errors = errors;

  }

  ErrorResponse.fromJson(dynamic json){

    if(json['errors'] != null){

      _errors = [];

      json['errors'].forEach((value) {
        _errors!.add(Error.fromJson(value));
      });

    }

  }

  Map<String, dynamic> toJson(){

    Map<String, dynamic> data = <String, dynamic>{};

    if(_errors != null){
      data['errors'] = _errors!.map((value) => value.toJson()).toList();
    }

    return data;
  }

}

class Error{

  String? _code;
  String? _message;

  String? get code => _code;
  String? get message => _message;

  Error({String? code, String? message}){

    _code = code;
    _message = message;

  }

  Error.fromJson(Map<String, dynamic> json){

    _code = json['code'];
    _message = json['message'];

  }

  Map<String, dynamic> toJson(){
    
    Map<String, dynamic> data = <String, dynamic>{};

    data['code'] = _code;
    data['message'] = _message;

    return data;
  }

}