class LandingModel{

  BaseUrl? baseUrls;
  String? fixedHeaderTitle;

  LandingModel({this.baseUrls, this.fixedHeaderTitle});

  LandingModel.fromJson(Map<String, dynamic> json){

    baseUrls = json['base_urls'] != null ? BaseUrl.fromJson(json['base_urls']) : null;
    fixedHeaderTitle = json['fixed_header_title'];

  }

  Map<String, dynamic> toJson(){

    Map<String, dynamic> data = <String, dynamic>{};

    data['base_urls'] = baseUrls?.toJson();
    data['fixed_header_title'] = fixedHeaderTitle;

    return data;

  }

}

class BaseUrl{

  String? fixedHeaderImage;

  BaseUrl({this.fixedHeaderImage});

  BaseUrl.fromJson(Map<String, dynamic> json){

    fixedHeaderImage = json['fixed_header_image'];

  }

  Map<String, dynamic> toJson(){

    Map<String, dynamic> data = <String, dynamic>{};

    data['fixed_header_image'] = fixedHeaderImage;

    return data;

  }

}