import 'package:flutter/material.dart';

class MyPage extends StatefulWidget {
  @override
  createState() => MyPageState();
}

class MyPageState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new Text('我的'),
    );
  }
}