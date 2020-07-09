///搜索结果实体类
class SearchModel {
  final List<SearchItem> data;
  String keyWord;

  SearchModel({this.data});

  factory SearchModel.fromJson(Map<String, dynamic> json) {
    var dataModel = json['data'] as List;
    List<SearchItem> data = dataModel.map((i) => SearchItem.fromJson(i)).toList();
    return SearchModel(
      data: data
    );
  }
}

class SearchItem {
  final String word;
  final String type;
  final String price;
  final String star;
  final String zonename;
  final String districtname;
  final String url;

  SearchItem({this.word, this.type, this.price, this.star, this.zonename, this.districtname, this.url});

  factory SearchItem.fromJson(Map<String, dynamic> json) {
    return SearchItem(
      word: json['word'],
      type: json['type'],
      price: json['price'],
      star: json['star'],
      zonename: json['zonename'],
      districtname: json['districtname'],
      url: json['url']
    );
  }
}