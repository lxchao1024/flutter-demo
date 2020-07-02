import 'package:flutter/material.dart';
///文本+右箭头
class SuffixView extends StatelessWidget {

  final String text;
  final IconData iconData;
  final Color iconColor;

  const SuffixView({Key key, this.text, this.iconData, this.iconColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (iconData != null) {
      return Row(
        children: <Widget>[
          Text(
            '$text',
            style: TextStyle(color: Colors.grey.withOpacity(.5)),
          ),
          Icon(iconData, color: iconColor)
        ],
      );
    }
    return Text(
      '$text',
      style: TextStyle(color: Colors.grey.withOpacity(.5)),
    );
  }
}