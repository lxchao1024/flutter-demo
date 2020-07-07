import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
///官方demo代码
class OfficialApp extends StatefulWidget {
  @override
  createState() => _OfficialAppState();
}

class _OfficialAppState extends State<OfficialApp> {

  final wordPair = WordPair.random();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'First app',
      home: Scaffold(
        appBar: AppBar(
          title: Text('First App'),
        ),
        body: Center(
          child: Text(wordPair.asPascalCase),
        ),
      ),
    );
  }
}
