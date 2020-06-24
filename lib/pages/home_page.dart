import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutterapp1/dao/home_dao.dart';
import 'package:flutterapp1/model/common_model.dart';

const APPBAR_SCROLL_OFFSET = 100;
//https://www.devio.org/io/flutter_app/json/home_page.json
class HomePage extends StatefulWidget {
  @override
  createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  List<String> urls = [
    'https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=1303636189,2885099528&fm=26&gp=0.jpg',
    'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1592891076717&di=8e347aed99fdd1346e2f7e7abf25e11e&imgtype=0&src=http%3A%2F%2Fpic2.zhimg.com%2Fv2-bc0c14278ec0e2c604f9307a5323815b_1200x500.jpg',
    'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1592891076717&di=82e2528fcc66e662fa6a5db08fa4af4d&imgtype=0&src=http%3A%2F%2F5b0988e595225.cdn.sohucs.com%2Fimages%2F20180621%2Fa9213aa18c234533a22c0915b6ed61d7.png'
  ];

  double appBarAlpha = 0;
  String result = '正在请求数据中';
  List<CommonModel> bannerList = [];

  _onScroll(double offset) {
    double alpha = offset / APPBAR_SCROLL_OFFSET;
    if (alpha < 0) {
      alpha = 0;
    } else if (alpha > 1) {
      alpha = 1;
    }
    setState(() {
      appBarAlpha = alpha;
    });
    print(alpha);
  }

  @override
  void initState() {
    super.initState();
    print('initState ---- HomePage');
    HomeDao().fetch(null).then((value) {
      print(value.config.searchUrl);
      print(value.bannerList.length);
      setState(() {
        result = value.config.searchUrl;
        bannerList = value.bannerList;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Stack(
        children: <Widget>[
          MediaQuery.removePadding(
              context: context,
              // 去除状态栏的padding
              removeTop: true,
              child: new NotificationListener(
                  onNotification: (scrollNotification) {
                    if (scrollNotification is ScrollUpdateNotification &&
                        scrollNotification.depth == 0) {
                      _onScroll(scrollNotification.metrics.pixels);
                    }
                  },
                  child: new ListView(
                    children: <Widget>[
                      Container(
                        height: 160.0,
                        child: new Swiper(
                          itemCount: bannerList.length,
                          itemBuilder: _swiperItem,
                          pagination: SwiperPagination(
                            builder: DotSwiperPaginationBuilder(
                              color: Colors.deepOrange,
                              activeColor: Colors.red
                            )
                          ),
                        ),
                      ),
                      Container(
                        height: 1200,
                        decoration: BoxDecoration(color: Colors.white),
                        child: new Text(result),
                      )
                    ],
                  ))),
          Opacity(
            opacity: appBarAlpha,
            child: Container(
              height: 80,
              decoration: BoxDecoration(color: Colors.blue),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: new Text('首页', style: TextStyle(color: Colors.white, fontSize: 18.0)),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _swiperItem(BuildContext context, int index) {
    return new Image.network(bannerList[index].icon, fit: BoxFit.fill);
  }
}
