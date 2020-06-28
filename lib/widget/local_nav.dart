import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutterapp1/model/common_model.dart';
import 'package:flutterapp1/model/grid_nav_model.dart';
import 'package:flutterapp1/widget/my_web_view.dart';

//轮播图下的5个icon
class LocalNav extends StatelessWidget {
  final List<CommonModel> localNavList;

  const LocalNav({Key key, @required this.localNavList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 64,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(7))),
      child: Padding(
        padding: EdgeInsets.all(7),
        child: _items(context),
      ),
    );
  }

  _items(BuildContext context) {
    if (localNavList == null) return null;
    List<Widget> items = [];
    localNavList.forEach((model) {
      items.add(_item(context, model));
    });
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: items,
    );
  }

  Widget _item(BuildContext context, CommonModel model) {
    return GestureDetector(
      onTap: () {
        print('localNav == ${model.hideAppBar}');
        Navigator.of(context).push(MaterialPageRoute(
          builder: (_) {
            print('title: ${model.title}');
            print('hideAppBar: ${model.hideAppBar}');
            print('url: ${model.url}');
            print('icon: ${model.icon}');
            print('statusBarColor: ${model.statusBarColor}');
            return MyWebView(title: model.title, hideAppBar: true, url: model.url, icon: model.icon, statusBarColor: model.statusBarColor);
          }
        ));
      },
      child: Column(
        children: <Widget>[
          Image.network(model.icon, width: 32, height: 32),
          Text(model.title, style: TextStyle(fontSize: 12))
        ],
      ),
    );
  }
}
