import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../view__model/weather_view_model.dart';

class WindSpeedWidget extends StatelessWidget {
  const WindSpeedWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Selector<WeatherViewModel, double?>(
      selector: (context, weatherViewModel) => weatherViewModel.windspeed,
      builder: (context, windspeed, child) {
        return Text(
          'Windspeed: $windspeed m/s',
          style: const TextStyle(fontSize: 15),
        );
      },
    );
  }
}
