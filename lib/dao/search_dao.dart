import 'package:dio/dio.dart';
import 'package:flutterapp1/model/search_model.dart';

class SearchDao {
  Future<SearchModel> fetch(String url, String text) async {
    final Response response = await Dio().get(url);
    print('print ${response.data}');
    print(response.data);
    if (response.statusCode == 200) {
      SearchModel searchModel = SearchModel.fromJson(response.data);
      searchModel.keyWord = text;
      return searchModel;
    } else {
      throw Exception('Failed to load home_page.json');
    }
  }
}