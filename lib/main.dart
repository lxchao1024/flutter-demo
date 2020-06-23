import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutterapp1/navigator/tab_navigator.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatefulWidget {
  @override
  createState() => MyAppState();
}

class MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      //是否显示Debug标签
      debugShowCheckedModeBanner: true,
      theme: new ThemeData(primaryColor: Colors.blue),
      home: TabNavigator(),
    );
  }
}
