import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutterapp1/components/weather/WeatherSunny.dart';

class WeatherCloudy extends StatelessWidget {

  final double width;
  final double height;

  const WeatherCloudy({ this.width, this.height });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: Stack(
        children: <Widget>[
          Positioned(
            left: 20,
            top: 10,
            child: WeatherSunny(
              size: 50,
            ),
          ),
          Positioned(
            left: 0,
            top: 20,
            child: Icon(
            Icons.cloud,
              size: 60,
              color: Colors.grey,
            ),
          )
        ]
      ) ,
    );
  }
}