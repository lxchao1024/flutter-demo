import 'package:flutterapp1/model/common_model.dart';
import 'package:flutterapp1/model/config_model.dart';
import 'package:flutterapp1/model/grid_nav_model.dart';
import 'package:flutterapp1/model/seals_box_model.dart';

class HomeModel {
  final ConfigModel config;
  final List<CommonModel> bannerList;
  final List<CommonModel> localNavList;
  final List<CommonModel> subNavList;
  final GridNavModel gridNav;
  final SealsBoxModel sealsBox;

  HomeModel(
      {this.config,
      this.bannerList,
      this.localNavList,
      this.subNavList,
      this.gridNav,
      this.sealsBox});

  factory HomeModel.fromJson(Map<String, dynamic> json) {
    var bannerListJson = json['bannerList'] as List;
    List<CommonModel> bannerList =
        bannerListJson.map((i) => CommonModel.fromJson(i)).toList();

    var localNavListJson = json['localNavList'] as List;
    List<CommonModel> localNavList =
        localNavListJson.map((i) => CommonModel.fromJson(i)).toList();

    var subNavListJson = json['subNavList'] as List;
    List<CommonModel> subNavList =
        subNavListJson.map((i) => CommonModel.fromJson(i)).toList();

    return HomeModel(
      config: ConfigModel.fromJson(json['config']),
      bannerList: bannerList,
      localNavList: localNavList,
      subNavList: subNavList,
      gridNav: GridNavModel.fromJson(json['gridNav']),
      sealsBox: SealsBoxModel.fromJson(json['salesBox']),
    );
  }
}
