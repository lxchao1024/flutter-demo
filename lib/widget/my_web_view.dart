import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

///网页浏览
class MyWebView extends StatefulWidget {
  final String icon;
  final String title;
  final String url;
  final String statusBarColor;
  final bool hideAppBar;

  const MyWebView(
      {Key key,
      this.icon,
      this.title,
      this.url,
      this.statusBarColor,
      this.hideAppBar})
      : super(key: key);

  @override
  createState() => _MyWebViewState();
}

class _MyWebViewState extends State<MyWebView> {

  bool exiting = false;

  Color _color(String color) {
    if (null == color) {
      return Colors.transparent;
    }
    return Color(int.parse('0xff' + widget.statusBarColor));
  }

  WebViewController _controller;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: null,
      body: new Column(
        children: <Widget>[
          _appBar(context),
          Expanded(
            child: WebView(
              javascriptMode: JavascriptMode.unrestricted,
              onWebViewCreated: (WebViewController webViewController) async {
                webViewController.loadUrl(widget.url);
                _controller = webViewController;
              },
              onPageStarted: (url) {
                //判断返回键是否
                print('url == $url');
//                if (exiting) {
//                  Navigator.pop(context);
//                } else {
//                  exiting = true;
//                }
              },
            ),
          )
        ],
      ),
    );
  }

  Widget _appBar(BuildContext context) {
    //动态配置状态栏
//    if (widget.hideAppBar ?? false)
//      return Container(
//        height: 30,
//        decoration: BoxDecoration(color: _color(widget.statusBarColor)),
//      );
    Color color = Color(0xfff2f2fe2);
    if (widget.statusBarColor != null) {
      color = Color(int.parse('0xff' + widget.statusBarColor));
    }
    return Container(
      color: color,
      padding: EdgeInsets.fromLTRB(0, 38, 0, 10),
      child: FractionallySizedBox(
        widthFactor: 1,
        child: Stack(
          children: <Widget>[
            GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Container(
                margin: EdgeInsets.only(left: 10),
                child: Icon(
                  Icons.close,
                  color: Colors.white,
                  size: 26,
                ),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              child: Center(
                child: Text(widget.title, style: TextStyle(color: Colors.white, fontSize: 18),),
              ),
            )
          ],
        ),
      ),
    );
  }
}
