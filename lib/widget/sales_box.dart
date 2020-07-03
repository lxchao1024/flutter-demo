import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutterapp1/model/common_model.dart';
import 'package:flutterapp1/model/sales_box_model.dart';
import 'package:flutterapp1/utils/jump_util.dart';

///热门活动
class SalesBox extends StatelessWidget {
  final SalesBoxModel salesBox;
  final String name;

  const SalesBox({Key key, @required this.salesBox, this.name = 'McMi'})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      color: Colors.white,
      borderRadius: BorderRadius.circular(6),
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: <Widget>[
          Container(
            height: 44,
            margin: EdgeInsets.only(left: 10),
            decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 1, color: Color(0xfff2f2f2)))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Image.network(salesBox.icon, height: 15, fit: BoxFit.fill),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 1, 8, 1),
                  margin: EdgeInsets.only(right: 7),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      gradient: LinearGradient(
                          colors: [Color(0xffff4e63), Color(0xffff6cc9)],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight)),
                  child: GestureDetector(
                    onTap: () => JumpUtil.jumpWebView(context, CommonModel(title: '更多福利', icon: salesBox.icon, url: salesBox.moreUrl, hideAppBar: true, statusBarColor: '0000ff')),
                    child: Text('获取更多福利 >',
                        style: TextStyle(color: Colors.white, fontSize: 12)),
                  ),
                )
              ],
            ),
          ),
          _getRow(context, salesBox.bigCard1, salesBox.bigCard2),
          _getRowSpace(),
          _getRow(context, salesBox.smallCard1, salesBox.smallCard2),
          _getRowSpace(),
          _getRow(context, salesBox.smallCard3, salesBox.smallCard4),
        ],
      ),
    );
  }

  Widget _getRowSpace() {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 7, 10, 7),
      margin: EdgeInsets.only(right: 7,left: 7),
      decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 1, color: Color(0xfff2f2f2)))),
    );
  }

  Widget _getRow(BuildContext context, CommonModel leftModel, CommonModel rightModel) {
    return Row(
      children: <Widget>[
        GestureDetector(
          onTap: () => JumpUtil.jumpWebView(context, leftModel),
          child: Image.network(leftModel.icon,
              width: MediaQuery.of(context).size.width / 2 - 10),
        ),
        GestureDetector(
          onTap: () => JumpUtil.jumpWebView(context, rightModel),
          child: Image.network(rightModel.icon,
              width: MediaQuery.of(context).size.width / 2 - 10),
        )
      ],
    );
  }
}
