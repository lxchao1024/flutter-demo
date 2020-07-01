import 'package:flutter/material.dart';

class SettingItem extends StatelessWidget {

  final IconData iconData;
  final Color iconColor;
  final String title;
  final Widget suffix;
  final bool isShowDivider;

  const SettingItem({Key key, this.iconData, this.iconColor, this.title, this.suffix, this.isShowDivider = false}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
        child: _getRowView(),
    );
  }

  Widget _getRowView() {
    return Row(
      children: <Widget>[
        SizedBox(
          width: 15,
        ),
        Icon(iconData, color: iconColor),
        SizedBox(
          width: 8,
        ),
        Expanded(
          child: Text('$title'),
        ),
        suffix,
        SizedBox(
          width: 15,
        )
      ],
    );
  }
}