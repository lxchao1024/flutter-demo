import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'file:///E:/andspaces/debug/flutter-app1/flutter_app1/lib/pages/live_page.dart';
import 'package:flutterapp1/widget/round_indicator.dart';
import 'package:fluttertoast/fluttertoast.dart';

///搜索
class SearchPage extends StatefulWidget {

  bool show = true;

  @override
  createState() => SearchPageState();
}

class SearchPageState extends State<SearchPage> {

  int index = 1;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: IconButton(
            icon: Icon(Icons.video_call, color: widget.show == true ? Colors.white : Colors.blue,),
            onPressed: () {
              if (!widget.show) return;
              print('leading');
              Fluttertoast.showToast(msg: '点击咯', gravity: ToastGravity.CENTER);
            },
          ),
          actions: <Widget>[
            _getSearchView(),
            _getSettingView()
          ],
          title: TabBar(
            indicator: RoundUnderlineTabIndicator(
                borderSide: BorderSide(
                  width: 3.5,
                  color: Colors.white,
                )
            ),
            labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal, fontSize: 13),
            labelPadding: EdgeInsets.symmetric(horizontal: 8),
            isScrollable: true,
            tabs: <Widget>[
              Tab(text: "直播"),
              Tab(text: "关注")
            ],
          ),
          centerTitle: true,
        ),
        body: TabBarView(
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.circular(45)),
                  padding: EdgeInsets.only(left: 15, right: 15),
                  height: 30,
                  margin: EdgeInsets.all(15),
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.search, color: Colors.white),
                      Text('试试输点什么内容吧~', style: TextStyle(color: Colors.white),)
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: LivePage(),
                )
              ],
            ),
            Center(
                child: Text("这是关注的内容${index++}")
            )
          ],
        ),
      ),
    );
  }

  Widget _getSearchView() {
    return Center(
      child: GestureDetector(
        onTap: () {
          Fluttertoast.showToast(msg: '点击咯', gravity: ToastGravity.CENTER);
        },
        child: Icon(Icons.search, size: 24,),
      ),
    );
  }

  Widget _getSettingView() {
    return Center(
      child: GestureDetector(
        onTap: () {
          Fluttertoast.showToast(msg: '点击咯', gravity: ToastGravity.CENTER);
        },
        child: Padding(
          child: Icon(Icons.power_settings_new, size: 24,),
          padding: EdgeInsets.only(left: 10, right: 15),
        ),
      ),
    );
  }
}