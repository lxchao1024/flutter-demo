class ConfigModel {
  final String searchUrl;

  //大括号的作用是参数可以为空
  ConfigModel({this.searchUrl});

  factory ConfigModel.fromJson(Map<String, dynamic> json) {
    return ConfigModel(searchUrl: json['searchUrl']);
  }
}
