import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp1/widget/search_bar.dart';

const SEARCH_BAR_DEFAULT_TEXT = '目的地 | 酒店 | 景点 | 航班号';

///搜索
class SearchPage extends StatefulWidget {
  @override
  createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(),
      body: Column(
        children: <Widget>[
          SearchBar(
            hideLeft: false,
            defaultText: SEARCH_BAR_DEFAULT_TEXT,
            searchBarType: SearchBarType.home,
            hint: '哇哦，我是一个指示文本',
            leftButtonClick: () {
              print('left');
            },
            onChanged: _onChanged,
          ),
          SearchBar(
            hideLeft: true,
            defaultText: '',
            searchBarType: SearchBarType.normal,
            hint: '哇哦，我是一个指示文本',
            leftButtonClick: () {
              print('left');
            },
            onChanged: _onChanged,
          ),
        ],
      ),
    );
  }

  void _onChanged(String value) {
    print('_onChanged.....');
  }
}