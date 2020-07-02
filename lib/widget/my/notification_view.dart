import 'package:flutter/material.dart';
///消息个数提醒
class NotificationView extends StatelessWidget {

  final String text;
  final IconData iconData;
  final Color iconColor;

  const NotificationView({Key key, this.text, this.iconData, this.iconColor}): super(key: key);

  @override
  Widget build(BuildContext context) {
    if (iconData != null) {
      return Row(
        children: <Widget>[
          _getTextView(),
          Icon(iconData, color: iconColor)
        ],
      );
    }
    return _getTextView();
  }

  Widget _getTextView() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: Colors.red,
        borderRadius: BorderRadius.all(Radius.circular(50)),
      ),
      child: Text(text, style: TextStyle(color: Colors.white)),
    );
  }
}