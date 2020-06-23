import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutterapp1/model/pood/weather_info_model.dart';
import 'package:flutterapp1/services/weather_service.dart';

class WeatherModel with ChangeNotifier {
  String _count = '明日天气';
  String get count => _count;
  WeatherDetailModel _weatherDetailModel;
  WeatherDetailModel get weatherDetailModel => _weatherDetailModel;

  WeatherService _service = WeatherService();

  void requestWeatherInfo() {
    _service.getWeatherInfo(null).then((value) {
      print(value);
      if (value.statusCode == 200) {
        WeatherDetailModel weatherDetail = WeatherDetailModel.fromJson(value.data['HeWeather6'][0]);
        _weatherDetailModel = weatherDetail;
        notifyListeners();
      }
    }).catchError((onError) {
      print(onError);
    });
  }
}