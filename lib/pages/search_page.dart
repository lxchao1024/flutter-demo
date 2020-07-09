import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp1/dao/search_dao.dart';
import 'package:flutterapp1/model/common_model.dart';
import 'package:flutterapp1/model/search_model.dart';
import 'package:flutterapp1/utils/jump_util.dart';
import 'package:flutterapp1/widget/search_bar.dart';

const SEARCH_BAR_DEFAULT_TEXT = '目的地 | 酒店 | 景点 | 航班号';
const URL =
    'http://m.ctrip.com/restapi/h5api/globalsearch/search?source=mobileweb&action=mobileweb&keyword=';

///搜索
class SearchPage extends StatefulWidget {
  final bool showLeft;

  const SearchPage({Key key, this.showLeft = false}) : super(key: key);

  @override
  createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _controller = TextEditingController();
  SearchModel searchModel;
  String showText = '';
  String keyWord = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: null,
        automaticallyImplyLeading: false,
        title: Container(
          width: MediaQuery.of(context).size.width,
          child: SearchBar(
            hideLeft: !widget.showLeft,
            defaultText: '',
            searchBarType: SearchBarType.normal,
            hint: SEARCH_BAR_DEFAULT_TEXT,
            rightTextStyle: TextStyle(color: Colors.white, fontSize: 15),
            leftButtonClick: () {
              Navigator.of(context).pop();
            },
            rightButtonClick: _getSearchContent,
            onChanged: _onChanged,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(itemCount: searchModel?.data?.length ?? 0, itemBuilder: _rowItem),
    );
  }

  void _onChanged(String value) {
    keyWord = value;
    if (value.length == 0) {
      setState(() {
        searchModel = null;
      });
      return;
    }
    SearchDao().fetch(URL + value, value).then((SearchModel value) {
      if (value.keyWord == keyWord) {
        setState(() {
          searchModel = value;
        });
      }
    }).catchError((e) {
      print(e);
    });
  }

  void _getSearchContent() {
    if (keyWord.length == 0) return;
    SearchDao().fetch(URL + keyWord, keyWord).then((SearchModel value) {
      if (value.keyWord == keyWord) {
        setState(() {
          searchModel = value;
        });
      }
    });
  }

  Widget _rowItem(BuildContext context, int position) {
    return GestureDetector(
      onTap: () => JumpUtil.jumpWebView(context, CommonModel(title: '详情', url: searchModel?.data[position]?.url ?? '')),
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            border: Border(bottom: BorderSide(width: 0.3, color: Colors.grey))
          ),
          ///如果是 NULL 则显示空内容
          child: Text(searchModel?.data[position]?.word ?? '',
              ///最多显示多少行
              maxLines: 2,
              ///超出后末尾显示点点点
              overflow: TextOverflow.ellipsis,
              ///设置文本的样式
              style: TextStyle(color: Colors.black54, fontSize: 16)),
        )
    );
  }
}
