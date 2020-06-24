class Api {
  static String API_WEB_KEY = "10252b56c85d40f68731d77d1f42ecb4";
  static String API_IOS_KEY = "f0e8f6d91cef497e822755944f9fb412";
  static String API_ANDROID_KEY = "c816ac55c08c46b6b8168e147303281e";

  static String BASE_URL = "https://free-api.heweather.net/s6/weather";

  // 实况天气
  static String WEATHER_NOW_URL = "${BASE_URL}/now?location=beijing&key=${API_WEB_KEY}";

  // 3-10天预报
  static String WEATHER_FORECAST_URL = "${BASE_URL}/forecast?location=beijing&key=${API_WEB_KEY}";

  // 逐小时预报
  static String WEATHER_HOURLY_URL = "${BASE_URL}/hourly?location=beijing&key=${API_WEB_KEY}";

  // 生活指数
  static String WEATHER_LIFESTYLE_URL = "${BASE_URL}/lifestyle?location=beijing&key=${API_WEB_KEY}";

  static String HOME_URL = 'https://www.devio.org/io/flutter_app/json/home_page.json';
}