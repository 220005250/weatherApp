import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../view__model/weather_view_model.dart';

class PressureWidget extends StatelessWidget {
  const PressureWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Selector<WeatherViewModel, double?>(
      selector: (context, weatherViewModel) => weatherViewModel.pressure,
      builder: (context, pressure, child) {
        return pressure == null
            ? Container()
            : Text(
                'Pressure: $pressure',
                style: const TextStyle(fontSize: 15),
              );
      },
    );
  }
}
