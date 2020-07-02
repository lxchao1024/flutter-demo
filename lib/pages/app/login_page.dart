import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp1/widget/my_web_view.dart';

class LoginPage extends StatefulWidget {
  @override
  createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login'), centerTitle: true),
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
                          color: Colors.blue, fontWeight: FontWeight.bold))
                ]),
          ),
          Text(''),
          Text(''),
        ],
      ),
    );
  }
}

//@override
//Widget build(BuildContext context) {
//  return Scaffold(
//    appBar: AppBar(title: Text('Login'), centerTitle: true),
//    body: MediaQuery.removePadding(
//        context: context,
//        removeTop: true,
//        child: Column(
//          mainAxisAlignment: MainAxisAlignment.center,
//          crossAxisAlignment: CrossAxisAlignment.center,
//          children: <Widget>[
//            Padding(
//              padding: EdgeInsets.only(top: 150),
//              child: Image.asset('assets/images/icon_videodetail_name.png'),
//            ),
//            RawChip(
//              avatar: CircleAvatar(
//                child: Icon(Icons.phone_iphone),
//              ),
//              label: Text('Login'),
//            ),
//            Container(
//              height: 45,
//              margin: EdgeInsets.all(10),
//              decoration: BoxDecoration(
//                  color: Color(int.parse('0xffF03D38')),
//                  borderRadius: BorderRadius.circular(45)),
////                  child: Row(
////                    mainAxisAlignment: MainAxisAlignment.center,
////                    children: <Widget>[
////                      Icon(Icons.phone_iphone, color: Colors.white, size: 18,),
////                      Text('登录', style: TextStyle(color: Colors.white, fontSize: 16),)
////                    ],
////                  ),
//              child: RawChip(
//                backgroundColor: Color(int.parse('0xffF03D38')),
//                avatar: CircleAvatar(
//                  backgroundColor: Color(int.parse('0xffF03D38')),
//                  child: Icon(
//                    Icons.phone_iphone,
//                    color: Colors.white,
//                    size: 18,
//                  ),
//                ),
//                label: Text(
//                  '登录',
//                  style: TextStyle(color: Colors.white, fontSize: 16),
//                ),
//              ),
//            ),
//            RichText(
//              text: TextSpan(
//                  style: TextStyle(color: Color(0xFF999999)),
//                  children: <InlineSpan>[
//                    TextSpan(text: '登陆即视为同意'),
//                    TextSpan(
//                        text: '《服务协议》',
//                        style: TextStyle(
//                            color: Colors.blue, fontWeight: FontWeight.bold))
//                  ]),
//            )
//          ],
//        )),
//  );
//}
