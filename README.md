```
name: flutterapp1
description: A new Flutter application.

version: 1.0.0+1

environment:
  sdk: ">=2.7.0 <3.0.0"

dependencies:
  flutter:
    sdk: flutter

  cupertino_icons: ^0.1.3
  dio: ^1.0.13
  timeago: ^2.0.10
  scoped_model: ^1.0.1
  event_bus: ^1.0.1
  shimmer: ^0.0.6
  flutter_swiper : ^1.1.6
  webview_flutter: ^0.3.22+1
  image_picker: ^0.6.7+2
  fluttertoast: ^4.0.0

  provider: ^4.0.2
  fluro: ^1.5.1
  amap_location_fluttify: ^0.10.0+e74b91b

dev_dependencies:
  flutter_test:
    sdk: flutter

flutter:

  uses-material-design: true

  assets:
    - assets/images/icon_home_tab.png
    - assets/images/icon_home_tab_pressed.png
    - assets/images/icon_popular_tab.png
    - assets/images/icon_popular_tab_pressed.png
    - assets/images/icon_movie_tab.png
    - assets/images/icon_movie_tab_pressed.png
    - assets/images/icon_mine_tab.png
    - assets/images/icon_mine_tab_pressed.png
    - assets/images/icon_empty.webp
    - assets/images/icon_load_error.png
    - assets/images/icon_placeholder.png
    - assets/images/icon_default_avatar.png
    - assets/images/icon_videodetail_num.png
    - assets/images/icon_videodetail_jishu.png
    - assets/images/icon_videodetail_name.png
    - assets/images/icon_videodetail_playlist.png
    - assets/images/icon_videodetail_director.png
    - assets/images/icon_videodetail_starring.png
    - assets/images/icon_videodetail_desc.png
    - assets/images/icon_rain.png
    - assets/images/icon_yin.png
    - assets/images/icon_sunny.png
    - assets/images/icon_snoy.png
    - assets/images/splash.jpg

  fonts:
    - family: Lobster
      fonts:
        - asset: assets/fonts/Lobster-1.4.otf
        # style: italic
    - family: FZLanTing
      fonts:
        - asset: assets/fonts/FZLanTingHeiS-DB1-GB-Regular.TTF
```