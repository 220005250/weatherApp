import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tshitenge/routes/weather_route_manager.dart';
import 'package:tshitenge/view__model/weather_view_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => WeatherViewModel(),
        ),
      ],
      builder: (context, child) {
        return const MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: WeatherRouteManager.mainPage,
          onGenerateRoute: WeatherRouteManager.onGenerateRoute,
        );
      },
    );
  }
}
