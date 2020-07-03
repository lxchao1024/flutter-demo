import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp1/model/common_model.dart';
import 'package:flutterapp1/widget/my_web_view.dart';

class JumpUtil {

  static void jumpWebView(BuildContext context, CommonModel model) {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
      return MyWebView(
          title: model.title,
          icon: model.icon,
          url: model.url,
          statusBarColor: model.statusBarColor,
          hideAppBar: model.hideAppBar);
    }));
  }
}