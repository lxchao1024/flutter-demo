import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyPage extends StatefulWidget {
  @override
  createState() => MyPageState();
}

class MyPageState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff2f2f2),
      body: MediaQuery.removePadding(
          context: context,
          removeTop: true,
          child: new Center(
            child: ListView(
              children: <Widget>[
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 160,
                    decoration: BoxDecoration(color: Colors.blue),
                    child: Center(
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(top: 60),
                          ),
                          Center(
                              child: Container(
                            width: 50,
                            height: 50,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(25),
                              child: FadeInImage.assetNetwork(
                                placeholder: "assets/images/icon_default_avatar.png",
                                image: 'https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=1303636189,2885099528&fm=26&gp=0.jpg',
                                fit: BoxFit.cover,
                              ),
                            ),
                          )),
                          Text('登录', style: TextStyle(fontSize: 16, color: Colors.white))
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
