import 'package:flutter/material.dart';
import 'package:flutterapp1/pages/splash_page.dart';

///程序入口
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
      home: SplashPage(),
    );
  }
}
