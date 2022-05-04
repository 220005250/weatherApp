import 'package:flutter/material.dart';
import 'package:tshitenge/view__model/weather_view_model.dart';
import 'package:provider/provider.dart';

class CityNameWidget extends StatelessWidget {
  const CityNameWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Selector<WeatherViewModel, String>(
        selector: (context, weatherViewModel) => weatherViewModel.cityName!,
        builder: (context, cityName, child) {
          return Text(cityName);
        });
  }
}
