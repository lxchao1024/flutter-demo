import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp1/pages/home_page.dart';
import 'package:flutterapp1/pages/my_page.dart';
import 'package:flutterapp1/pages/search_page.dart';
import 'package:flutterapp1/pages/travel_page.dart';

class TabNavigator extends StatefulWidget {
  @override
  createState() => TabNavigatorState();
}

class TabNavigatorState extends State<TabNavigator> {
  int _currentIndex = 0;
  static final List<String> titles = ["首页", "搜索", "天气", "我的"];
  final PageController _controller = PageController(initialPage: 0);

  final List<BottomNavigationBarItem> items = [
    BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.home), title: Text(titles[0])),
    BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.search), title: Text(titles[1])),
    BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.location), title: Text(titles[2])),
    BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.profile_circled), title: Text(titles[3]))
  ];

  @override
  Widget build(BuildContext context) {
//    return getRemovePaddingLayout();
    return getNormalLayout();
  }

  Widget getNormalLayout() {
    return new Scaffold(
      body: new PageView(
        controller: _controller,
        children: <Widget>[
          HomePage(),
          SearchPage(),
          TravelPage(),
          MyPage()
        ],
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      bottomNavigationBar: new BottomNavigationBar(
          items: items,
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndex,
          onTap: (index) {
            _controller.jumpToPage(index);
            setState(() {
              _currentIndex = index;
            });
          }),
    );
  }

  Widget getRemovePaddingLayout() {
    return new Scaffold(
        body: MediaQuery.removePadding(
            context: context,
            removeTop: true,
            child: new PageView(
              controller: _controller,
              children: <Widget>[
                HomePage(),
                SearchPage(),
                TravelPage(),
                MyPage()
              ],
              onPageChanged: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
            )),
        bottomNavigationBar: new BottomNavigationBar(
            items: items,
            type: BottomNavigationBarType.fixed,
            currentIndex: _currentIndex,
            onTap: (index) {
              _controller.jumpToPage(index);
              setState(() {
                _currentIndex = index;
              });
            }));
  }
}
