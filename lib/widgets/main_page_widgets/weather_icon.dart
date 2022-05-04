import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../view__model/weather_view_model.dart';

class WeatherIconWidget extends StatelessWidget {
  const WeatherIconWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Selector<WeatherViewModel, String?>(
        selector: (context, weatherViewModel) => weatherViewModel.weatherIcon,
        builder: (context, weatherIcon, child) {
          return CachedNetworkImage(
            imageUrl: weatherIcon!,
          );
        });
  }
}
