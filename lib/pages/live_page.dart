import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LivePage extends StatefulWidget {
  @override
  createState() => _LivePageState();
}

class _LivePageState extends State<LivePage> {
  List list;
  ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _refresh();
    _scrollController = ScrollController()
      ..addListener(() {
        //判断是否滑动到底部
        if (_scrollController.position.pixels ==
            _scrollController.position.maxScrollExtent) {
          _loadMore();
        }
      });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RefreshIndicator(
          displacement: 10,
          child: list == null
              ? Center(child: CupertinoActivityIndicator(radius: 10))
              : list.isEmpty
                  ? Center(
                      child: GestureDetector(
                          onTap: () => _refreshHandle(),
                          child: Text('没有数据,可以点击')))
                  : ListView.builder(
                      itemCount: list.length + 1,
                      controller: _scrollController,
                      itemBuilder: (context, index) {
                        if (index == list.length) {
                          return _buildLoadMore();
                        }
                        return ListTile(
                          title: Text(list[index]),
                        );
                      }),
          onRefresh: _refresh,
        ),
      ),
    );
  }

  Future<void> _refresh() async {
    await Future.delayed(Duration(seconds: 3), () {
      setState(() {
        list = List();
      });
    });
  }

  Future<void> _refreshHandle() async {
    await Future.delayed(Duration(seconds: 1), () {
      setState(() {
        list =
            List.generate(Random().nextInt(20) + 15, (index) => 'item $index');
      });
    });
  }

  Future _loadMore() async {
    await Future.delayed(Duration(seconds: 2), () {
      setState(() {
        list.addAll(List.generate(
            Random().nextInt(5) + 1, (index) => 'more item $index'));
      });
    });
  }

  Widget _buildLoadMore() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child:Row(
        mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CupertinoActivityIndicator(radius: 10),
            Padding(
              padding: EdgeInsets.only(left: 5),
              child: Text('正在加载...'),
            )
          ],
        ),
    );
  }
}
