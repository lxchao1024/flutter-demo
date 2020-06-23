import 'package:flutter/material.dart';
import 'package:flutterapp1/components/weather/WeatherInfoItem.dart';
import 'package:flutterapp1/model/weather_model.dart';
import 'package:provider/provider.dart';

class TravelPage extends StatefulWidget {
  @override
  createState() => TravelPageState();
}

class TravelPageState extends State<TravelPage> {
  WeatherModel weatherModel = WeatherModel();

  @override
  void initState() {
    super.initState();
    weatherModel.requestWeatherInfo();
  }

  @override
  Widget build(BuildContext context) {
    return new ChangeNotifierProvider<WeatherModel>(
      create: (context) => weatherModel,
      child: new Scaffold(
        appBar: new AppBar(
          title: new Text('Weather'),
          centerTitle: true,
        ),
        body: new Consumer<WeatherModel>(
          builder: (context, model, child) {
            return model.weatherDetailModel != null
                ? (ListView.builder(
                    itemCount: 1,
                    itemBuilder: (context, index) => WeatherInfoItem(
                      title: model.weatherDetailModel.basic.location,
                      icon: "今天",
                      temperature: "${model.weatherDetailModel.nowInfo.tmp}℃",
                      weatherDesc: model.weatherDetailModel.nowInfo.condtxt,
                      updateTime:
                          "最后更新: ${model.weatherDetailModel.updateInfo.loc}",
                    ),
                  ))
                : Container();
          },
        ),
      ),
    );
  }
}
