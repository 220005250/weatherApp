import 'package:flutter/material.dart';
import '../views/pages/details_page.dart';
import '../views/pages/main_page.dart';

class WeatherRouteManager {
  static const String mainPage = '/';
  static const String detailsPage = '/detailsPage';

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case mainPage:
        return MaterialPageRoute(
          builder: (context) => const MainPage(),
        );

      case detailsPage:
        return MaterialPageRoute(
          builder: (context) => const DetailsPage(),
        );

      default:
        throw Exception('This route does not exist. Check routes again!');
    }
  }
}
