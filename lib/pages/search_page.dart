import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  @override
  createState() => SearchPageState();
}

class SearchPageState extends State<SearchPage> {

  @override
  void initState() {
    super.initState();
    print("SearchPageInit");
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('搜索'),
        centerTitle: true,
      ),
      body: new Center(child: new Text('搜索')),
    );
  }
}