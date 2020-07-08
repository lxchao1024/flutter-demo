import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///搜索
class SearchPage extends StatefulWidget {
  @override
  createState() => SearchPageState();
}

class SearchPageState extends State<SearchPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Search'),
      ),
    );
  }
}