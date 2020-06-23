import 'package:flutter/material.dart';
import 'package:flutterapp1/components/main/CustomText.dart';
import 'package:flutterapp1/components/weather/WeatherCloudy.dart';

class WeatherInfoItem extends StatelessWidget {

  final String title;
  final String icon;
  final String temperature;
  final String weatherDesc;
  final String updateTime;

  WeatherInfoItem({ 
    this.title,
    this.icon,
    this.temperature,
    this.weatherDesc,
    this.updateTime,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        gradient: RadialGradient( //背景径向渐变
          colors: [Theme.of(context).primaryColor, Theme.of(context).primaryColor],
          center: Alignment.topLeft,
          radius: .98
        ),
        boxShadow: [ 
          //卡片阴影
          BoxShadow(
              color: Colors.black54,
              offset: Offset(2.0, 2.0),
              blurRadius: 4.0
          )
        ]
      ),
      margin: EdgeInsets.all(16),
      padding: EdgeInsets.all(10.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child:  Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                CustomText(text: title, size: 18),
                CustomText(text: temperature, size: 30),
                CustomText(text: weatherDesc, size: 16),
              ],
            ),
          ),
          Column(
            children: <Widget>[
              // WeatherSunny(size: 60),
              WeatherCloudy(width: 80, height: 80,),
              CustomText(text: updateTime, size: 11, marginTop: 20),
            ],
          )
        ],
      ),
    );
  }
}