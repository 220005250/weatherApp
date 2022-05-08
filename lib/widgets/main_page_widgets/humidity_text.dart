import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../view__model/weather_view_model.dart';

class HumidityWidget extends StatelessWidget {
  const HumidityWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Selector<WeatherViewModel, double?>(
      selector: (context, weatherViewModel) => weatherViewModel.humidity,
      builder: (context, humidity, child) {
        return humidity == null
            ? Container()
            : Text(
                'Humidity: $humidity',
                style: const TextStyle(fontSize: 22, color: Colors.white),
              );
      },
    );
  }
}
