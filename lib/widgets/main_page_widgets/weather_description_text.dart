import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../view__model/weather_view_model.dart';

class WeatherDescriptionWidget extends StatelessWidget {
  const WeatherDescriptionWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Selector<WeatherViewModel, String?>(
      selector: (context, weatherViewModel) =>
          weatherViewModel.weatherDescription,
      builder: (context, weatherDescription, child) {
        return weatherDescription == null
            ? Container()
            : Stack(
                children: [
                  Positioned(
                    child: Text(
                      weatherDescription.toUpperCase(),
                      style: const TextStyle(fontSize: 30),
                    ),
                  ),
                ],
              );
      },
    );
  }
}
