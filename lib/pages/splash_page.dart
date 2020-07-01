import 'package:flutter/material.dart';
import 'package:flutterapp1/navigator/tab_navigator.dart';

///程序启动页
class SplashPage extends StatefulWidget {

  @override
  createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), (){
      Navigator.of(context).push(MaterialPageRoute(builder: (_) {
        return TabNavigator();
      }));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Image.asset('assets/images/splash.jpg', fit: BoxFit.fill)
    );
  }
}