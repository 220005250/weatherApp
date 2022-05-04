import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../view__model/weather_view_model.dart';

class TemperatureWdget extends StatelessWidget {
  const TemperatureWdget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Selector<WeatherViewModel, double?>(
      selector: (context, weatherViewModel) => weatherViewModel.temperature,
      builder: (context, temperature, child) {
        return temperature == null
            ? Container()
            : Text(
                '$temperature °C',
                style: const TextStyle(fontSize: 30),
              );
      },
    );
  }
}
