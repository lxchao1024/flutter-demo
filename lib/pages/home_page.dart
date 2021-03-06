import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutterapp1/dao/home_dao.dart';
import 'package:flutterapp1/model/common_model.dart';
import 'package:flutterapp1/model/grid_nav_model.dart';
import 'package:flutterapp1/model/sales_box_model.dart';
import 'package:flutterapp1/pages/search_page.dart';
import 'package:flutterapp1/widget/grid_nav.dart';
import 'package:flutterapp1/widget/local_nav.dart';
import 'package:flutterapp1/widget/sales_box.dart';
import 'package:flutterapp1/widget/search_bar.dart';
import 'package:flutterapp1/widget/sub_nav.dart';

const APPBAR_SCROLL_OFFSET = 100;
const SEARCH_BAR_DEFAULT_TEXT = '目的地 | 酒店 | 景点 | 航班号';

//https://www.devio.org/io/flutter_app/json/home_page.json

///首页
class HomePage extends StatefulWidget {
  @override
  createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  List<String> urls = [
    'https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=1303636189,2885099528&fm=26&gp=0.jpg',
    'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1592891076717&di=8e347aed99fdd1346e2f7e7abf25e11e&imgtype=0&src=http%3A%2F%2Fpic2.zhimg.com%2Fv2-bc0c14278ec0e2c604f9307a5323815b_1200x500.jpg',
    'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1592891076717&di=82e2528fcc66e662fa6a5db08fa4af4d&imgtype=0&src=http%3A%2F%2F5b0988e595225.cdn.sohucs.com%2Fimages%2F20180621%2Fa9213aa18c234533a22c0915b6ed61d7.png'
  ];

  double appBarAlpha = 0;
  String result = '正在请求数据中';
  List<CommonModel> bannerList = [];
  List<CommonModel> localNavList = [];
  List<CommonModel> subNavList = [];
  GridNavModel gridNav;
  SalesBoxModel salesBox;

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
    if (bannerList.length == 0) {
      HomeDao().fetch().then((value) {
        print(value.config.searchUrl);
        print(value.bannerList.length);
        print(value.salesBox);
        setState(() {
          result = value.config.searchUrl;
          bannerList = value.bannerList;
          localNavList = value.localNavList;
          subNavList = value.subNavList;
          gridNav = value.gridNav;
          salesBox = value.salesBox;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (bannerList.length == 0) {
      return Scaffold(
        body: Center(
          child: CupertinoActivityIndicator(
            radius: 18,
          ),
        ),
      );
    }
    return Scaffold(
      backgroundColor: Color(0xfff2f2f2),
      body: new Stack(
        children: <Widget>[
          MediaQuery.removePadding(
              context: context,
              // 去除状态栏的padding
              removeTop: true,
              child: new NotificationListener(
                  // ignore: missing_return
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
                          autoplay: true,
                          pagination: SwiperPagination(
                              builder: DotSwiperPaginationBuilder(
                                  color: Colors.deepOrange,
                                  activeColor: Colors.red)),
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.fromLTRB(7, 4, 7, 4),
                          child: LocalNav(localNavList: localNavList)),
                      Padding(
                          padding: EdgeInsets.fromLTRB(7, 0, 7, 4),
                          child: GridNav(gridNavModel: gridNav)),
                      Padding(
                          padding: EdgeInsets.fromLTRB(7, 0, 7, 4),
                          child: SubNav(subNavList: subNavList)),
                      Padding(
                          padding: EdgeInsets.fromLTRB(7, 0, 7, 4),
                          child: SalesBox(salesBox: salesBox)),
                    ],
                  ))),
          _appBar
        ],
      ),
    );
  }

  Widget _swiperItem(BuildContext context, int index) {
    return new Image.network(bannerList[index].icon, fit: BoxFit.fill);
  }

  Widget get _appBar {
    return Column(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0x66000000), Colors.transparent],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter
            )
          ),
          child: Container(
            padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
            height: 80,
            decoration: BoxDecoration(
              color: Color.fromARGB((appBarAlpha * 255).toInt(), 255, 255, 255)
            ),

            child: SearchBar(
              searchBarType: appBarAlpha > 0.2 ? SearchBarType.homeLight : SearchBarType.home,
              defaultText: SEARCH_BAR_DEFAULT_TEXT,
              inputBoxClick: _jumpToSearch,
              speakClick: _jumpToSearch,
              leftButtonClick: _jumpToSearch,
            ),
          ),
        ),
        Container(
          height: appBarAlpha > 0.2 ? 0.5 : 0,
          decoration: BoxDecoration(
            boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 0.5)]
          ),
        )
      ],
    );
  }

  _jumpToSearch() {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
      return SearchPage(showLeft: true);
    }));
  }

  @override
  bool get wantKeepAlive => true;
}
