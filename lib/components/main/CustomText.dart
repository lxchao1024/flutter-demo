import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  
  final double size;
  final Color color;
  final String text;
  final double marginLeft;
  final double marginTop;
  final double marginRight;
  final double marginBottom;

  CustomText({ 
    this.text, 
    this.size,
    this.color = Colors.white, 
    this.marginLeft = 3, 
    this.marginTop = 3, 
    this.marginRight = 3, 
    this.marginBottom = 3, 
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: marginLeft, 
        top: marginTop,  
        right: marginRight, 
        bottom: marginBottom
      ),
      child: Text(text, style: TextStyle(color: color, fontSize: size),),
    );
  }
}