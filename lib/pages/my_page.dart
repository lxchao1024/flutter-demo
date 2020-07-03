import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp1/pages/app/login_page.dart';
import 'package:flutterapp1/widget/my/notification_view.dart';
import 'package:flutterapp1/widget/my/setting_item_view.dart';
import 'package:flutterapp1/widget/my/suffix_view.dart';

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
                                placeholder:
                                    "assets/images/icon_default_avatar.png",
                                image:
                                    'https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=1303636189,2885099528&fm=26&gp=0.jpg',
                                fit: BoxFit.cover,
                              ),
                            ),
                          )),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(builder: (_){
                                return LoginPage();
                              }));
                            },
                            child: Text('登录',
                                style:
                                TextStyle(fontSize: 16, color: Colors.white)),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 8),
                SettingItem(
                  iconData: Icons.notifications,
                  iconColor: Colors.blue,
                  title: '消息中心',
                  suffix: NotificationView(
                    text: '2',
                    //设置右侧显示的图标
                    iconData: Icons.chevron_right,
                    iconColor: Colors.grey,
                  ),
                  isShowDivider: true,
                ),
                Divider(),
                SettingItem(
                  iconData: Icons.thumb_up,
                  iconColor: Colors.green,
                  title: '我赞过的',
                  suffix: SuffixView(
                    text: '121篇',
                    iconColor: Colors.grey,
                    iconData: Icons.chevron_right,
                  ),
                ),
                Divider(),
                SettingItem(
                  iconData: Icons.grade,
                  iconColor: Colors.yellow,
                  title: '收藏集',
                  suffix: SuffixView(
                    text: '2个',
                    iconColor: Colors.grey,
                    iconData: Icons.chevron_right,
                  ),
                ),
                Divider(),
                SettingItem(
                  iconData: Icons.shopping_basket,
                  iconColor: Colors.yellow,
                  title: '已购小册',
                  suffix: SuffixView(
                    text: '100个',
                    iconColor: Colors.grey,
                    iconData: Icons.chevron_right,
                  ),
                ),
                Divider(),
                SettingItem(
                  iconData: Icons.account_balance_wallet,
                  iconColor: Colors.blue,
                  title: '我的钱包',
                  suffix: SuffixView(
                    text: '10万',
                  ),
                ),
                Divider(),
                SettingItem(
                  iconData: Icons.location_on,
                  iconColor: Colors.grey,
                  title: '阅读过的文章',
                  suffix: SuffixView(
                    text: '1034篇',
                  ),
                ),
                Divider(),
                SettingItem(
                  iconData: Icons.local_offer,
                  iconColor: Colors.grey,
                  title: '标签管理',
                  suffix: SuffixView(
                    text: '27个',
                  ),
                ),
                Divider(),
              ],
            ),
          )),
    );
  }
}
