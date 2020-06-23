import 'package:dio/dio.dart';

Options options = Options(
  headers: {
    "Content-Type": "application/json",
    "Accept": "application/json"
  }
);

class HttpUtil {

  static Future get(String url, Map<String, dynamic> params) async {
    Response response = await Dio(options).get(url, data: params);
    return response;
  }

  static Future post(String url, Map<String, dynamic> params) async {
    Response response = await Dio(options).post(url, data: params);
    return response;
  }
}