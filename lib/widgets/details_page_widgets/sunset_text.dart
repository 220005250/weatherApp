import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../view__model/weather_view_model.dart';

class SunsetWidget extends StatelessWidget {
  const SunsetWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Selector<WeatherViewModel, DateTime?>(
      selector: (context, weatherViewModel) => weatherViewModel.sunset,
      builder: (context, sunset, child) {
        return sunset == null
            ? Container()
            : Text(
                'Sunset: $sunset',
                style: const TextStyle(fontSize: 15),
              );
      },
    );
  }
}
