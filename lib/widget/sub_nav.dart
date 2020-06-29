import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutterapp1/model/common_model.dart';
import 'package:flutterapp1/widget/my_web_view.dart';

///网格卡片
class SubNav extends StatelessWidget {
  final List<CommonModel> subNavList;
  final String name;

  const SubNav({Key key, @required this.subNavList, this.name = 'McMi'})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> columns = _gridNavItems(context);
    int subIndex = (subNavList.length / 2 + 0.5).toInt();

    return PhysicalModel(
      color: Colors.white,
      borderRadius: BorderRadius.circular(6),
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: Row(
              children: columns.sublist(0, subIndex),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10, bottom: 10),
            child: Row(
              children: columns.sublist(subIndex, columns.length),
            ),
          ),
        ],
      ),
    );
  }

  _gridNavItems(BuildContext context) {
    print(subNavList.length);
    List<Widget> items = [];
    if (subNavList == null) return items;
    subNavList.forEach((element) {
      items.add(_wrap(context, element));
    });
    return items;
  }

  Widget _wrap(BuildContext context, CommonModel element) {
    return Expanded(
      flex: 1,
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return MyWebView(
                title: element.title,
                icon: element.icon,
                url: element.url,
                hideAppBar: element.hideAppBar,
                statusBarColor: element.statusBarColor);
          }));
        },
        child: Column(
          children: <Widget>[
            Image.network(element.icon, width: 22, height: 22),
            Text(element.title, style: TextStyle(fontSize: 12))
          ],
        ),
      ),
    );
  }
}
