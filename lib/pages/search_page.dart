import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///搜索
class SearchPage extends StatefulWidget {
  @override
  createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Search', style: TextStyle(fontFamily: 'Lobster', fontSize: 24)),
      ),
    );
  }
}