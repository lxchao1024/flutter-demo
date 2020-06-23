
import 'package:flutterapp1/common/api.dart';
import 'package:flutterapp1/utils/http_util.dart';

class WeatherService {
  Future getWeatherInfo(params) async {
    return HttpUtil.get(Api.WEATHER_NOW_URL, params);
  }
}