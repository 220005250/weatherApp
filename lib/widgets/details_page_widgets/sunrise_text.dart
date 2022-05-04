import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../view__model/weather_view_model.dart';

class SunriseWidget extends StatelessWidget {
  const SunriseWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Selector<WeatherViewModel, DateTime?>(
      selector: (context, weatherViewModel) => weatherViewModel.sunrise,
      builder: (context, sunrise, child) {
        return sunrise == null
            ? Container()
            : Text(
                'Sunrise: $sunrise',
                style: const TextStyle(fontSize: 15),
              );
      },
    );
  }
}
