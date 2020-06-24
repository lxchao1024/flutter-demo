import 'package:dio/dio.dart';
import 'package:flutterapp1/common/api.dart';
import 'package:flutterapp1/model/home_model.dart';

class HomeDao {
  Future<HomeModel> fetch(params) async {
    final Response response = await Dio().get(Api.HOME_URL);
    print('print ${response.data}');
    print(response.data);
    if (response.statusCode == 200) {
      return HomeModel.fromJson(response.data);
    } else {
      throw Exception('Failed to load home_page.json');
    }
  }
}