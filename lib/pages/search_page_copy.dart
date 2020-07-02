import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterapp1/pages/image_picker_page.dart';
import 'package:flutterapp1/widget/home/home_top_view.dart';
import 'package:fluttertoast/fluttertoast.dart';

///搜索
class SearchPage extends StatefulWidget {
  @override
  createState() => SearchPageState();
}

class SearchPageState extends State<SearchPage> {
  final _controller = TextEditingController();
  int currentCount = 0;
  Color _color = Color(0xffff0000);

  bool show = true;

  @override
  void initState() {
    super.initState();
    print("SearchPageInit");
    currentCount = _controller.text.length;
    Future.delayed(Duration(seconds: 3), (){
      setState(() {
        show = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    _controller.addListener(() {
      print('length is : ${_controller.text.length}');
      if (_controller.text.length >= 20) {
        print("max length is 20");
      }
      setState(() {
        currentCount = _controller.text.length;
      });
    });
    currentCount = _controller.text.length;
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('搜索'),
        centerTitle: true,
      ),
      body: new Column(
        children: <Widget>[

          HomeTopView(show: show,),


        ],
      ),
    );
  }

  Widget _getTextFiled() {
    return TextField(
      enabled: false,
      controller: _controller,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.all(5),
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(15.0))),
      inputFormatters: <TextInputFormatter>[
        WhitelistingTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(20)
      ],
    );
  }

  double _sliderValue = 0;

  Widget _getSlideView() {
    return Slider(
      min: 0,
      max: 100,
      activeColor: Colors.red,
      inactiveColor: Colors.blue,
      value: _sliderValue,
      label: '$_sliderValue',
      divisions: 20,
      onChanged: (v) {
        setState(() {
          _sliderValue = v;
          print('Value : $v');
        });
      },
    );
  }

  Widget _getIosSlideView() {
    //根据不同的平台显示不同的样式 Slider.adaptive
    return CupertinoSlider(
      min: 0,
      max: 100,
      value: _sliderValue,
      onChanged: (v) {
        setState(() {
          _sliderValue = v;
          print('Value : $v');
        });
      },
    );
  }

  void showToast() {
    Fluttertoast.showToast(
      //吐司显示文字
        msg: 'Hello Toast',
        //小吐司
      toastLength: Toast.LENGTH_SHORT,
        //大吐司
//        toastLength: Toast.LENGTH_LONG,
        webBgColor: "#e74c3c",
        timeInSecForIosWeb: 5,
        //吐司背景颜色
        backgroundColor: Colors.red,
        //吐司字体颜色
        textColor: Colors.white,
      //吐司的位置
      gravity: ToastGravity.CENTER,
    );
  }
}


//new Row(
//children: <Widget>[
////              Expanded(
////                flex: 1,
////                child: Container(
////                  height: 60,
////                  padding: EdgeInsets.all(15),
////                  child: _getTextFiled(),
////                ),
////              ),
//
//
//
//GestureDetector(
//onTap: () {
//print('input text is : ${_controller.text}');
//setState(() {
//_color = Color(0xff00ff00);
//});
//},
//child: Padding(
//padding: EdgeInsets.only(right: 10),
//child: new Text('搜索'),
//),
//),
//],
//),
//Text(
//'${currentCount}/20',
//style: TextStyle(color: _color),
//),
//_getSlideView(),
//_getIosSlideView(),
//CupertinoActivityIndicator(
//radius: 10,
//),
//RaisedButton(
//onPressed: () {
//Navigator.of(context).push(MaterialPageRoute(builder: (_) {
//return ImagePickerPage();
//}));
//},
//child: Text('测试图库'),
//),
////          Image.file(_imageFiles.then((value) => null)),
//RaisedButton(
//onPressed: showToast,
//child: Text('吐司'),
//)