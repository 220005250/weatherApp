import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../view__model/weather_view_model.dart';

class FeelsLikeWidget extends StatelessWidget {
  // const FeelsLikeWidget({Key? key,}) : super(key: key);

//////////////////////////////////////////
  const FeelsLikeWidget({
    Key? key,
  }) : super(key: key);
/////////////////////////////////////////

  @override
  Widget build(BuildContext context) {
    return Selector<WeatherViewModel, double?>(
      selector: (context, weatherViewModel) => weatherViewModel.feelsLike,
      builder: (context, feelsLike, child) {
        return Text(
          'FEELS LIKE: $feelsLike °C',
          style: const TextStyle(fontSize: 25, color: Colors.white),
        );
      },
    );
  }
}
