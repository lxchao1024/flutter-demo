import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeTopView extends StatefulWidget {

  final bool show;

  const HomeTopView({Key key, this.show}) : super(key: key);

  @override
  createState() => _HomeTopViewState();
}

class _HomeTopViewState extends State<HomeTopView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
      decoration: BoxDecoration(
          color: Colors.blue
      ),
      child:  DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            leading: Icon(Icons.video_call, color: Colors.red),
//            automaticallyImplyLeading: widget.show,
            bottom: TabBar(
              isScrollable: true,
              tabs: <Widget>[
                Tab(text: '直播'),
                Tab(text: '关注',)
              ],
            ),
            actions: <Widget>[
              new IconButton(
                  icon: new Icon(Icons.search),
                  tooltip: '搜索',
                  onPressed: (){

                  }
              )
            ],
          ),
        ),
      ),
    );
  }
}