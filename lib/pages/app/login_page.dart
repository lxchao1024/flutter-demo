import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp1/widget/my_web_view.dart';

///登录页面
class LoginPage extends StatefulWidget {
  @override
  createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///去掉返回按钮automaticallyImplyLeading: false,
      appBar: AppBar(title: Text('登录'), centerTitle: true, ),
      body: Column(
        children: <Widget>[
          Center(
            child: Padding(
              padding: EdgeInsets.only(top: 100),
              child: Image.asset('assets/images/icon_videodetail_name.png'),
            ),
          ),
          SizedBox(
            height: 55,
          ),
          Container(
            height: 45,
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
//                color: Color(int.parse('0xffF03D38')),
                color: Colors.blue,
                borderRadius: BorderRadius.circular(45)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.phone_iphone,
                  color: Colors.white,
                  size: 18,
                ),
                Text(
                  '登录',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                )
              ],
            ),
          ),
          Spacer(),
          RichText(
            text: TextSpan(
                style: TextStyle(color: Color(0xFF999999)),
                children: <InlineSpan>[
                  TextSpan(text: '登陆即视为同意'),
                  TextSpan(
                      recognizer: TapGestureRecognizer()..onTap = () {
                        print('recognizer');
                        Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                          return MyWebView(title: '服务协议', url: 'https://www.baidu.com');
                        }));
                      },
                      text: '《服务协议》',
                      style: TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.bold)),
                  TextSpan(
                    text: '《隐私政策》',
                    style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
                    recognizer: TapGestureRecognizer()..onTap = () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                        return MyWebView(title: '隐私政策', url: 'https://www.baidu.com');
                      }));
                    }
                  )
                ]),
          ),
          Text(''),
          Text(''),
        ],
      ),
    );
  }
}
