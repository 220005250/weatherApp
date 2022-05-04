import 'package:flutter/material.dart';
import 'package:tshitenge/main.dart';
import 'package:tshitenge/view__model/weather_view_model.dart';
import 'package:tshitenge/models/weather_data_model.dart';
import 'value_tile.dart';

import './themes.dart';

class WeatherWidget extends StatelessWidget {
  final WeatherData weather;

  WeatherWidget({required this.weather});

  @override
  Widget build(BuildContext context) {
    ThemeData appTheme = Themes.getTheme();

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            this.weather.cityName.toUpperCase(),
            style: TextStyle(
              fontSize: 25,
              letterSpacing: 5,
              color: appTheme.accentColor,
              fontWeight: FontWeight.w900,
            ),
          ),
          SizedBox(height: 20),
          Text(
            this.weather.weatherDescription,
            style: TextStyle(
              fontSize: 15,
              letterSpacing: 5,
              fontWeight: FontWeight.w100,
              color: appTheme.accentColor,
            ),
          ),
          // WeatherSwipePager(weather: weather),
          Padding(
            child: Divider(
              color: appTheme.accentColor.withAlpha(50),
            ),
            padding: EdgeInsets.all(10),
          ),
          //ForecastHorizontal(weathers: weather.forecast),
          Padding(
            child: Divider(
              color: appTheme.accentColor.withAlpha(50),
            ),
            padding: EdgeInsets.all(10),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            ValueTile(
              "wind speed",
              '${this.weather.windspeed} m/s',
              iconData: Icons.info_outline_rounded,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Center(
                  child: Container(
                width: 1,
                height: 30,
                color: appTheme.accentColor.withAlpha(50),
              )),
            ),
            ValueTile("sunrise", weather.sunrise.toIso8601String(),
                iconData: Icons.info_outline_rounded),
            Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Center(
                  child: Container(
                    width: 1,
                    height: 30,
                    color: appTheme.accentColor.withAlpha(50),
                  ),
                )),
            ValueTile("sunset", weather.sunset.toIso8601String(),
                iconData: Icons.info_outline_rounded),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Center(
                  child: Container(
                width: 1,
                height: 30,
                color: appTheme.accentColor.withAlpha(50),
              )),
            ),
            ValueTile("humidity", '${this.weather.humidity}%',
                iconData: Icons.info_outline_rounded),
          ]),
        ],
      ),
    );
  }
}
