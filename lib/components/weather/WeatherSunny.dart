  
import 'dart:math';
import 'package:flutter/material.dart';

class WeatherSunny extends StatefulWidget {

  final double size;

  const WeatherSunny({ this.size });

  @override
  _State createState() => _State();
}

class _State extends State<WeatherSunny> with SingleTickerProviderStateMixin {

  Animation _animation;
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: Duration(seconds: 60));
    _animation = Tween(begin: 0.0, end: 1.0).animate(_controller);
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reset();
        _controller.forward();
      }
    });
    _controller.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (ctx, child) {
        return Container(
          child: Transform.rotate(
            angle: pi * 2 * _animation.value * 5,
            child: child,
          ),
        );
      },
      child: Icon(
        Icons.wb_sunny,
        size: widget.size,
        color: Colors.white,
      ),
    );
  }
}